function [Conc,Time,StepIndex,k_solar,SZA_solar,days_solar,dcaer_ll,initinfo,aer_conc] = ...
    IntegrateStep(istep,nIc,conc_init,conc_last,conc_bkgd,ModelOptions,Chem,k,Sbroad,Sslice,Mbroad,Mslice,t_start,Cnames)
% function [Conc,Time,StepIndex,k_solar,SZA_solar,days_solar] = ...
%     IntegrateStep(istep,nIc,conc_init,conc_last,conc_bkgd,ModelOptions,Chem,k,Sbroad,Sslice,Mbroad,Mslice)
% Performs integration of chemical ODEs for a single set of inputs/constraints.
%
% INPUTS:
%   istep:          scalar index for current step
%   nIC:            total number of steps
%   conc_init:      1-D vector if initial concentrations
%   conc_last:      1-D vector of output from previous step. Only needed if steps are linked.
%   conc_bkgd:      1-D vector of background concentrations
%   ModelOptions:   structure of model options
%   Chem:           structure of chemistry variables (ChemFiles,f,iG,iRO2,Family,iHold,lr_flag)
%   k:              1-D vector of reaction rate coefficients
%   Sbroad:         SolarParam broadcast variable structure, generated from struct2parvar
%   Sslice:         SolarParam sliced variable 1-D array
%   Mbroad:         Met broadcast variable structure
%   Mslice:         Met sliced variable 1-D array
%   t_start:        start time for integration (0, unless linking steps)
%
% OUTPUTS (size depends on ModelOptions)
%   Conc:       matrix of calculated concentrations
%   Time:       integration time, s
%   StepIndex:  linear index for step
%   k_solar:    rate constants used in solar cycle calculation
%   SZA_solar:  SZA cycle used in solar cycle calculation
%   days_solar: number of days for a solar cycle step
%
% 20180227 GMW
% 20190828 GMW  Added convergence criteria
% 20190930 GMW  Added t_start input
% 20200414 GMW  Removed irep input and RepIndex output

% print message
if ModelOptions.Verbose >= 2
    fprintf('Step %u of %u\n',istep,nIc)
    tic
end

%% MASSAGE INPUTS

Met         = parvar2struct(Mbroad,Mslice);
SolarParam  = parvar2struct(Sbroad,Sslice);

if ~isnan(SolarParam.nDays), SolarFlag = 1;
else,                        SolarFlag = 0;
end

nSp = length(conc_init);

%% GET SOLAR-EVOLVING CHEMISTRY
if SolarFlag
    
    %%%%% CALCULATE SZA CYCLE %%%%%
    cycleTime  = ModelOptions.IntTime:ModelOptions.IntTime:86400; %cycle for one day
    if SolarParam.nDays == -1 %converge mode
        extendTime = cycleTime;
    else
        extendTime = repmat(cycleTime,1,SolarParam.nDays);
    end
    nSolar = length(extendTime);
    
    % sun_position inputs are structures
    sTime.year  = SolarParam.startTime(1); 
    sTime.month = SolarParam.startTime(2);
    sTime.day   = SolarParam.startTime(3); 
    sTime.hour  = SolarParam.startTime(4);
    sTime.min   = SolarParam.startTime(5); 
    sTime.sec   = SolarParam.startTime(6) + extendTime;
    sTime.UTC   = 0;
    
    location.longitude  = SolarParam.lon;
    location.latitude   = SolarParam.lat;
    location.altitude   = SolarParam.alt;
    
    sun = sun_position(sTime,location); %zenith and azimuth angles of sun
    sun.zenith(sun.zenith>90) = 90;
    
    %%%%% EXTEND MET %%%%%
    Mnames = fieldnames(Met);
    for m = 1:length(Mnames)
        solarMet.(Mnames{m}) = repmat(Met.(Mnames{m}),nSolar,1);
    end
    solarMet.SZA = sun.zenith;
    
    %calculate rate constants
    [~,~,k] = InitializeChemistry(solarMet,Chem.ChemFiles,ModelOptions,0);
    
else
    nSolar = 1; %dummy variable for integration loop
end

%% DO INTEGRATION

% ouputs
Conc = nan(nSolar,nSp); %placeholder only; might get overwritten if output is single-point
Time = nan(nSolar,1);

% convergence stuff
converged = 0;
days_solar = 0; %increments for each loop
conc_conv_old = conc_init(SolarParam.Converge.iConv);

%loop de loops
while ~converged
    days_solar = days_solar + 1;
    
    for h = 1:nSolar
        
        if ModelOptions.Verbose >= 4 && SolarFlag
            fprintf('  Solar Cycle %u of %u\n',h,nSolar);
        end
        
        %%%%% INITIALIZE CONCENTRATIONS %%%%%
        if isempty(conc_last) % first solar loop only
            conc_init_step = conc_init;
        else
            conc_init_step = conc_last; %carry over end concs from previous step
            conc_init_step(Chem.iHold) = conc_init(Chem.iHold); % override for held species
            
            if ModelOptions.FixNOx
                modelNOx = conc_last(Chem.iNOx);
                initNOx = conc_init(Chem.iNOx);
                conc_init_step(Chem.iNOx) = modelNOx.*sum(initNOx)./sum(modelNOx);
            end
        end
        
        % Solar cycle daily reset option
        if SolarParam.resetConcDaily && h > 1 && extendTime(h) == ModelOptions.IntTime
            conc_init_step(Chem.iInit) = conc_init(Chem.iInit);
        end
        
        % family init
        Fnames = fieldnames(Chem.Family);
        for i = 1:length(Fnames)
            j = Chem.Family.(Fnames{i}).index;
            s = Chem.Family.(Fnames{i}).scale;
            
            % total family conc to conserve
            Chem.Family.(Fnames{i}).conc = sum(conc_init(j).*s);
            
            % determine partitioning using current conditions
            conc_init_step(j) = Chem.Family.(Fnames{i}).conc .* s.*conc_init_step(j)./sum(conc_init_step(j).*s);
        end
        
        %%%%% CALL ODE SOLVER %%%%%
        param = {...    %parameters for dydt_eval
            k(h,:),...
            Chem.f,...
            Chem.iG,...
            Chem.iRO2,...
            Chem.iHold,...
            Met.kdil,...
            Met.tgauss,...
            conc_bkgd,...
            ModelOptions.IntTime,...
            ModelOptions.Verbose,...
            Chem.Family,...
            Chem.iLR,...
            0,... %Jac_flag
            t_start,...
            };
        
        options = odeset;
        
        %Jacobian speeds integration
        options = odeset(options,'Jacobian',@(t,conc_out) Jac_eval(t,conc_out,param));
        
        % mass matrix for family treatment
        options = odeset(options,'Mass',@(t,conc_out) Mass_eval(t,conc_out,param));
        options = odeset(options,'InitialSlope',dydt_eval(0,conc_init_step',param));
        %     options = odeset(options,'MStateDependence','strong');
        
%         options = odeset(options,'NonNegative',1:length(conc_init_step));
        
        % call ode solver
        t_span = [0 ModelOptions.IntTime];% + t_start;
        [time_out,conc_out] = ode15s(@(t,conc_out) dydt_eval(t,conc_out,param),...
            t_span,conc_init_step',options);
        
        %%%%% OUTPUT %%%%%
        time_out = time_out + t_start; % time offset
        if ModelOptions.EndPointsOnly
            Conc = conc_out(end,:);
            Time = time_out(end);
        elseif SolarFlag
            % in this case (EndPointsOnly = 0 + Solar cycle), output end of each mini-step
            Conc(h,:) = conc_out(end,:);
            Time(h) = time_out(end);
        else
            % EndPointsOnly = 0 but not Solar
            Conc = conc_out;
            Time = time_out;
        end
        
        % ==================Call SOA model========================
        conc_last = conc_out(end,:);
        gasOut = conc_out(end,:)./2.46e10; % conversion molec/cm3 to ppb
        tableData = array2table(gasOut, 'VariableNames', Cnames);
        initinfo = initializeSOA(tableData);
        
        disp('Initialize SOA model')
         % initialize next step if needed
        dummytable = array2table(initinfo.oaspc.alpha', 'VariableNames', initinfo.oaspc.gas_name);
        columnNames1 = initinfo.dgas1.Properties.VariableNames;
        columnNames2 = tableData.Properties.VariableNames;
        columnNames3 = dummytable.Properties.VariableNames;
        [isPresent, loc] = ismember(columnNames1, columnNames2);
        colIND1 = loc(isPresent);
        [isPresent, loc] = ismember(columnNames1, columnNames3);
        colIND2 = loc(isPresent);
        %disp(conc_out(end,colIND1));

        initinfo.og_conc_init(colIND2) = gasOut(colIND1);
        [og_conc,aer_conc,dcaer_ll] = orgaer(1,initinfo,1); % og_conc in ug/m3

        og_conc2gasModel = (og_conc ./ (fillmissing(initinfo.mwdf.og_mw,'constant', 0)*initinfo.factor))*2.46e10; % ug/m3 -> ppb -> molec/cm3
        disp(og_conc2gasModel(colIND2,:));
        conc_last(:,colIND1) = og_conc2gasModel(colIND2,:);
        %disp(conc_last);
        t_start = time_out(end);
        
    end %end Solar for-loop
    
    %%%%% CHECK FOR CONVERGENCE %%%%%
    if SolarParam.nDays == -1
        conc_conv_new = conc_last(SolarParam.Converge.iConv);
        percent_change = abs(conc_conv_old./conc_conv_new - 1)*100;
        percent_change(conc_conv_new < 1) = []; %exclude low concentrations
        
        if ModelOptions.Verbose >= 3
            fprintf('  Convergence: %u days, %g percent change\n',days_solar,round(max(percent_change),1))
        end
        
        % to stop or not to stop?
        if isempty(percent_change)
            converged = 1;
            warning('IntegrateStep:NoChange','Converge.Species are stuck at 0. Choose some different ones.')
        elseif all(percent_change < SolarParam.Converge.MaxPctChange) %converged
            converged = 1;
        elseif days_solar >= SolarParam.Converge.MaxDays %timeout
            converged = 1;
            warning('IntegrateStep:Timeout','Solar cycle failed to converge after %u days.',days_solar)
        else %keep going
            conc_conv_old = conc_conv_new;
        end
        
    else %if not using converge criteria
        converged = 1; %short-circuit while loop if convergence criteria unused
        days_solar = SolarParam.nDays;
    end
    
end %end convergence while loop
        

%%%%% OTHER OUTPUTS %%%%%
StepIndex = istep.*ones(size(Time));
        
if SolarFlag
    SZA_solar = solarMet.SZA;
    if ModelOptions.EndPointsOnly
        k_solar = k(end,:);
    else
        k_solar = k;
    end
else
    SZA_solar = [];
    k_solar = [];
    days_solar = [];
end

if ModelOptions.Verbose >= 2
    dt = datestr(toc/86400,'HH:MM:SS');
    fprintf('  Step %u time: %s\n',istep,dt)
end



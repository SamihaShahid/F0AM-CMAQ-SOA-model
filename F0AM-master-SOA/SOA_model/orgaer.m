function [og_conc,aer_conc,dcaer_ll] = orgaer(idx,initinfo,sep)
    %% Samiha Binte Shahid; email: sbint003@ur.edu
    %% Model unit ppb
    %%
    if sep==1
        try
            allcols = initinfo.oaspc.gas_name;
            cols = setdiff(allcols, {''});
            excludeColIndices = find(ismember(allcols, cols));
            aa = initinfo.dgas1(idx,allcols(excludeColIndices));
            bb = rows2vars(aa);
            oginp = initinfo.oaspc;
            oginp.NewColumn = bb.Var1;
            disp(idx);
        catch exception
            oginp = initinfo.oaspc;
            oginp.NewColumn = zeros(height(initinfo.oaspc),1);
        end
    
        try
            allcols = initinfo.oaspc.ctr_name;
            cols = setdiff(allcols, {''});
            excludeColIndices = find(ismember(allcols, cols));
            includeColIndices = find(~ismember(allcols, cols));
            aa = initinfo.dgas2(idx,allcols(excludeColIndices));
            bb = rows2vars(aa);
            if ~isempty(includeColIndices)
                rowsBefore = bb(1:includeColIndices(1)-1,:);
                rowsAfter = bb(includeColIndices(1):end,:);
                OriginalVariableNames = repmat({'MISSING'}, length(includeColIndices), 1);
                newRows = table(OriginalVariableNames);
                newRows.Var1 = zeros(length(includeColIndices),1);
                bb = vertcat(rowsBefore, newRows, rowsAfter);
            end
            roginp = initinfo.oaspc;
            roginp.NewColumn = bb.Var1;
            disp(roginp);
        catch exception
            roginp = initinfo.oaspc;
            roginp.NewColumn = zeros(height(initinfo.oaspc),1);
        end
        %og_conc = fillmissing(initinfo.og_conc_init * initinfo.factor .* fillmissing(initinfo.mwdf.og_mw,'constant', 0), 'constant', initinfo.min_gasconc);
        og_conc = initinfo.og_conc_init * initinfo.factor .* fillmissing(initinfo.mwdf.og_mw,'constant', 0); %+ (oginp{idx,:} * initinfo.factor * initinfo.mwdf.og_mw).fillna(initinfo.min_gasconc));
        rog_dconc = fillmissing(roginp.NewColumn * initinfo.factor .* fillmissing(initinfo.mwdf.rog_mw,'constant', 0), 'constant', initinfo.min_gasconc);
    else
        %og_conc = fillmissing(oginp.NewColumn * initinfo.factor .* fillmissing(initinfo.mwdf.og_mw,'constant', 0), 'constant', initinfo.min_gasconc);
        %og_conc = initinfo.og_conc_init; %+ (oginp{idx,:} * initinfo.factor * initinfo.mwdf.og_mw).fillna(initinfo.min_gasconc));
        rog_dconc = ones(length(og_conc),1) .* initinfo.min_gasconc;
    end

    disp(rog_dconc);

    % og_conc = (oginp{idx,:} * initinfo.factor * initinfo.mwdf.og_mw).fillna(initinfo.min_gasconc);
    % disp(og_conc(15:18));
    %initinfo.df_ogConc_init{idx,:} = og_conc;
    %rog_dconc = fillmissing(roginp.NewColumn * initinfo.factor .* initinfo.mwdf.rog_mw, 'constant', initinfo.min_gasconc);
    
    tt1 = initinfo.tref / initinfo.airtemp;
    tt2 = initinfo.trefm1 - 1.0 / initinfo.airtemp;
    convfac = tt1 * initinfo.airpres * initinfo.prefm1;
    
    % Transfer all non-vol reactive organic gases (rog) to accum mode
    totrog = rog_dconc;
    for i = 1:initinfo.n_oa_NotTracers
        if (initinfo.oaspc.nonvol(i) && initinfo.oaspc.alpha(i) > 0.0)
            initinfo.aerospc_conc(i, 2) = initinfo.aerospc_conc(i, 2) + initinfo.oaspc.alpha(i) * totrog(i);
        end
    end
    
    % Equilibrium partitioning calc.
    threshold = 0;
    upb = 0;
    nsvol = 1;
    totorgnv = sum(sum(initinfo.aerospc_conc(:,1:2), 2) ./ initinfo.aerospc_mw);
    totorg = sum(sum(initinfo.aerospc_conc(:,1:2), 2) .* initinfo.aerospc_mwinv);
    
    for i = 1:initinfo.n_oa
        if ~initinfo.oaspc.nonvol(i)
            initinfo.svname{nsvol} = strtrim(initinfo.oaspc.name{i});
            initinfo.caer0(nsvol) = initinfo.aerospc_conc(i, 1) + initinfo.aerospc_conc(i, 2);
            initinfo.ctoti(nsvol) = og_conc(i) + initinfo.aerospc_conc(i, 1) + initinfo.aerospc_conc(i, 2);
            tempcorr = tt1 * exp(initinfo.oaspc.enth(i) * initinfo.rgas1 * tt2);
            initinfo.c0(nsvol) = initinfo.oaspc.cstar(i) * tempcorr;
            initinfo.prod(nsvol) = initinfo.oaspc.alpha(i) * totrog(i);
            initinfo.ctotf(nsvol) = initinfo.ctoti(nsvol) + fillmissing(initinfo.prod(nsvol),'constant', 0);
            
            if ~initinfo.alist.Tracer(i)
                threshold = threshold + fillmissing(initinfo.ctotf(nsvol),'constant', 0) / initinfo.c0(nsvol);
                faer = totorg ./ (totorg + initinfo.c0(nsvol) .* initinfo.mw_inv(i));
                initinfo.caer(nsvol) = initinfo.ctotf(nsvol) .* faer;
                upb = upb + fillmissing(initinfo.ctotf(nsvol),'constant', 0) .* initinfo.mw_inv(i);
            end
            
            initinfo.svmw_inv(nsvol) = initinfo.mw_inv(i);
            initinfo.svmw(nsvol) = initinfo.op_mw(i);
            nsvol = nsvol + 1;
        end
    end
    
    %dcaer_arr = zeros(size(initinfo.oaspc, 1), 1);
    %ogconc_arr = zeros(size(initinfo.oaspc, 1), 1);
    
    if threshold > 1.0 || totorgnv > initinfo.threshmin
        lowb = totorgnv;
        upb = lowb + upb;
        
        if abs(upb - lowb) < initinfo.threshmin
            orgmoles = (lowb + upb) / 2.0;
        else
            upb = upb * (2.0 + 1e-7 * double(initinfo.n_oa_NotTracers));
            orgmoles = soabisect(lowb, upb, totorgnv, initinfo.nsvol_NotTracers, initinfo.c0, initinfo.ctotf, initinfo.svmw);
        end
        
        for i = 1:initinfo.nsvol_NotTracers
            faer = initinfo.svmw(i) * orgmoles ./ (initinfo.c0(i) + initinfo.svmw(i) * orgmoles);
            initinfo.caer(i) = initinfo.ctotf(i) * faer;
        end
        
        nsvol = 1;
        for i = 1:initinfo.n_oa
            if ~initinfo.oaspc.nonvol(i)
                if initinfo.caer(nsvol) < realmin('single')
                    fprintf('caer less than zero for OA species: %s %f, reset to evapmin.\n', initinfo.oaspc.name{i}, initinfo.caer(nsvol));
                    initinfo.ctotf(nsvol) = initinfo.ctotf(nsvol) - initinfo.caer(nsvol) + initinfo.evapmin;
                    initinfo.caer(nsvol) = initinfo.evapmin;
                end
                
                if initinfo.caer(nsvol) - initinfo.ctotf(nsvol) > realmin('single')
                    fprintf('caer exceeds ctotf at i = %d\n', i);
                    fprintf('caer: %f ctotf: %f\n', initinfo.caer(nsvol), initinfo.ctotf(nsvol));
                    fprintf('caer reset to ctotf\n');
                    initinfo.caer(nsvol) = initinfo.ctotf(nsvol);
                end
                
                dcaer = initinfo.caer(nsvol) - initinfo.caer0(nsvol);
                totaer = max(sum(initinfo.aerospc_conc(i,:)), initinfo.conmin);
                
                for im = 1:2
                    if dcaer < 0
                        phi = initinfo.aerospc_conc(i, im) ./ totaer;
                        initinfo.aerospc_conc(i, im) = initinfo.aerospc_conc(i, im) + dcaer * phi;
                        fprintf('evaporate\n');
                    else
                        initinfo.aerospc_conc(i, im) = initinfo.aerospc_conc(i, im) + dcaer * 0.5;
                        fprintf('condense\n');
                    end
                end

                og_conc(nsvol) = initinfo.ctotf(nsvol) - initinfo.caer(nsvol);
                %ogconc_arr(i) = og_conc(nsvol);
                %dcaer_arr(i) = dcaer * 0.5;
                nsvol = nsvol + 1;
            end
        end
    else
        nsvol = 1;
        for i = 1:initinfo.n_oa
            if ~initinfo.oaspc.nonvol(i)
                initinfo.aerospc_conc(i, :) = initinfo.conmin;
                og_conc(nsvol) = initinfo.ctotf(nsvol) - sum(initinfo.aerospc_conc(nsvol));
                nsvol = nsvol +1;
            end
        end
    end
    aer_conc = initinfo.aerospc_conc;
    dcaer_ll = initinfo.dcaer_ll;
    dcaer_ll = [dcaer_ll; sum(initinfo.caer-initinfo.caer0)];
end

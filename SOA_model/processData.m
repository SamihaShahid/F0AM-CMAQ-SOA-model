function [oaspc, mwdf, alist, dgas1, dgas2] = processData(data)
    %% Reading parameter tables%%
    warning('off', 'MATLAB:table:ModifiedAndSavedVarnames');
    cdir = '/Users/samiha/Desktop/desktop_v1/SOA model/';
    % Tables
    PM_list = {'ALIM1', 'ALIM2', 'ALIM3','AAVB1','AAVB2','AAVB3','AAVB4', ...
        'AMT1','AMT2','AMT3','AMT4','AMT5','AMT6','AMT7','AISO1','AISO2','ASQT'};
    
%     PM_list = {'ALIM1', 'ALIM2', 'ALIM3'};
    
    oaspc = readtable([cdir, 'parameter_data/oaspc_verify_sim.xlsx']);
    oaspc = oaspc(ismember(oaspc.name, PM_list), :);

    %oaspc = oaspc(:, {'name', 'gas_name', 'ctr_name'});
    % Inputs
    %data = readtable(data);
    gas1 = data.Properties.VariableNames(ismember(data.Properties.VariableNames, oaspc.gas_name));
    gas2 = data.Properties.VariableNames(ismember(data.Properties.VariableNames, unique(oaspc.ctr_name, 'stable')));
    
%     gas1 = {'SVAVB1','SVAVB2','SVAVB3','SVAVB4'};
%     gas2 = {'LIMRXN','TRPRXN'};

    dgas1 = data(:, gas1);
    dgas2 = data(:, gas2);

    %disp(dgas1);
    %disp(dgas2);
    
    ae_spc = readtable([cdir, 'parameter_data/AE_SPECIES_VERIFY_SIM.xlsx']);
    ae_spc = ae_spc(ismember(ae_spc.SPECIES, PM_list), :);
    
    gc_spc = readtable([cdir, 'parameter_data/GC_SPECIES_VERIFY_SIM.xlsx']);
    nr_spc = readtable([cdir, 'parameter_data/NR_SPECIES_VERIFY_SIM.xlsx']);
    
    aerolist = readtable([cdir, 'parameter_data/AEROLIST_DATA_VERIFY_SIM.xlsx']);
    alist = aerolist(ismember(aerolist.Name, oaspc.name), :);
    alist = alist(alist.Tracer == 0 & alist.OM, :);
    
    alist = sortrows(alist, 'Name');
    alist.Properties.RowNames = cellstr(oaspc.name);
    
    mwdf = oaspc(:, {'name', 'gas_name', 'ctr_name'});
    mwdf = join(mwdf, ae_spc(:, {'SPECIES', 'MOLWT'}),'LeftKeys', 'name', 'RightKeys', 'SPECIES', 'RightVariables', {'SPECIES', 'MOLWT'});
    mwdf.Properties.VariableNames{'MOLWT'} = 'op_mw';
    mwdf = mwdf(:, {'name', 'gas_name', 'ctr_name', 'op_mw'});
    
    aa = outerjoin(mwdf, gc_spc(:, {'SPECIES', 'MOLWT'}), 'Type','left','LeftKeys', 'gas_name', 'RightKeys', 'SPECIES', 'RightVariables', {'SPECIES', 'MOLWT'});
    [~, orderIndices] = ismember(mwdf.name, aa.name);
    mwdf = aa(orderIndices, :);
    mwdf = mwdf(:, {'name', 'gas_name', 'ctr_name', 'op_mw', 'MOLWT'});
    
    aa = outerjoin(mwdf, nr_spc(:, {'SPECIES', 'MOLWT'}), 'Type','left','LeftKeys', 'gas_name', 'RightKeys', 'SPECIES', 'RightVariables', {'SPECIES', 'MOLWT'});
    [~, orderIndices] = ismember(mwdf.name, aa.name);
    mwdf = aa(orderIndices, :);
    mwdf.og_mw = mean([mwdf.MOLWT_mwdf, mwdf.MOLWT_right], 2, 'omitnan');
    
    mwdf = mwdf(:, {'name', 'gas_name', 'ctr_name', 'op_mw', 'og_mw'});
    aa = outerjoin(mwdf, gc_spc(:, {'SPECIES', 'MOLWT'}), 'Type','left','LeftKeys', 'ctr_name', 'RightKeys', 'SPECIES', 'RightVariables', {'SPECIES', 'MOLWT'});
    [~, orderIndices] = ismember(mwdf.name, aa.name);
    mwdf = aa(orderIndices, :);
    mwdf.Properties.VariableNames{'MOLWT'} = 'rog_mw';
    mwdf = mwdf(:, {'name', 'gas_name', 'ctr_name', 'op_mw', 'og_mw', 'rog_mw'});

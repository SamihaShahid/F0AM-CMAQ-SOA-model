function initinfo = initializeSOA(data)
    warning('off', 'MATLAB:table:ModifiedAndSavedVarnames');
    initinfo.tref = 298.0;
    initinfo.trefm1 = 1.0 / initinfo.tref;
    initinfo.stdatmpa = 101325;
    initinfo.prefm1 = 1.0 / initinfo.stdatmpa;
    
    rgasuniv = 8.314510;
    initinfo.rgas1 = 1.0 / rgasuniv;
    initinfo.convfac_298 = 101325.0 * initinfo.rgas1 * initinfo.trefm1;
    initinfo.difforg = 9.36e-6;
    initinfo.conmin = 1e-23;
    initinfo.min_gasconc = 1.0E-30;
    initinfo.threshmin = 1.0E-19;
    initinfo.evapmin = 1.0E-20;
    initinfo.airtemp = 300;
    initinfo.airpres = 98833.37;
    [initinfo.oaspc, initinfo.mwdf, initinfo.alist, initinfo.dgas1, initinfo.dgas2] = processData(data);

    initinfo.n_oa = height(initinfo.alist);
    initinfo.op_mw = initinfo.mwdf.op_mw;
    initinfo.og_mw = initinfo.mwdf.og_mw;
    initinfo.aerospc_mw = initinfo.mwdf.op_mw;
    initinfo.lnonvol_oa = initinfo.oaspc.nonvol;
    initinfo.aerospc_mwinv = 1.0 ./ initinfo.op_mw;
    initinfo.nsvol_tracers = 0;
    initinfo.nmode = 3;
    initinfo.nsvol_NotTracers = height(initinfo.oaspc(initinfo.oaspc.nonvol == 0, :));
    initinfo.n_oa_NotTracers = height(initinfo.oaspc);
    initinfo.factor = 0.04089;

    initinfo.og_conc_init = ones(initinfo.n_oa, 1) * initinfo.min_gasconc;
    initinfo.aerospc_conc = ones(initinfo.n_oa, initinfo.nmode) * initinfo.conmin;
    initinfo.rog_mw = initinfo.mwdf.rog_mw;
    initinfo.rog_ppm2ug = initinfo.rog_mw * initinfo.convfac_298;
    initinfo.mw_inv = 1.0 ./ initinfo.op_mw;
    initinfo.nsvol = height(initinfo.oaspc(initinfo.oaspc.nonvol == 0, :));
    initinfo.svname = cell(initinfo.nsvol, 1);
    initinfo.svmw = zeros(initinfo.nsvol, 1);
    initinfo.svmw_inv = zeros(initinfo.nsvol, 1);
    initinfo.c0 = zeros(initinfo.nsvol, 1);
    initinfo.caer0 = zeros(initinfo.nsvol, 1);
    initinfo.ctoti = zeros(initinfo.nsvol, 1);
    initinfo.prod = zeros(initinfo.nsvol, 1);
    initinfo.ctotf = zeros(initinfo.nsvol, 1);
    initinfo.caer = zeros(initinfo.nsvol, 1);
    initinfo.totcnc = [];
    initinfo.dcaer_ll = [];
    initinfo.totogs = ones(initinfo.n_oa, 14);
    %initinfo.df_cvt = table('Size', [0, initinfo.n_oa], 'VariableNames', initinfo.oaspc.name);
    %initinfo.df_dcaer = table('Size', [0, initinfo.n_oa], 'VariableNames', initinfo.oaspc.name);
    %initinfo.df_ogConc = table('Size', [0, length(initinfo.oaspc.gas_name)], 'VariableNames', initinfo.oaspc.gas_name);
    %initinfo.df_ogConc_init = table('Size', [0, length(initinfo.oaspc.gas_name)], 'VariableNames', initinfo.oaspc.gas_name);
end

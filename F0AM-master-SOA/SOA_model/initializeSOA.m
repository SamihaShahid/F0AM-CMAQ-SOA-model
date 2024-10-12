function initinfo = initializeSOA(data)
    %% Samiha Binte Shahid; email- sbint003@ucr.edu
    % Input: data = output from gas-phase solver
    % Output: Initiates array and assigns necessary veriables for SOA
    % calculation.
    %%
    warning('off', 'MATLAB:table:ModifiedAndSavedVarnames');
    initinfo.tref = 298.0; % temperature of reference in K
    initinfo.trefm1 = 1.0 / initinfo.tref; % inverse of reference temperature
    initinfo.stdatmpa = 101325; % standard presssure in pa
    initinfo.prefm1 = 1.0 / initinfo.stdatmpa; % inverse of standard pressure
    
    rgasuniv = 8.314510; % R in J K−1 mol−1
    initinfo.rgas1 = 1.0 / rgasuniv; % inverse of R
    initinfo.convfac_298 = 101325.0 * initinfo.rgas1 * initinfo.trefm1; % converson factor = P/R*T
    initinfo.difforg = 9.36e-6;
    initinfo.conmin = 1e-23; % minimum concentration 
    initinfo.min_gasconc = 1.0E-30; % minimum gas concentration
    initinfo.threshmin = 1.0E-19; % 
    initinfo.evapmin = 1.0E-20;
    initinfo.airtemp = 300; % air temperature
    initinfo.airpres = 98833.37; % air pressure
    [initinfo.oaspc, initinfo.mwdf, initinfo.alist, initinfo.dgas1, initinfo.dgas2] = processData(data);

    initinfo.n_oa = height(initinfo.alist); % number of aerosol species
    initinfo.op_mw = initinfo.mwdf.op_mw; % aersolsol species molecular weight
    initinfo.og_mw = initinfo.mwdf.og_mw; % semi-volatile species molecular weight
    initinfo.aerospc_mw = initinfo.mwdf.op_mw; % aerosol species molecular weight
    initinfo.lnonvol_oa = initinfo.oaspc.nonvol; %
    initinfo.aerospc_mwinv = 1.0 ./ initinfo.op_mw;
    initinfo.nsvol_tracers = 0;
    initinfo.nmode = 3;
    initinfo.nsvol_NotTracers = height(initinfo.oaspc(initinfo.oaspc.nonvol == 0, :));
    initinfo.n_oa_NotTracers = height(initinfo.oaspc);
    initinfo.factor = 0.04089; % P/RT where P=101.325 kpa

    initinfo.og_conc_init = ones(initinfo.n_oa, 1) * initinfo.min_gasconc; % define semi-volatile species initial conc array
    initinfo.aerospc_conc = ones(initinfo.n_oa, initinfo.nmode) * initinfo.conmin; % define aerosol species initial conc array
    initinfo.rog_mw = initinfo.mwdf.rog_mw; % reactive organic gas (TRPRXN, ISOPRXN) molecular weight
    initinfo.rog_ppm2ug = initinfo.rog_mw * initinfo.convfac_298; % P*MW/R*T
    initinfo.mw_inv = 1.0 ./ initinfo.op_mw;
    initinfo.nsvol = height(initinfo.oaspc(initinfo.oaspc.nonvol == 0, :));
    initinfo.svname = cell(initinfo.nsvol, 1);
    initinfo.svmw = zeros(initinfo.nsvol, 1);
    initinfo.svmw_inv = zeros(initinfo.nsvol, 1);
    initinfo.c0 = zeros(initinfo.nsvol, 1); % ﻿cstar at airtemp ug/m3
    initinfo.caer0 = zeros(initinfo.nsvol, 1); % ﻿aerosol conc before current time step ug/m3
    initinfo.ctoti = zeros(initinfo.nsvol, 1); % ﻿total gas + aerosol conc before current time step ug/m3
    initinfo.prod = zeros(initinfo.nsvol, 1);  % ﻿total gas + aerosol produced during current time step ug/m3
    initinfo.ctotf = zeros(initinfo.nsvol, 1); % ﻿total conc after current time step
    initinfo.caer = zeros(initinfo.nsvol, 1);  % ﻿particle conc in aerosol phase after current time step ug/m3
    initinfo.totcnc = [];
    initinfo.dcaer_ll = [];
    initinfo.totogs = ones(initinfo.n_oa, 14);
    %initinfo.df_cvt = table('Size', [0, initinfo.n_oa], 'VariableNames', initinfo.oaspc.name);
    %initinfo.df_dcaer = table('Size', [0, initinfo.n_oa], 'VariableNames', initinfo.oaspc.name);
    %initinfo.df_ogConc = table('Size', [0, length(initinfo.oaspc.gas_name)], 'VariableNames', initinfo.oaspc.gas_name);
    %initinfo.df_ogConc_init = table('Size', [0, length(initinfo.oaspc.gas_name)], 'VariableNames', initinfo.oaspc.gas_name);
end

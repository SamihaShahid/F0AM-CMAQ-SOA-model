function J = SAPRC18_ICTUSE_Jvalues(Met)
stepSize=60;
LFlux='saprc_light_flux.txt';
%% Initialization
nj = 33; %overguess number of rate constants
Jnames = cell(nj,1);
PHF_file = cell(nj,1);

i=0;
%% SAPRC-22 VALUES
i=i+1;
Jnames{i} = 'JNO2_06'; 
J_ration_JNO2{i} = 1;

i=i+1;
Jnames{i} = 'JPPN_11';
J_ration_JNO2{i} =1.0436e-04;

i=i+1;
Jnames{i} ='JPAN_11';
J_ration_JNO2{i} =6.2351e-05;

i=i+1;
Jnames{i}='JPAA';
J_ration_JNO2{i}=5.9688e-05;

i=i+1;
Jnames{i} = 'JO3O3P_06';
J_ration_JNO2{i} = 0.0042;

i=i+1;
Jnames{i} = 'JO3O1D_06';
J_ration_JNO2{i} = 0.0016;

i=i+1;
Jnames{i} = 'JNO3NO_06';
J_ration_JNO2{i} = 0.002122;

i=i+1;
Jnames{i} = 'JNO3NO2_6';
J_ration_JNO2{i} = 0.419679;

i=i+1;
Jnames{i} = 'JNO3NO_06';
J_ration_JNO2{i} = 0.0021226;

i=i+1;
Jnames{i} = 'JMVK_16';
J_ration_JNO2{i} = 0.0004825;

i=i+1;
Jnames{i} = 'JMGLY_13';
J_ration_JNO2{i} = 0.009404;

i=i+1;
Jnames{i} = 'JMEK_06';
J_ration_JNO2{i} = 0.0006054;

i=i+1;
Jnames{i} = 'JMACR_06';
J_ration_JNO2{i} = 0.00029822;

i=i+1;
Jnames{i} = 'JIC3ONO2';
J_ration_JNO2{i} = 0.000158145;

i=i+1;
Jnames{i} = 'JHPALDS';
J_ration_JNO2{i} = 0.08631574;

i=i+1;
Jnames{i} = 'JHONO_06';
J_ration_JNO2{i} = 0.244085;

i=i+1;
Jnames{i} = 'JHNO4_06';
J_ration_JNO2{i} = 0.0005789;

i=i+1;
Jnames{i} = 'JHNO3';
J_ration_JNO2{i} = 3.84213E-05;

i=i+1;
Jnames{i} = 'JHCHOR_13';
J_ration_JNO2{i} = 0.0020523;

i=i+1;
Jnames{i} = 'JHCHOM_13';
J_ration_JNO2{i} = 0.00615862;

i=i+1;
Jnames{i} = 'JH2O2';
J_ration_JNO2{i} = 0.0007829;

i=i+1;
Jnames{i} = 'JGLY_I13R';
J_ration_JNO2{i} = 0.0094027;

i=i+1;
Jnames{i} = 'JGLY_I13M';
J_ration_JNO2{i} = 0.001811;

i=i+1;
Jnames{i} = 'JGLALD_14';
J_ration_JNO2{i} = 0.00055739;

i=i+1;
Jnames{i} = 'JDIONO2';
J_ration_JNO2{i} = 0.0007200;

i=i+1;
Jnames{i} = 'JCRBNIT';
J_ration_JNO2{i} = 0.0028048;

i=i+1;
Jnames{i} = 'JCOOH';
J_ration_JNO2{i} = 0.000617932;

i=i+1;
Jnames{i} = 'JCCHOR_13';
J_ration_JNO2{i} = 0.0002474;

i=i+1;
Jnames{i} = 'JC2CHOabs';
J_ration_JNO2{i} = 0.003044;

i=i+1;
Jnames{i} = 'JC2CHO';
J_ration_JNO2{i} = 0.003044;

i=i+1;
Jnames{i} = 'JBALD_11';
J_ration_JNO2{i} = 0.073491551;

i=i+1;
Jnames{i} = 'JBACL_11';
J_ration_JNO2{i} = 0.0161420;

i=i+1;
Jnames{i} = 'JAFGS';
J_ration_JNO2{i} = 0.5927032;

i=i+1;
Jnames{i} = 'JACROL_16';
J_ration_JNO2{i} = 0.000374378;

i=i+1;
Jnames{i} = 'JACET_06';
J_ration_JNO2{i} = 3.35086E-05;

%% INTEGRATE
nj = i;
J = struct;
for i=1:nj    
    J.(Jnames{i}) = ones(stepSize,1)*J_ration_JNO2{i};
end

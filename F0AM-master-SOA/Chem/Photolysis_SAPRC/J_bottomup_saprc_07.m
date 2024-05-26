function J = J_bottomup_saprc_07(Met)
% function J = J_bottomup(LFlux,T,P,J2plot)
% Calculates photolysis frequencies by integrating product of cross section,
% quantum yield and light flux over wavelength.
% This is a master function designed to include J-value calculations for all mechanisms included in
% the model.
%
% USE CAUTION: the user is responsible for ensuring that cross sections and quantum yields are
% up-to-date. Sources for the data used here are listed in the file PhotoDataSources.xlsx
%
% INPUTS:
% LFlux: a string specifying a text file with two tab-delimited columns of data.
%       The first column should be wavelength (in nm).
%       The second column should be photon flux (in photons/cm^2/s/nm).
%       Other format options are also available; see IntegrateJ.m for more info.
% T: Temperature, K
% P: Pressure, mbar
% J2plot: optional input specifying J-values for which you wish to plot photolysis data.
%           Can be a cell array of J-value names (listed below) or set this to 'all' to plotem all.
%
% OUTPUTS:
% J: structure of J-values, each with same length as T/P inputs.
% 
% 20231009 Samiha Binte Shahid  Creation date.

%%
stepSize=60;
LFlux='saprc_light_flux.txt';
%% Initialization
nj = 48; %overguess number of rate constants
Jnames = cell(nj,1);
PHF_file = cell(nj,1);

i=0;

%% SAPRC-07 VALUES
i=i+1;
Jnames{i} = 'JPAN'; 
PHF_file{i} = 's07_PAN.txt';

i=i+1;
Jnames{i} = 'JPAA';
PHF_file{i} ='s07_PAA.txt';

i=i+1;
Jnames{i} ='JO3O3P_06';
PHF_file{i} ='s07_O3O3P_06.txt';

i=i+1;
Jnames{i}='JO3O1D_06';
PHF_file{i}='s07_O3O1D_06.txt';

i=i+1;
Jnames{i} = 'JNO3NO_06';
PHF_file{i} = 's07_NO3NO_06.txt';

i=i+1;
Jnames{i} = 'JNO3NO2_6';
PHF_file{i} = 's07_NO3NO2_6.txt';

i=i+1;
Jnames{i} = 'JNO2ex';
PHF_file{i} = 's07_NO2EX.txt';

i=i+1;
Jnames{i} = 'JNO2_06';
PHF_file{i} = 's07_NO2_06.txt';

i=i+1;
Jnames{i} = 'JMVK_06';
PHF_file{i} = 's07_MVK_06.txt';

i=i+1;
Jnames{i} = 'JMITC';
PHF_file{i} = 's07_MITC.txt';

i=i+1;
Jnames{i} = 'JMGLY_06';
PHF_file{i} = 's07_MGLY_06.txt';

i=i+1;
Jnames{i} = 'JMEK_06';
PHF_file{i} = 's07_MEK_06.txt';

i=i+1;
Jnames{i} = 'JMACR_06';
PHF_file{i} = 's07_MACR_06.txt';

i=i+1;
Jnames{i} = 'JIC3ONO2';
PHF_file{i} = 's07_IC3ONO2.txt';

i=i+1;
Jnames{i} = 'JHONO_06';
PHF_file{i} = 's07_HONO_06.txt';

i=i+1;
Jnames{i} = 'JHOI';
PHF_file{i} = 's07_HOI.txt';

i=i+1;
Jnames{i} = 'JHOCL_06';
PHF_file{i} = 's07_HOCL_06.txt';

i=i+1;
Jnames{i} = 'JHOCCHO';
PHF_file{i} = 's07_HOCCHO.txt';

i=i+1;
Jnames{i} = 'JHNO4_06';
PHF_file{i} = 's07_HNO4_06.txt';

i=i+1;
Jnames{i} = 'JHNO3';
PHF_file{i} = 's07_HNO3.txt';

i=i+1;
Jnames{i} = 'JHI';
PHF_file{i} = 's07_HI.txt';

i=i+1;
Jnames{i} = 'JHCHOR_06';
PHF_file{i} = 's07_HCHOR_06.txt';

i=i+1;
Jnames{i} = 'JHCHOM_06';
PHF_file{i} = 's07_HCHOM_06.txt';

i=i+1;
Jnames{i} = 'JH2O2';
PHF_file{i} = 's07_H2O2.txt';

i=i+1;
Jnames{i} = 'JGLY_07R';
PHF_file{i} = 's07_GLY_07R.txt';

i=i+1;
Jnames{i} = 'JGLY_07M';
PHF_file{i} = 's07_GLY_07M.txt';

i=i+1;
Jnames{i} = 'JCS2';
PHF_file{i} = 's07_CS2.txt';

i=i+1;
Jnames{i} = 'JCOOH';
PHF_file{i} = 's07_COOH.txt';

i=i+1;
Jnames{i} = 'JCONO';
PHF_file{i} = 's07_CONO.txt';

i=i+1;
Jnames{i} = 'JCLPICERI';
PHF_file{i} = 's07_CLPICERI.txt';

i=i+1;
Jnames{i} = 'JCLONO2_2';
PHF_file{i} = 's07_CLONO2_2.txt';

i=i+1;
Jnames{i} = 'JCLONO2_1';
PHF_file{i} = 's07_CLONO2_1.txt';

i=i+1;
Jnames{i} = 'JCLONO';
PHF_file{i} = 's07_CLONO.txt';

i=i+1;
Jnames{i} = 'JCLNO_06';
PHF_file{i} = 's07_CLNO_06.txt';

i=i+1;
Jnames{i} = 'JCLNO2';
PHF_file{i} = 's07_CLNO2.txt';

i=i+1;
Jnames{i} = 'JCLCCHO';
PHF_file{i} = 's07_CLCCHO.txt';

i=i+1;
Jnames{i} = 'JCLACET';
PHF_file{i} = 's07_CLACET.txt';

i=i+1;
Jnames{i} = 'JCL2';
PHF_file{i} = 's07_CL2.txt';

i=i+1;
Jnames{i} = 'JCH3I';
PHF_file{i} = 's07_CH3I.txt';

i=i+1;
Jnames{i} = 'JCCHO_R';
PHF_file{i} = 's07_CCHO_R.txt';

i=i+1;
Jnames{i} = 'JC2CHO';
PHF_file{i} = 's07_C2CHO.txt';

i=i+1;
Jnames{i} = 'JBRONO2';
PHF_file{i} = 's07_BRONO2.txt';

i=i+1;
Jnames{i} = 'JBRNO2';
PHF_file{i} = 's07_BRNO2.txt';

i=i+1;
Jnames{i} = 'JBALD_06';
PHF_file{i} = 's07_BALD_06.txt';

i=i+1;
Jnames{i} = 'JBACL_07';
PHF_file{i} = 's07_BACL_07.txt';

i=i+1;
Jnames{i} = 'JAFG1';
PHF_file{i} = 's07_AFG1.txt';

i=i+1;
Jnames{i} = 'JACRO_09';
PHF_file{i} = 's07_ACRO_09.txt';

i=i+1;
Jnames{i} = 'JACET_06';
PHF_file{i} = 's07_ACET_06.txt';
%% INTEGRATE
% nj = i;
% J = struct;
% for i=1:nj    
%     J.(Jnames{i}) = integrate_J_saprc_07(PHF_file{i},LFlux);
% end
%% For multiple stepSize INTEGRATE
nj = i;
J = struct;
for i=1:nj    
    J.(Jnames{i}) = ones(stepSize,1)*integrate_J_saprc_07(PHF_file{i},LFlux);
end

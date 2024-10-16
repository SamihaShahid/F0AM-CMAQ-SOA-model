function J = J_bottomup_saprc(Met)
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
nj = 33; %overguess number of rate constants
Jnames = cell(nj,1);
PHF_file = cell(nj,1);

i=0;

%% SAPRC-22 VALUES
i=i+1;
Jnames{i} = 'JNO2_06'; 
PHF_file{i} = 'NO2_06.txt';

i=i+1;
Jnames{i} = 'JPPN_11';
PHF_file{i} ='PPN_11.txt';

i=i+1;
Jnames{i} ='JPAN_11';
PHF_file{i} ='PAN_11.txt';

i=i+1;
Jnames{i}='JPAA';
PHF_file{i}='PAA.txt';

i=i+1;
Jnames{i} = 'JO3O3P_06';
PHF_file{i} = 'O3O3P_06.txt';

i=i+1;
Jnames{i} = 'JO3O1D_06';
PHF_file{i} = 'O3O1D_06.txt';

i=i+1;
Jnames{i} = 'JNO3NO_06';
PHF_file{i} = 'NO3NO_06.txt';

i=i+1;
Jnames{i} = 'JNO3NO2_6';
PHF_file{i} = 'NO3NO2_06.txt';

i=i+1;
Jnames{i} = 'JNO3NO_06';
PHF_file{i} = 'NO3NO_06.txt';

i=i+1;
Jnames{i} = 'JMVK_16';
PHF_file{i} = 'MVK_16.txt';

i=i+1;
Jnames{i} = 'JMGLY_13';
PHF_file{i} = 'MGLY_13.txt';

i=i+1;
Jnames{i} = 'JMEK_06';
PHF_file{i} = 'MEK_06.txt';

i=i+1;
Jnames{i} = 'JMACR_06';
PHF_file{i} = 'MACR_06.txt';

i=i+1;
Jnames{i} = 'JIC3ONO2';
PHF_file{i} = 'IC3ONO2.txt';

i=i+1;
Jnames{i} = 'JHPALDS';
PHF_file{i} = 'HPALDS.txt';

i=i+1;
Jnames{i} = 'JHONO_06';
PHF_file{i} = 'HONO_06.txt';

i=i+1;
Jnames{i} = 'JHNO4_06';
PHF_file{i} = 'HNO4_06.txt';

i=i+1;
Jnames{i} = 'JHNO3';
PHF_file{i} = 'HNO3.txt';

i=i+1;
Jnames{i} = 'JHCHOR_13';
PHF_file{i} = 'HCHOR_13.txt';

i=i+1;
Jnames{i} = 'JHCHOM_13';
PHF_file{i} = 'HCHOM_13.txt';

i=i+1;
Jnames{i} = 'JH2O2';
PHF_file{i} = 'H2O2.txt';

i=i+1;
Jnames{i} = 'JGLY_I13R';
PHF_file{i} = 'GLY_I13R.txt';

i=i+1;
Jnames{i} = 'JGLY_I13M';
PHF_file{i} = 'GLY_I13M.txt';

i=i+1;
Jnames{i} = 'JGLALD_14';
PHF_file{i} = 'GLALD_14.txt';

i=i+1;
Jnames{i} = 'JDIONO2';
PHF_file{i} = 'DIONO2.txt';

i=i+1;
Jnames{i} = 'JCRBNIT';
PHF_file{i} = 'CRBNIT.txt';

i=i+1;
Jnames{i} = 'JCOOH';
PHF_file{i} = 'COOH.txt';

i=i+1;
Jnames{i} = 'JCCHOR_13';
PHF_file{i} = 'CCHOR_13.txt';

i=i+1;
Jnames{i} = 'JC2CHOabs';
PHF_file{i} = 'C2CHOabs.txt';

i=i+1;
Jnames{i} = 'JC2CHO';
PHF_file{i} = 'C2CHO.txt';

i=i+1;
Jnames{i} = 'JBALD_11';
PHF_file{i} = 'BALD_11.txt';

i=i+1;
Jnames{i} = 'JBACL_11';
PHF_file{i} = 'BACL_11.txt';

i=i+1;
Jnames{i} = 'JAFGS';
PHF_file{i} = 'AFGS.txt';

i=i+1;
Jnames{i} = 'JACROL_16';
PHF_file{i} = 'ACROL_16.txt';

i=i+1;
Jnames{i} = 'JACET_06';
PHF_file{i} = 'ACET_06.txt';

%% INTEGRATE
% nj = i;
% J = struct;
% for i=1:nj    
%     J.(Jnames{i}) = ones(stepSize,1)*integrate_J_saprc(PHF_file{i},LFlux);
% end
%% For multiple stepSize INTEGRATE
nj = i;
J = struct;
for i=1:nj    
    J.(Jnames{i}) = ones(stepSize,1)*integrate_J_saprc(PHF_file{i},LFlux);
end


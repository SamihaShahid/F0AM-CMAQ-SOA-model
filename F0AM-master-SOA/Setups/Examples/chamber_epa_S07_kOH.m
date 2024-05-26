% ExampleSetup_Chamber.m
% This example shows a model setup for simulation of
% a series of photochemical chamber experiments.
% Read comments in each section for a guided tour.
%
% 20151022 GMW

clear

%% METEOROLOGY
%{
Pressure, temperature, and either RH or H2O are required Met inputs.
We will assume them constant throughout the simulation,
  thus we need only specify a single (scalar) value for each.
We have also specified a text file containing a spectral actinic flux (wavelength and photons/cm^2/s),
  which will be used to calculate J-values. This particular spectrum was measured on a real
  chamber (thanks to John Crounse).
%}
stepSize = 45;

Met = {...
%   names       values          
    'P'         ones(stepSize,1)*1013                       ; %Pressure, mbar
    'T'         ones(stepSize,1)*298                        ; %Temperature, K
    'RH'        ones(stepSize,1)*10                         ; %Relative Humidity, percent
    'LFlux'     'ExampleLightFlux_2.txt'     ; %Text file for radiation spectrum
    'jcorr'     1                          ; %light attenuation factor
    };

%% CHEMICAL CONCENTRATIONS
%{
Imagine that we are simulating a series of three isoprene oxidation experiments, each with
  different NOx conditions. We fill the bag with isoprene, H2O2 (our HOx source), and NO2,
  then turn the lights on and let it run.
Let's assume that initial isoprene and H2O2 are the same for all three runs,
  so we can input them as scalars.
All HoldMe values are set to 0 so that concentrations will evolve.
If you'd rather use CH3ONO as your OH source, add it in below and comment out H2O2.
  Note that this will make more NOx.
%}
data=readtable('/Users/samiha/Desktop/NMOG_paper_v2/Data/VOC_profile/epa_tmf_S07.xlsx');
InitConc=table2cell(data);

%% CHEMISTRY
%{
The ChemFiles input is a cell array of strings
 specifying functions and scripts for the chemical mechanism.
THE FIRST CELL is always a function for generic K-values.
THE SECOND CELL is always a function for J-values (photolysis frequencies).
All other inputs are scripts for mechanisms and sub-mechanisms.
Here we give an example using MCMv3.3.1.  Note that this mechanism was extracted from the MCM website for
the specific set of initial species included above (isoprene and inorganics).
%}

ChemFiles = {...
    'SAPRC07B_K(Met)';
    'FZS_2_Jvalues(Met)'; %Jmethod flag of 1 specifies using "BottomUp" J-value method.
    'SAPRC07B_AllRxns_soa_ee';
    'aerosol_precursor_rxns';
    };

%% DILUTION CONCENTRATIONS
% We are not diluting the chamber air, so this input is irrelevant (but still necessary).

BkgdConc = {...
%   names           values
    'DEFAULT'       0;   %0 for all zeros, 1 to use InitConc
    };

%% OPTIONS
%{
"Verbose" can be set from 0-3; this just affects the level of detail printed to the command
  window regarding model progress.
"EndPointsOnly" is set to 0 because we want output to include all concentrations along each model step.
"LinkSteps" is set to 0 because each step is fully independent.
"IntTime" is the integration time for each step. Let's pretend each experiment lasts 3 hours.
"SavePath" will store the output in the default "Runs" folder under the base F0AM directory
"GoParallel" can be utilized since each step is independent (assuming you have the parallel computing toolbox)
%}

ModelOptions.Verbose       = 1;
ModelOptions.EndPointsOnly = 0;
ModelOptions.LinkSteps     = 1;
ModelOptions.IntTime       = (250*60)/stepSize;
ModelOptions.SavePath      = 'ChamberExampleOutput.mat';
ModelOptions.GoParallel    = 0;

%% MODEL RUN
% Now we call the model.
% Output will be saved in the "SavePath" above and will also be written to the structure S.
% Let's also throw away the inputs (don't worry, they are saved in the output structure).

S = F0AM_ModelCore(Met,InitConc,ChemFiles,BkgdConc,ModelOptions);
% clear Met InitConc ChemFiles BkgdConc ModelOptions

%% Import the data 
% data = struct2table(S.Conc);
% writetable(data, '/Users/samiha/Desktop/NMOG_paper_v2/Data/SOA_model/EPA_S07_kOH/conc.xlsx');
% 
% time_data = num2cell(S.Time);
% time_data=cell2table(time_data,"VariableNames",["t"]);
% writetable(time_data, '/Users/samiha/Desktop/NMOG_paper_v2/Data/SOA_model/EPA_S07_kOH/t.xlsx');
% 
% data = cell2table(S.Chem.Rnames, "VariableNames",["Rxn"]);
% writetable(data, '/Users/samiha/Desktop/NMOG_paper_v2/Data/SOA_model/EPA_S07_kOH/rnames.xlsx');
% 
% data = num2cell(S.Chem.Rates);
% data = cell2table(data);
% writetable(data, '/Users/samiha/Desktop/NMOG_paper_v2/Data/SOA_model/EPA_S07_kOH/rates.xlsx');
% 
% data = num2cell(S.Chem.f);
% data = cell2table(data);
% writetable(data, '/Users/samiha/Desktop/NMOG_paper_v2/Data/SOA_model/EPA_S07_kOH/f.xlsx');
% 
% data = num2cell(S.Chem.k);
% data = cell2table(data);
% writetable(data, '/Users/samiha/Desktop/NMOG_paper_v2/Data/SOA_model/EPA_S07_kOH/k.xlsx');
% 
% data = num2cell(S.Chem.iG);
% data = cell2table(data);
% writetable(data, '/Users/samiha/Desktop/NMOG_paper_v2/Data/SOA_model/EPA_S07_kOH/G.xlsx');
% 

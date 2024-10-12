% SAPRC18_WallRxns.m
% Chamber dependent reactions, without adjustable radical source

SpeciesToAdd = {'wall_HONO', 'wall_ALD'};
AddSpecies

% RN-I (ppb)
% HONO Off-Gasing,  wall + hν -> HONO to the NO2 photolysis rate;
% Best fits to CO-air NOx offgasing experiments .
i=i+1;
Rnames{i} = 'wall_HONO + HV = HONO'; 
k(:,i) = JNO2_06;      
Gstr{i,1} = 'wall_HONO';
fwall_HONO(i)=fwall_HONO(i)-1.0; fHONO(i)=fHONO(i)+1.0;

% ALD off-gasing
i=i+1;
Rnames{i} = 'wall_ALD + HV = HCHO'; 
k(:,i) = JNO2_06;      
Gstr{i,1} = 'wall_ALD';
fwall_ALD(i)=fwall_ALD(i)-1.0; fHCHO(i)=fHCHO(i)+1.0;

% Humidity independent portion of the wall loss of N2O5;
% Based on results of N2O5 decays carried out in this chamber.
i=i+1;
Rnames{i} = 'N2O5 = '; 
k(:,i) = 0.0028/60;           
Gstr{i,1} = 'N2O5';
fN2O5(i)=fN2O5(i)-1;

% Unimolecular loss rate of NO2 to the walls;
% Based on results of NO2 decays carried out in this chamber.
% YHONO=0.2
i=i+1;
Rnames{i} = 'NO2 = 0.2 * HONO'; 
k(:,i) = 1.60e-4/60;            
Gstr{i,1} = 'NO2';
fNO2(i)=fNO2(i)-1;
fHONO(i)=fHONO(i)+0.2;

% O3 loss to wall
i=i+1;
Rnames{i} = 'O3 + wall = '; 
k(:,i) = 1.8e-04/60;      
Gstr{i,1} = 'O3';
fO3(i)=fO3(i)-1.0;







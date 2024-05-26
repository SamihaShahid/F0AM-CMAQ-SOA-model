% SAPRC18_WallRxns.m
% Chamber dependent reactions, without adjustable radical source

SpeciesToAdd = {'wall_HONO', 'wall_ALD', 'wall_NO2'};
AddSpecies

% RN-I (ppb)
% HONO Off-Gasing,  wall + hν -> HONO to the NO2 photolysis rate;
% Best fits to CO-air NOx offgasing experiments .
i=i+1;
Rnames{i} = 'wall_HONO + HV = HONO - 1*wall_NO2'; 
k(:,i) = JNO2_06;      
Gstr{i,1} = 'wall_HONO';
fwall_HONO(i)=fwall_HONO(i)-1.0; fHONO(i)=fHONO(i)+1.0; fwall_NO2(i)=fwall_NO2(i)-1.0;

i=i+1;
Rnames{i} = 'wall_ALD + HV = HCHO'; 
k(:,i) = JNO2_06;      
Gstr{i,1} = 'wall_ALD';
fwall_ALD(i)=fwall_ALD(i)-1.0; fHCHO(i)=fHCHO(i)+1.0;

i=i+1;
Rnames{i} = 'O3 + wall = '; 
k(:,i) = 1.8e-06;      
Gstr{i,1} = 'O3';
fO3(i)=fO3(i)-1.0;

i=i+1;
Rnames{i} = 'NO2 + wall = 0.2*HONO + 0.8*wall_NO2'; 
k(:,i) = 4.66e-5;      
Gstr{i,1} = 'NO2';
fNO2(i)=fNO2(i)-1.0; fHONO(i)=fHONO(i)+0.2; fwall_NO2(i)=fwall_NO2(i)+0.8;

i=i+1;
Rnames{i} = 'N2O5 = 2*wall_NO2'; 
k(:,i) = 2.66e-6;      
Gstr{i,1} = 'N2O5';
fN2O5(i)=fN2O5(i)-1.0; fwall_NO2(i)=fwall_NO2(i)+2.0;


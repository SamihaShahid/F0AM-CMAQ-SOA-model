SpeciesToAdd = {...
'SESQ'; 'MECO3'; 'MACR'; 'ISOPRENE'; 'CO'; 'O3'; 'ALK4'; 'HOCL'; 'AFG3'; ...
'PAN2'; 'xRCHO'; 'xAFG2'; 'AFG1'; 'ACRO'; 'xMEK'; 'ACETYLEN'; 'xCO'; 'TMB124'; 'O1D'; ...
'HCL'; 'IPRD'; 'PROPENE'; 'xGLY'; 'CCO3H'; 'NPHE'; 'CCOOH'; 'BACL'; 'ARO1'; 'MEO2'; ...
'xACRO'; 'xAFG3'; 'O3P'; 'HO2'; 'TERP'; 'MACO3'; 'xMACR'; 'MAPAN'; 'xCL'; 'CL2'; ...
'ALK3'; 'CLACET'; 'XN'; 'xIPRD'; 'MGLY'; 'M'; 'RCHO'; 'NO'; 'NO2'; 'xPROD2'; ...
'HNO4'; 'xBACL'; 'ALK1'; 'CCOOH'; 'H2'; 'xACET'; 'ETHENE'; 'MVK'; 'ROOH'; 'CL'; ...
'xMVK'; 'CLONO'; 'yR6OOH'; 'BALD'; 'CLCHO'; 'MEK'; 'xRCO3'; 'COOH'; 'xNO2'; 'yROOH'; ...
'H2O'; 'xHCHO'; 'xRNO3'; 'SULF'; 'xHO2'; 'ALK2'; 'HO2H'; 'RO2XC'; 'ACET'; 'OXYLENE'; ...
'HCOOH'; 'ETOH'; 'xTBUO'; 'zRNO3'; 'HNO3'; 'ARO2'; 'NO3'; 'xMGLY'; 'BZO'; 'HCHO'; ...
'xMECO3'; 'R6OOH'; 'xAFG1'; 'CLNO2'; 'RCO3H'; 'XC'; 'MEOH'; 'GLY'; 'xCLCCHO'; 'CLNO'; ...
'O2'; 'xMACO3'; 'APINENE'; 'BZCO3'; 'TOLUENE'; 'ALK5'; 'OLE2'; 'TBUO'; 'RCOOH'; 'SO2'; ...
'HOCCHO'; 'RAOOH'; 'yRAOOH'; 'MXYLENE'; 'BENZENE'; 'RNO3'; 'PAN'; 'xCCHO'; 'xBALD'; 'xHOCCHO'; ...
'HV'; 'PXYLENE'; 'OLE1'; 'CRES'; 'HONO'; 'PROD2'; 'CCHO'; 'OH'; 'xCLACET'; 'CLONO2'; ...
'BUTDE13E'; 'RO2C'; 'PBZN'; 'AFG2'; 'NO2EX'; 'RCO3'; 'CO2'; 'xMEO2'; 'CH4'; 'CLO'; ...
'CLCCHO'; 'xOH'; 'N2O5';'XYLRO2';};

AddSpecies

i=i+1;
Rnames{i} = ' NO2 + hv = NO + O3P ';
k(:,i) =  1.0.*JNO2_06;
Gstr{i,1} = 'NO2'; 
fNO2(i)=fNO2(i)-1; fNO(i)=fNO(i)+1; fO3P(i)=fO3P(i)+1; 

i=i+1;
Rnames{i} = ' O3P + O2 + M = O3 ';
k(:,i) =  5.68e-34.*(T./300).^-2.60.*M.*0.21.*M;
Gstr{i,1} = 'O3P'; 
fO3P(i)=fO3P(i)-1; fO3(i)=fO3(i)+1; 

i=i+1;
Rnames{i} = ' O3P + O3 =  ';
k(:,i) =  8.00e-12.*exp(-2060./ T);
Gstr{i,1} = 'O3P'; Gstr{i,2} = 'O3'; 
fO3P(i)=fO3P(i)-1; fO3(i)=fO3(i)-1; 

i=i+1;
Rnames{i} = ' O3P + NO = NO2 ';
k(:,i) = K_O3P_NO;
Gstr{i,1} = 'O3P'; Gstr{i,2} = 'NO'; 
fO3P(i)=fO3P(i)-1; fNO(i)=fNO(i)-1; fNO2(i)=fNO2(i)+1; 

i=i+1;
Rnames{i} = ' O3P + NO2 = NO ';
k(:,i) =  5.50e-12.*exp(188./ T);
Gstr{i,1} = 'O3P'; Gstr{i,2} = 'NO2'; 
fO3P(i)=fO3P(i)-1; fNO2(i)=fNO2(i)-1; fNO(i)=fNO(i)+1; 

i=i+1;
Rnames{i} = ' O3P + NO2 = NO3 ';
k(:,i) = K_O3P_NO2_NO3;
Gstr{i,1} = 'O3P'; Gstr{i,2} = 'NO2'; 
fO3P(i)=fO3P(i)-1; fNO2(i)=fNO2(i)-1; fNO3(i)=fNO3(i)+1; 

i=i+1;
Rnames{i} = ' O3 + NO = NO2 ';
k(:,i) =  3.00e-12.*exp(-1500./ T);
Gstr{i,1} = 'O3'; Gstr{i,2} = 'NO'; 
fO3(i)=fO3(i)-1; fNO(i)=fNO(i)-1; fNO2(i)=fNO2(i)+1; 

i=i+1;
Rnames{i} = ' O3 + NO2 = NO3 ';
k(:,i) =  1.40e-13.*exp(-2470./ T);
Gstr{i,1} = 'O3'; Gstr{i,2} = 'NO2'; 
fO3(i)=fO3(i)-1; fNO2(i)=fNO2(i)-1; fNO3(i)=fNO3(i)+1; 

i=i+1;
Rnames{i} = ' NO + NO3 = 2*NO2 ';
k(:,i) =  1.80e-11.*exp(110./ T);
Gstr{i,1} = 'NO'; Gstr{i,2} = 'NO3'; 
fNO(i)=fNO(i)-1; fNO3(i)=fNO3(i)-1; fNO2(i)=fNO2(i)+2; 

i=i+1;
Rnames{i} = ' NO + NO + O2 = 2*NO2 ';
k(:,i) =  3.30e-39.*exp(530./ T).*0.21.*M;
Gstr{i,1} = 'NO'; Gstr{i,2} = 'NO'; 
fNO(i)=fNO(i)-1; fNO(i)=fNO(i)-1; fNO2(i)=fNO2(i)+2; 

i=i+1;
Rnames{i} = ' NO2 + NO3 = N2O5 ';
k(:,i) = K_NO2_NO3;
Gstr{i,1} = 'NO2'; Gstr{i,2} = 'NO3'; 
fNO2(i)=fNO2(i)-1; fNO3(i)=fNO3(i)-1; fN2O5(i)=fN2O5(i)+1; 

i=i+1;
Rnames{i} = ' N2O5 = NO2 + NO3 ';
k(:,i) = K_N2O5;
Gstr{i,1} = 'N2O5'; 
fN2O5(i)=fN2O5(i)-1; fNO2(i)=fNO2(i)+1; fNO3(i)=fNO3(i)+1; 

i=i+1;
Rnames{i} = ' N2O5 + H2O = 2*HNO3 ';
k(:,i) =  2.50e-22.*H2O;
Gstr{i,1} = 'N2O5'; 
fN2O5(i)=fN2O5(i)-1; fHNO3(i)=fHNO3(i)+2; 

i=i+1;
Rnames{i} = ' N2O5 + H2O + H2O = 2*HNO3 ';
k(:,i) =  1.80e-39.*H2O.*H2O;
Gstr{i,1} = 'N2O5'; 
fN2O5(i)=fN2O5(i)-1; fHNO3(i)=fHNO3(i)+2; 

i=i+1;
Rnames{i} = ' NO2 + NO3 = NO + NO2 ';
k(:,i) =  4.50e-14.*exp(-1260./ T);
Gstr{i,1} = 'NO2'; Gstr{i,2} = 'NO3'; 
fNO2(i)=fNO2(i)-1; fNO3(i)=fNO3(i)-1; fNO(i)=fNO(i)+1; fNO2(i)=fNO2(i)+1; 

i=i+1;
Rnames{i} = ' NO3 + hv = NO ';
k(:,i) =  1.0.*JNO3NO_06;
Gstr{i,1} = 'NO3'; 
fNO3(i)=fNO3(i)-1; fNO(i)=fNO(i)+1; 

i=i+1;
Rnames{i} = ' NO3 + hv = NO2 + O3P ';
k(:,i) =  1.0.*JNO3NO2_6;
Gstr{i,1} = 'NO3'; 
fNO3(i)=fNO3(i)-1; fNO2(i)=fNO2(i)+1; fO3P(i)=fO3P(i)+1; 

i=i+1;
Rnames{i} = ' O3 + hv = O1D ';
k(:,i) =  1.0.*JO3O1D_06;
Gstr{i,1} = 'O3'; 
fO3(i)=fO3(i)-1; fO1D(i)=fO1D(i)+1; 

i=i+1;
Rnames{i} = ' O3 + hv = O3P ';
k(:,i) =  1.0.*JO3O3P_06;
Gstr{i,1} = 'O3'; 
fO3(i)=fO3(i)-1; fO3P(i)=fO3P(i)+1; 

i=i+1;
Rnames{i} = ' O1D + H2O = 2*OH ';
k(:,i) =  1.63e-10.*exp(60./ T).*H2O;
Gstr{i,1} = 'O1D'; 
fO1D(i)=fO1D(i)-1; fOH(i)=fOH(i)+2; 

i=i+1;
Rnames{i} = ' O1D + M = O3P ';
k(:,i) =  2.38e-11.*exp(96./ T).*M;
Gstr{i,1} = 'O1D'; 
fO1D(i)=fO1D(i)-1; fO3P(i)=fO3P(i)+1; 

i=i+1;
Rnames{i} = ' OH + NO = HONO ';
k(:,i) = K_OH_NO;
Gstr{i,1} = 'OH'; Gstr{i,2} = 'NO'; 
fOH(i)=fOH(i)-1; fNO(i)=fNO(i)-1; fHONO(i)=fHONO(i)+1; 

i=i+1;
Rnames{i} = ' HONO + hv = OH + NO ';
k(:,i) =  1.0.*JHONO_06;
Gstr{i,1} = 'HONO'; 
fHONO(i)=fHONO(i)-1; fOH(i)=fOH(i)+1; fNO(i)=fNO(i)+1; 

i=i+1;
Rnames{i} = ' OH + HONO = NO2 ';
k(:,i) =  2.50e-12.*exp(260./ T);
Gstr{i,1} = 'OH'; Gstr{i,2} = 'HONO'; 
fOH(i)=fOH(i)-1; fHONO(i)=fHONO(i)-1; fNO2(i)=fNO2(i)+1; 

i=i+1;
Rnames{i} = ' OH + NO2 = HNO3 ';
k(:,i) = K_OH_NO2;
Gstr{i,1} = 'OH'; Gstr{i,2} = 'NO2'; 
fOH(i)=fOH(i)-1; fNO2(i)=fNO2(i)-1; fHNO3(i)=fHNO3(i)+1; 

i=i+1;
Rnames{i} = ' OH + NO3 = HO2 + NO2 ';
k(:,i) =  2.00e-11;
Gstr{i,1} = 'OH'; Gstr{i,2} = 'NO3'; 
fOH(i)=fOH(i)-1; fNO3(i)=fNO3(i)-1; fHO2(i)=fHO2(i)+1; fNO2(i)=fNO2(i)+1; 

i=i+1;
Rnames{i} = ' OH + HNO3 = NO3 ';
k(:,i) = K_OH_HNO3;
Gstr{i,1} = 'OH'; Gstr{i,2} = 'HNO3'; 
fOH(i)=fOH(i)-1; fHNO3(i)=fHNO3(i)-1; fNO3(i)=fNO3(i)+1; 

i=i+1;
Rnames{i} = ' HNO3 + hv = OH + NO2 ';
k(:,i) =  1.0.*JHNO3;
Gstr{i,1} = 'HNO3'; 
fHNO3(i)=fHNO3(i)-1; fOH(i)=fOH(i)+1; fNO2(i)=fNO2(i)+1; 

i=i+1;
Rnames{i} = ' OH + CO = HO2 + CO2 ';
k(:,i) = K_OH_CO;
Gstr{i,1} = 'OH'; Gstr{i,2} = 'CO'; 
fOH(i)=fOH(i)-1; fCO(i)=fCO(i)-1; fHO2(i)=fHO2(i)+1; fCO2(i)=fCO2(i)+1; 

i=i+1;
Rnames{i} = ' OH + O3 = HO2 ';
k(:,i) =  1.70e-12.*exp(-940./ T);
Gstr{i,1} = 'OH'; Gstr{i,2} = 'O3'; 
fOH(i)=fOH(i)-1; fO3(i)=fO3(i)-1; fHO2(i)=fHO2(i)+1; 

i=i+1;
Rnames{i} = ' HO2 + NO = OH + NO2 ';
k(:,i) =  3.60e-12.*exp(270./ T);
Gstr{i,1} = 'HO2'; Gstr{i,2} = 'NO'; 
fHO2(i)=fHO2(i)-1; fNO(i)=fNO(i)-1; fOH(i)=fOH(i)+1; fNO2(i)=fNO2(i)+1; 

i=i+1;
Rnames{i} = ' HO2 + NO2 = HNO4 ';
k(:,i) = K_HO2_NO2;
Gstr{i,1} = 'HO2'; Gstr{i,2} = 'NO2'; 
fHO2(i)=fHO2(i)-1; fNO2(i)=fNO2(i)-1; fHNO4(i)=fHNO4(i)+1; 

i=i+1;
Rnames{i} = ' HNO4 = HO2 + NO2 ';
k(:,i) = K_HNO4;
Gstr{i,1} = 'HNO4'; 
fHNO4(i)=fHNO4(i)-1; fHO2(i)=fHO2(i)+1; fNO2(i)=fNO2(i)+1; 

i=i+1;
Rnames{i} = ' HNO4 + hv = 0.61*HO2 + 0.61*NO2 + 0.39*OH + 0.39*NO3 ';
k(:,i) =  1.0.*JHNO4_06;
Gstr{i,1} = 'HNO4'; 
fHNO4(i)=fHNO4(i)-1; fHO2(i)=fHO2(i)+0.61; fNO2(i)=fNO2(i)+0.61; fOH(i)=fOH(i)+0.39; fNO3(i)=fNO3(i)+0.39; 

i=i+1;
Rnames{i} = ' HNO4 + OH = NO2 ';
k(:,i) =  1.30e-12.*exp(380./ T);
Gstr{i,1} = 'HNO4'; Gstr{i,2} = 'OH'; 
fHNO4(i)=fHNO4(i)-1; fOH(i)=fOH(i)-1; fNO2(i)=fNO2(i)+1; 

i=i+1;
Rnames{i} = ' HO2 + O3 = OH ';
k(:,i) =  2.03e-16.*(T./300).^4.57.*exp(693./T);
Gstr{i,1} = 'HO2'; Gstr{i,2} = 'O3'; 
fHO2(i)=fHO2(i)-1; fO3(i)=fO3(i)-1; fOH(i)=fOH(i)+1; 

i=i+1;
Rnames{i} = ' HO2 + HO2 = HO2H ';
k(:,i) = K_HO2_HO2;
Gstr{i,1} = 'HO2'; Gstr{i,2} = 'HO2'; 
fHO2(i)=fHO2(i)-1; fHO2(i)=fHO2(i)-1; fHO2H(i)=fHO2H(i)+1; 

i=i+1;
Rnames{i} = ' HO2 + HO2 + H2O = HO2H ';
k(:,i) = K_HO2_HO2_H2O.*H2O;
Gstr{i,1} = 'HO2'; Gstr{i,2} = 'HO2'; 
fHO2(i)=fHO2(i)-1; fHO2(i)=fHO2(i)-1; fHO2H(i)=fHO2H(i)+1; 

i=i+1;
Rnames{i} = ' NO3 + HO2 = 0.8*OH + 0.8*NO2 + 0.2*HNO3 ';
k(:,i) =  4.00e-12;
Gstr{i,1} = 'NO3'; Gstr{i,2} = 'HO2'; 
fNO3(i)=fNO3(i)-1; fHO2(i)=fHO2(i)-1; fOH(i)=fOH(i)+0.8; fNO2(i)=fNO2(i)+0.8; fHNO3(i)=fHNO3(i)+0.2; 

i=i+1;
Rnames{i} = ' NO3 + NO3 = 2*NO2 ';
k(:,i) =  8.50e-13.*exp(-2450./ T);
Gstr{i,1} = 'NO3'; Gstr{i,2} = 'NO3'; 
fNO3(i)=fNO3(i)-1; fNO3(i)=fNO3(i)-1; fNO2(i)=fNO2(i)+2; 

i=i+1;
Rnames{i} = ' HO2H + hv = 2*OH ';
k(:,i) =  1.0.*JH2O2;
Gstr{i,1} = 'HO2H'; 
fHO2H(i)=fHO2H(i)-1; fOH(i)=fOH(i)+2; 

i=i+1;
Rnames{i} = ' HO2H + OH = HO2 ';
k(:,i) =  1.80e-12;
Gstr{i,1} = 'HO2H'; Gstr{i,2} = 'OH'; 
fHO2H(i)=fHO2H(i)-1; fOH(i)=fOH(i)-1; fHO2(i)=fHO2(i)+1; 

i=i+1;
Rnames{i} = ' OH + HO2 =  ';
k(:,i) =  4.80e-11.*exp(250./ T);
Gstr{i,1} = 'OH'; Gstr{i,2} = 'HO2'; 
fOH(i)=fOH(i)-1; fHO2(i)=fHO2(i)-1; 

i=i+1;
Rnames{i} = ' OH + SO2 = HO2 + SULF ';
k(:,i) = K_OH_SO2;
Gstr{i,1} = 'OH'; Gstr{i,2} = 'SO2'; 
fOH(i)=fOH(i)-1; fSO2(i)=fSO2(i)-1; fHO2(i)=fHO2(i)+1; fSULF(i)=fSULF(i)+1; 

i=i+1;
Rnames{i} = ' OH + H2 = HO2 ';
k(:,i) =  7.70e-12.*exp(-2100./ T);
Gstr{i,1} = 'OH'; Gstr{i,2} = 'H2'; 
fOH(i)=fOH(i)-1; fH2(i)=fH2(i)-1; fHO2(i)=fHO2(i)+1; 

i=i+1;
Rnames{i} = ' MEO2 + NO = NO2 + HCHO + HO2 ';
k(:,i) =  2.30e-12.*exp(360./ T);
Gstr{i,1} = 'MEO2'; Gstr{i,2} = 'NO'; 
fMEO2(i)=fMEO2(i)-1; fNO(i)=fNO(i)-1; fNO2(i)=fNO2(i)+1; fHCHO(i)=fHCHO(i)+1; fHO2(i)=fHO2(i)+1; 

i=i+1;
Rnames{i} = 'MEO2 + HO2 = COOH + O2';
k(:,i) = 3.46e-13.*(T./300).^0.36.*exp(779.992./T);
Gstr{i,1} = 'MEO2'; Gstr{i,2} = 'HO2';
fMEO2(i)=fMEO2(i)-1; fHO2(i)=fHO2(i)-1; fCOOH(i)=fCOOH(i)+1; fO2(i)=fO2(i)+1;

i=i+1;
Rnames{i} = 'MEO2 + HO2 = HCHO + O2 + H2O';
k(:,i) = 3.34e-14.*(T./300).^-3.53.*exp(779.992./T);
Gstr{i,1} = 'MEO2'; Gstr{i,2} = 'HO2';
fMEO2(i)=fMEO2(i)-1; fHO2(i)=fHO2(i)-1; fHCHO(i)=fHCHO(i)+1; fO2(i)=fO2(i)+1; fH2O(i)=fH2O(i)+1;

i=i+1;
Rnames{i} = 'MEO2 + NO3 = HCHO + HO2 + NO2';
k(:,i) = 1.30e-12;
Gstr{i,1} = 'MEO2'; Gstr{i,2} = 'NO3';
fMEO2(i)=fMEO2(i)-1; fNO3(i)=fNO3(i)-1; fHCHO(i)=fHCHO(i)+1; fHO2(i)=fHO2(i)+1; fNO2(i)=fNO2(i)+1;

i=i+1;
Rnames{i} = 'MEO2 + MEO2 = MEOH + HCHO + O2';
k(:,i) = 6.39e-14.*(T./300).^-1.80.*exp(364.835./T);
Gstr{i,1} = 'MEO2'; Gstr{i,2} = 'MEO2';
fMEO2(i)=fMEO2(i)-1; fMEO2(i)=fMEO2(i)-1; fMEOH(i)=fMEOH(i)+1; fHCHO(i)=fHCHO(i)+1; fO2(i)=fO2(i)+1;

i=i+1;
Rnames{i} = 'MEO2 + MEO2 = 2*HCHO + 2*HO2';
k(:,i) = 7.40e-13.*(T./300).^0.00.*exp(-519.827./T);
Gstr{i,1} = 'MEO2'; Gstr{i,2} = 'MEO2';
fMEO2(i)=fMEO2(i)-1; fMEO2(i)=fMEO2(i)-1; fHCHO(i)=fHCHO(i)+2; fHO2(i)=fHO2(i)+2;

i=i+1;
Rnames{i} = 'RO2C + NO = NO2';
k(:,i) = 2.60e-12.*(T./300).^0.00.*exp(379.932./T);
Gstr{i,1} = 'RO2C'; Gstr{i,2} = 'NO';
fRO2C(i)=fRO2C(i)-1; fNO(i)=fNO(i)-1; fNO2(i)=fNO2(i)+1;

i=i+1;
Rnames{i} = 'RO2C + HO2 = ';
k(:,i) = 3.80e-13.*(T./300).^0.00.*exp(899.758./T);
Gstr{i,1} = 'RO2C'; Gstr{i,2} = 'HO2';
fRO2C(i)=fRO2C(i)-1; fHO2(i)=fHO2(i)-1; 

i=i+1;
Rnames{i} = 'RO2C + NO3 = NO2';
k(:,i) = 2.30e-12;
Gstr{i,1} = 'RO2C'; Gstr{i,2} = 'NO3';
fRO2C(i)=fRO2C(i)-1; fNO3(i)=fNO3(i)-1; fNO2(i)=fNO2(i)+1;

i=i+1;
Rnames{i} = 'RO2C + MEO2 = .5*HO2 + .75*HCHO + .25*MEOH';
k(:,i) = 2.00e-13;
Gstr{i,1} = 'RO2C'; Gstr{i,2} = 'MEO2';
fRO2C(i)=fRO2C(i)-1; fMEO2(i)=fMEO2(i)-1; fHO2(i)=fHO2(i)+.5; fHCHO(i)=fHCHO(i)+.75; fMEOH(i)=fMEOH(i)+.25;

i=i+1;
Rnames{i} = 'RO2C + RO2C = ';
k(:,i) = 3.50e-14;
Gstr{i,1} = 'RO2C'; Gstr{i,2} = 'RO2C';
fRO2C(i)=fRO2C(i)-1; fRO2C(i)=fRO2C(i)-1; 

i=i+1;
Rnames{i} = 'RO2XC + NO = XN';
k(:,i) = 2.60e-12.*(T./300).^0.00.*exp(379.932./T);
Gstr{i,1} = 'RO2XC'; Gstr{i,2} = 'NO';
fRO2XC(i)=fRO2XC(i)-1; fNO(i)=fNO(i)-1; fXN(i)=fXN(i)+1;

i=i+1;
Rnames{i} = 'RO2XC + HO2 = ';
k(:,i) = 3.80e-13.*(T./300).^0.00.*exp(899.758./T);
Gstr{i,1} = 'RO2XC'; Gstr{i,2} = 'HO2';
fRO2XC(i)=fRO2XC(i)-1; fHO2(i)=fHO2(i)-1; 

i=i+1;
Rnames{i} = 'RO2XC + NO3 = NO2';
k(:,i) = 2.30e-12;
Gstr{i,1} = 'RO2XC'; Gstr{i,2} = 'NO3';
fRO2XC(i)=fRO2XC(i)-1; fNO3(i)=fNO3(i)-1; fNO2(i)=fNO2(i)+1;

i=i+1;
Rnames{i} = 'RO2XC + MEO2 = .5*HO2 + .75*HCHO + .25*MEOH';
k(:,i) = 2.00e-13;
Gstr{i,1} = 'RO2XC'; Gstr{i,2} = 'MEO2';
fRO2XC(i)=fRO2XC(i)-1; fMEO2(i)=fMEO2(i)-1; fHO2(i)=fHO2(i)+.5; fHCHO(i)=fHCHO(i)+.75; fMEOH(i)=fMEOH(i)+.25;

i=i+1;
Rnames{i} = 'RO2XC + RO2C = ';
k(:,i) = 3.50e-14;
Gstr{i,1} = 'RO2XC'; Gstr{i,2} = 'RO2C';
fRO2XC(i)=fRO2XC(i)-1; fRO2C(i)=fRO2C(i)-1; 

i=i+1;
Rnames{i} = 'RO2XC + RO2XC = ';
k(:,i) = 3.50e-14;
Gstr{i,1} = 'RO2XC'; Gstr{i,2} = 'RO2XC';
fRO2XC(i)=fRO2XC(i)-1; fRO2XC(i)=fRO2XC(i)-1; 

i=i+1;
Rnames{i} = 'MECO3 + NO2 = PAN';
k(:,i) = K_MECO3_NO2;
Gstr{i,1} = 'MECO3'; Gstr{i,2} = 'NO2';
fMECO3(i)=fMECO3(i)-1; fNO2(i)=fNO2(i)-1; fPAN(i)=fPAN(i)+1;

i=i+1;
Rnames{i} = 'PAN = MECO3 + NO2';
k(:,i) = K_PAN;
Gstr{i,1} = 'PAN';
fPAN(i)=fPAN(i)-1; fMECO3(i)=fMECO3(i)+1; fNO2(i)=fNO2(i)+1;

i=i+1;
Rnames{i} = 'PAN + HV = .6*MECO3 + .6*NO2 + .4*MEO2 + CO2 + .4*NO3';
k(:,i) = JPAN;
Gstr{i,1} = 'PAN';
fPAN(i)=fPAN(i)-1; fMECO3(i)=fMECO3(i)+.6; fNO2(i)=fNO2(i)+.6; fMEO2(i)=fMEO2(i)+.4; fCO2(i)=fCO2(i)+1; fNO3(i)=fNO3(i)+.4;

i=i+1;
Rnames{i} = 'MECO3 + NO = MEO2 + CO2 + NO2';
k(:,i) = 7.50e-12.*(T./300).^0.00.*exp(289.855./T);
Gstr{i,1} = 'MECO3'; Gstr{i,2} = 'NO';
fMECO3(i)=fMECO3(i)-1; fNO(i)=fNO(i)-1; fMEO2(i)=fMEO2(i)+1; fCO2(i)=fCO2(i)+1; fNO2(i)=fNO2(i)+1;

i=i+1;
Rnames{i} = 'MECO3 + HO2 = .7*CCO3H + .7*O2 + .3CCOOH + .3*O3';
k(:,i) = 5.20e-13.*(T./300).^0.00.*exp(979.771./T);
Gstr{i,1} = 'MECO3'; Gstr{i,2} = 'HO2';
fMECO3(i)=fMECO3(i)-1; fHO2(i)=fHO2(i)-1; fCCO3H(i)=fCCO3H(i)+.7; fO2(i)=fO2(i)+.7; fCCOOH(i)=fCCOOH(i)+1; fO3(i)=fO3(i)+.3;

i=i+1;
Rnames{i} = 'MECO3 + NO3 = MEO2 + CO2 + NO2 + O2';
k(:,i) = 2.30e-12;
Gstr{i,1} = 'MECO3'; Gstr{i,2} = 'NO3';
fMECO3(i)=fMECO3(i)-1; fNO3(i)=fNO3(i)-1; fMEO2(i)=fMEO2(i)+1; fCO2(i)=fCO2(i)+1; fNO2(i)=fNO2(i)+1; fO2(i)=fO2(i)+1;

i=i+1;
Rnames{i} = 'MECO3 + MEO2 = .1*CCOOH + HCHO + .1*O2 + .9*HCHO + HO2 + MEO2 + .9*CO2';
k(:,i) = 2.00e-12.*(T./300).^0.00.*exp(500.201./T);
Gstr{i,1} = 'MECO3'; Gstr{i,2} = 'MEO2';
fMECO3(i)=fMECO3(i)-1; fMEO2(i)=fMEO2(i)-1; fCCOOH(i)=fCCOOH(i)+.1; fHCHO(i)=fHCHO(i)+1; fO2(i)=fO2(i)+.1; fHCHO(i)=fHCHO(i)+.9; fHO2(i)=fHO2(i)+1; fMEO2(i)=fMEO2(i)+1; fCO2(i)=fCO2(i)+.9;

i=i+1;
Rnames{i} = 'MECO3 + RO2C = MEO2 + CO2';
k(:,i) = 4.40e-13.*(T./300).^0.00.*exp(1069.847./T);
Gstr{i,1} = 'MECO3'; Gstr{i,2} = 'RO2C';
fMECO3(i)=fMECO3(i)-1; fRO2C(i)=fRO2C(i)-1; fMEO2(i)=fMEO2(i)+1; fCO2(i)=fCO2(i)+1;

i=i+1;
Rnames{i} = 'MECO3 + RO2XC = MEO2 + CO2';
k(:,i) = 4.40e-13.*(T./300).^0.00.*exp(1069.847./T);
Gstr{i,1} = 'MECO3'; Gstr{i,2} = 'RO2XC';
fMECO3(i)=fMECO3(i)-1; fRO2XC(i)=fRO2XC(i)-1; fMEO2(i)=fMEO2(i)+1; fCO2(i)=fCO2(i)+1;

i=i+1;
Rnames{i} = 'MECO3 + MECO3 = 2*MEO2 + 2*CO2 + O2';
k(:,i) = 2.90e-12.*(T./300).^0.00.*exp(500.201./T);
Gstr{i,1} = 'MECO3'; Gstr{i,2} = 'MECO3';
fMECO3(i)=fMECO3(i)-1; fMECO3(i)=fMECO3(i)-1; fMEO2(i)=fMEO2(i)+2; fCO2(i)=fCO2(i)+2; fO2(i)=fO2(i)+1;

i=i+1;
Rnames{i} = 'RCO3 + NO2 = PAN2';
k(:,i) = 1.21e-11.*(T./300).^-1.07.*exp(-0.0./T);
Gstr{i,1} = 'RCO3'; Gstr{i,2} = 'NO2';
fRCO3(i)=fRCO3(i)-1; fNO2(i)=fNO2(i)-1; fPAN2(i)=fPAN2(i)+1;

i=i+1;
Rnames{i} = 'PAN2 = RCO3 + NO2';
k(:,i) = 8.30e+16.*(T./300).^0.00.*exp(-13940.217./T);
Gstr{i,1} = 'PAN2';
fPAN2(i)=fPAN2(i)-1; fRCO3(i)=fRCO3(i)+1; fNO2(i)=fNO2(i)+1;

i=i+1;
Rnames{i} = 'PAN2 + HV = .6*RCO3 + .6*NO2 + .4*RO2C + xHO2 + yROOH + xCCHO + CO2 + .4*NO3';
k(:,i) = JPAN;
Gstr{i,1} = 'PAN2';
fPAN2(i)=fPAN2(i)-1; fRCO3(i)=fRCO3(i)+.6; fNO2(i)=fNO2(i)+.6; fRO2C(i)=fRO2C(i)+.4; fxHO2(i)=fxHO2(i)+1; fyROOH(i)=fyROOH(i)+1; fxCCHO(i)=fxCCHO(i)+1; fCO2(i)=fCO2(i)+1; fNO3(i)=fNO3(i)+.4;

i=i+1;
Rnames{i} = 'RCO3 + NO = NO2 + RO2C + xHO2 + yROOH + xCCHO + CO2';
k(:,i) = 6.70e-12.*(T./300).^0.00.*exp(340.177./T);
Gstr{i,1} = 'RCO3'; Gstr{i,2} = 'NO';
fRCO3(i)=fRCO3(i)-1; fNO(i)=fNO(i)-1; fNO2(i)=fNO2(i)+1; fRO2C(i)=fRO2C(i)+1; fxHO2(i)=fxHO2(i)+1; fyROOH(i)=fyROOH(i)+1; fxCCHO(i)=fxCCHO(i)+1; fCO2(i)=fCO2(i)+1;

i=i+1;
Rnames{i} = 'RCO3 + HO2 = .75*RCO3H + .75*O2 + .25*RCOOH + .25*O3';
k(:,i) = 5.20e-13.*(T./300).^0.00.*exp(979.771./T);
Gstr{i,1} = 'RCO3'; Gstr{i,2} = 'HO2';
fRCO3(i)=fRCO3(i)-1; fHO2(i)=fHO2(i)-1; fRCO3H(i)=fRCO3H(i)+.75; fO2(i)=fO2(i)+.75; fRCOOH(i)=fRCOOH(i)+.25; fO3(i)=fO3(i)+.25;

i=i+1;
Rnames{i} = 'RCO3 + NO3 = NO2 + RO2C + xHO2 + yROOH + xCCHO + CO2 + O2';
k(:,i) = 2.30e-12;
Gstr{i,1} = 'RCO3'; Gstr{i,2} = 'NO3';
fRCO3(i)=fRCO3(i)-1; fNO3(i)=fNO3(i)-1; fNO2(i)=fNO2(i)+1; fRO2C(i)=fRO2C(i)+1; fxHO2(i)=fxHO2(i)+1; fyROOH(i)=fyROOH(i)+1; fxCCHO(i)=fxCCHO(i)+1; fCO2(i)=fCO2(i)+1; fO2(i)=fO2(i)+1;

i=i+1;
Rnames{i} = 'RCO3 + MEO2 = HCHO + HO2 + RO2C + xHO2 + xCCHO + yROOH + CO2';
k(:,i) = 2.00e-12.*(T./300).^0.00.*exp(500.201./T);
Gstr{i,1} = 'RCO3'; Gstr{i,2} = 'MEO2';
fRCO3(i)=fRCO3(i)-1; fMEO2(i)=fMEO2(i)-1; fHCHO(i)=fHCHO(i)+1; fHO2(i)=fHO2(i)+1; fRO2C(i)=fRO2C(i)+1; fxHO2(i)=fxHO2(i)+1; fxCCHO(i)=fxCCHO(i)+1; fyROOH(i)=fyROOH(i)+1; fCO2(i)=fCO2(i)+1;

i=i+1;
Rnames{i} = 'RCO3 + RO2C = RO2C + xHO2 + xCCHO + yROOH + CO2';
k(:,i) = 4.40e-13.*(T./300).^0.00.*exp(1069.847./T);
Gstr{i,1} = 'RCO3'; Gstr{i,2} = 'RO2C';
fRCO3(i)=fRCO3(i)-1; fRO2C(i)=fRO2C(i)-1; fRO2C(i)=fRO2C(i)+1; fxHO2(i)=fxHO2(i)+1; fxCCHO(i)=fxCCHO(i)+1; fyROOH(i)=fyROOH(i)+1; fCO2(i)=fCO2(i)+1;

i=i+1;
Rnames{i} = 'RCO3 + RO2XC = RO2C + xHO2 + xCCHO + yROOH + CO2';
k(:,i) = 4.40e-13.*(T./300).^0.00.*exp(1069.847./T);
Gstr{i,1} = 'RCO3'; Gstr{i,2} = 'RO2XC';
fRCO3(i)=fRCO3(i)-1; fRO2XC(i)=fRO2XC(i)-1; fRO2C(i)=fRO2C(i)+1; fxHO2(i)=fxHO2(i)+1; fxCCHO(i)=fxCCHO(i)+1; fyROOH(i)=fyROOH(i)+1; fCO2(i)=fCO2(i)+1;

i=i+1;
Rnames{i} = 'RCO3 + MECO3 = 2*CO2 + MEO2 + RO2C + xHO2 + yROOH + xCCHO + O2';
k(:,i) = 2.90e-12.*(T./300).^0.00.*exp(500.201./T);
Gstr{i,1} = 'RCO3'; Gstr{i,2} = 'MECO3';
fRCO3(i)=fRCO3(i)-1; fMECO3(i)=fMECO3(i)-1; fCO2(i)=fCO2(i)+2; fMEO2(i)=fMEO2(i)+1; fRO2C(i)=fRO2C(i)+1; fxHO2(i)=fxHO2(i)+1; fyROOH(i)=fyROOH(i)+1; fxCCHO(i)=fxCCHO(i)+1; fO2(i)=fO2(i)+1;

i=i+1;
Rnames{i} = 'RCO3 + RCO3 = 2*RO2C + xHO2 + xCCHO + yROOH + 2*CO2';
k(:,i) = 2.90e-12.*(T./300).^0.00.*exp(500.201./T);
Gstr{i,1} = 'RCO3'; Gstr{i,2} = 'RCO3';
fRCO3(i)=fRCO3(i)-1; fRCO3(i)=fRCO3(i)-1; fRO2C(i)=fRO2C(i)+2; fxHO2(i)=fxHO2(i)+1; fxCCHO(i)=fxCCHO(i)+1; fyROOH(i)=fyROOH(i)+1; fCO2(i)=fCO2(i)+2;

i=i+1;
Rnames{i} = 'BZCO3 + NO2 = PBZN';
k(:,i) = 1.37e-11;
Gstr{i,1} = 'BZCO3'; Gstr{i,2} = 'NO2';
fBZCO3(i)=fBZCO3(i)-1; fNO2(i)=fNO2(i)-1; fPBZN(i)=fPBZN(i)+1;

i=i+1;
Rnames{i} = 'PBZN = BZCO3 + NO2';
k(:,i) = 7.90e+16.*(T./300).^0.00.*exp(-14000.101./T);
Gstr{i,1} = 'PBZN';
fPBZN(i)=fPBZN(i)-1; fBZCO3(i)=fBZCO3(i)+1; fNO2(i)=fNO2(i)+1;

i=i+1;
Rnames{i} = 'PBZN + HV = .6*BZCO3 + .6*NO2 + .4*CO2 + BZO + RO2C + .4*NO3';
k(:,i) = JPAN;
Gstr{i,1} = 'PBZN';
fPBZN(i)=fPBZN(i)-1; fBZCO3(i)=fBZCO3(i)+.6; fNO2(i)=fNO2(i)+.6; fCO2(i)=fCO2(i)+.4; fBZO(i)=fBZO(i)+1; fRO2C(i)=fRO2C(i)+1; fNO3(i)=fNO3(i)+.4;

i=i+1;
Rnames{i} = 'BZCO3 + NO = NO2 + CO2 + BZO + RO2C';
k(:,i) = 6.70e-12.*(T./300).^0.00.*exp(340.177./T);
Gstr{i,1} = 'BZCO3'; Gstr{i,2} = 'NO';
fBZCO3(i)=fBZCO3(i)-1; fNO(i)=fNO(i)-1; fNO2(i)=fNO2(i)+1; fCO2(i)=fCO2(i)+1; fBZO(i)=fBZO(i)+1; fRO2C(i)=fRO2C(i)+1;

i=i+1;
Rnames{i} = 'BZCO3 + HO2 = .75*RCO3H + .75*O2 + .25*RCOOH + .25*O3 + 4*XC';
k(:,i) = 5.20e-13.*(T./300).^0.00.*exp(979.771./T);
Gstr{i,1} = 'BZCO3'; Gstr{i,2} = 'HO2';
fBZCO3(i)=fBZCO3(i)-1; fHO2(i)=fHO2(i)-1; fRCO3H(i)=fRCO3H(i)+.75; fO2(i)=fO2(i)+.75; fRCOOH(i)=fRCOOH(i)+.25; fO3(i)=fO3(i)+.25; fXC(i)=fXC(i)+4;

i=i+1;
Rnames{i} = 'BZCO3 + NO3 = NO2 + CO2 + BZO + RO2C + O2';
k(:,i) = 2.30e-12;
Gstr{i,1} = 'BZCO3'; Gstr{i,2} = 'NO3';
fBZCO3(i)=fBZCO3(i)-1; fNO3(i)=fNO3(i)-1; fNO2(i)=fNO2(i)+1; fCO2(i)=fCO2(i)+1; fBZO(i)=fBZO(i)+1; fRO2C(i)=fRO2C(i)+1; fO2(i)=fO2(i)+1;

i=i+1;
Rnames{i} = 'BZCO3 + MEO2 = HCHO + HO2 + RO2C + BZO + CO2';
k(:,i) = 2.00e-12.*(T./300).^0.00.*exp(500.201./T);
Gstr{i,1} = 'BZCO3'; Gstr{i,2} = 'MEO2';
fBZCO3(i)=fBZCO3(i)-1; fMEO2(i)=fMEO2(i)-1; fHCHO(i)=fHCHO(i)+1; fHO2(i)=fHO2(i)+1; fRO2C(i)=fRO2C(i)+1; fBZO(i)=fBZO(i)+1; fCO2(i)=fCO2(i)+1;

i=i+1;
Rnames{i} = 'BZCO3 + RO2C = RO2C + BZO + CO2';
k(:,i) = 4.40e-13.*(T./300).^0.00.*exp(1069.847./T);
Gstr{i,1} = 'BZCO3'; Gstr{i,2} = 'RO2C';
fBZCO3(i)=fBZCO3(i)-1; fRO2C(i)=fRO2C(i)-1; fRO2C(i)=fRO2C(i)+1; fBZO(i)=fBZO(i)+1; fCO2(i)=fCO2(i)+1;

i=i+1;
Rnames{i} = 'BZCO3 + RO2XC = RO2C + BZO + CO2';
k(:,i) = 4.40e-13.*(T./300).^0.00.*exp(1069.847./T);
Gstr{i,1} = 'BZCO3'; Gstr{i,2} = 'RO2XC';
fBZCO3(i)=fBZCO3(i)-1; fRO2XC(i)=fRO2XC(i)-1; fRO2C(i)=fRO2C(i)+1; fBZO(i)=fBZO(i)+1; fCO2(i)=fCO2(i)+1;

i=i+1;
Rnames{i} = 'BZCO3 + MECO3 = 2*CO2 + MEO2 + BZO + RO2C';
k(:,i) = 2.90e-12.*(T./300).^0.00.*exp(500.201./T);
Gstr{i,1} = 'BZCO3'; Gstr{i,2} = 'MECO3';
fBZCO3(i)=fBZCO3(i)-1; fMECO3(i)=fMECO3(i)-1; fCO2(i)=fCO2(i)+2; fMEO2(i)=fMEO2(i)+1; fBZO(i)=fBZO(i)+1; fRO2C(i)=fRO2C(i)+1;

i=i+1;
Rnames{i} = 'BZCO3 + RCO3 = 2*CO2 + RO2C + xHO2 + yROOH + xCCHO + BZO + RO2C';
k(:,i) = 2.90e-12.*(T./300).^0.00.*exp(500.201./T);
Gstr{i,1} = 'BZCO3'; Gstr{i,2} = 'RCO3';
fBZCO3(i)=fBZCO3(i)-1; fRCO3(i)=fRCO3(i)-1; fCO2(i)=fCO2(i)+2; fRO2C(i)=fRO2C(i)+1; fxHO2(i)=fxHO2(i)+1; fyROOH(i)=fyROOH(i)+1; fxCCHO(i)=fxCCHO(i)+1; fBZO(i)=fBZO(i)+1; fRO2C(i)=fRO2C(i)+1;

i=i+1;
Rnames{i} = 'BZCO3 + BZCO3 = 2*BZO + RO2C + 2*CO2';
k(:,i) = 2.90e-12.*(T./300).^0.00.*exp(500.201./T);
Gstr{i,1} = 'BZCO3'; Gstr{i,2} = 'BZCO3';
fBZCO3(i)=fBZCO3(i)-1; fBZCO3(i)=fBZCO3(i)-1; fBZO(i)=fBZO(i)+2; fRO2C(i)=fRO2C(i)+1; fCO2(i)=fCO2(i)+2;

i=i+1;
Rnames{i} = 'MACO3 + NO2 = MAPAN';
k(:,i) = 1.21e-11.*(T./300).^-1.07.*exp(-0.0./T);
Gstr{i,1} = 'MACO3'; Gstr{i,2} = 'NO2';
fMACO3(i)=fMACO3(i)-1; fNO2(i)=fNO2(i)-1; fMAPAN(i)=fMAPAN(i)+1;

i=i+1;
Rnames{i} = 'MAPAN = MACO3 + NO2';
k(:,i) = 1.60e+16.*(T./300).^0.00.*exp(-13486.312./T);
Gstr{i,1} = 'MAPAN';
fMAPAN(i)=fMAPAN(i)-1; fMACO3(i)=fMACO3(i)+1; fNO2(i)=fNO2(i)+1;

i=i+1;
Rnames{i} = 'MAPAN + HV = .6*MACO3 + .6*NO2 + .4*CO2 + HCHO + MECO3 + .4*NO3';
k(:,i) = JPAN;
Gstr{i,1} = 'MAPAN';
fMAPAN(i)=fMAPAN(i)-1; fMACO3(i)=fMACO3(i)+.6; fNO2(i)=fNO2(i)+.6; fCO2(i)=fCO2(i)+.4; fHCHO(i)=fHCHO(i)+1; fMECO3(i)=fMECO3(i)+1; fNO3(i)=fNO3(i)+.4;

i=i+1;
Rnames{i} = 'MACO3 + NO = NO2 + CO2 + HCHO + MECO3';
k(:,i) = 6.70e-12.*(T./300).^0.00.*exp(340.177./T);
Gstr{i,1} = 'MACO3'; Gstr{i,2} = 'NO';
fMACO3(i)=fMACO3(i)-1; fNO(i)=fNO(i)-1; fNO2(i)=fNO2(i)+1; fCO2(i)=fCO2(i)+1; fHCHO(i)=fHCHO(i)+1; fMECO3(i)=fMECO3(i)+1;

i=i+1;
Rnames{i} = 'MACO3 + HO2 = .75*RCO3H + .75*O2 + .25*RCOOH + .25*O3 + XC';
k(:,i) = 5.20e-13.*(T./300).^0.00.*exp(979.771./T);
Gstr{i,1} = 'MACO3'; Gstr{i,2} = 'HO2';
fMACO3(i)=fMACO3(i)-1; fHO2(i)=fHO2(i)-1; fRCO3H(i)=fRCO3H(i)+.75; fO2(i)=fO2(i)+.75; fRCOOH(i)=fRCOOH(i)+.25; fO3(i)=fO3(i)+.25; fXC(i)=fXC(i)+1;

i=i+1;
Rnames{i} = 'MACO3 + NO3 = NO2 + CO2 + HCHO + MECO3 + O2';
k(:,i) = 2.30e-12;
Gstr{i,1} = 'MACO3'; Gstr{i,2} = 'NO3';
fMACO3(i)=fMACO3(i)-1; fNO3(i)=fNO3(i)-1; fNO2(i)=fNO2(i)+1; fCO2(i)=fCO2(i)+1; fHCHO(i)=fHCHO(i)+1; fMECO3(i)=fMECO3(i)+1; fO2(i)=fO2(i)+1;

i=i+1;
Rnames{i} = 'MACO3 + MEO2 = 2*HCHO + HO2 + CO2 + MECO3';
k(:,i) = 2.00e-12.*(T./300).^0.00.*exp(500.201./T);
Gstr{i,1} = 'MACO3'; Gstr{i,2} = 'MEO2';
fMACO3(i)=fMACO3(i)-1; fMEO2(i)=fMEO2(i)-1; fHCHO(i)=fHCHO(i)+2; fHO2(i)=fHO2(i)+1; fCO2(i)=fCO2(i)+1; fMECO3(i)=fMECO3(i)+1;

i=i+1;
Rnames{i} = 'MACO3 + RO2C = CO2 + HCHO + MECO3';
k(:,i) = 4.40e-13.*(T./300).^0.00.*exp(1069.847./T);
Gstr{i,1} = 'MACO3'; Gstr{i,2} = 'RO2C';
fMACO3(i)=fMACO3(i)-1; fRO2C(i)=fRO2C(i)-1; fCO2(i)=fCO2(i)+1; fHCHO(i)=fHCHO(i)+1; fMECO3(i)=fMECO3(i)+1;

i=i+1;
Rnames{i} = 'MACO3 + RO2XC = CO2 + HCHO + MECO3';
k(:,i) = 4.40e-13.*(T./300).^0.00.*exp(1069.847./T);
Gstr{i,1} = 'MACO3'; Gstr{i,2} = 'RO2XC';
fMACO3(i)=fMACO3(i)-1; fRO2XC(i)=fRO2XC(i)-1; fCO2(i)=fCO2(i)+1; fHCHO(i)=fHCHO(i)+1; fMECO3(i)=fMECO3(i)+1;

i=i+1;
Rnames{i} = 'MACO3 + MECO3 = 2*CO2 + MEO2 + HCHO + MECO3 + O2';
k(:,i) = 2.90e-12.*(T./300).^0.00.*exp(500.201./T);
Gstr{i,1} = 'MACO3'; Gstr{i,2} = 'MECO3';
fMACO3(i)=fMACO3(i)-1; fMECO3(i)=fMECO3(i)-1; fCO2(i)=fCO2(i)+2; fMEO2(i)=fMEO2(i)+1; fHCHO(i)=fHCHO(i)+1; fMECO3(i)=fMECO3(i)+1; fO2(i)=fO2(i)+1;

i=i+1;
Rnames{i} = 'MACO3 + RCO3 = HCHO + MECO3 + RO2C + xHO2 + yROOH + xCCHO + 2*CO2';
k(:,i) = 2.90e-12.*(T./300).^0.00.*exp(500.201./T);
Gstr{i,1} = 'MACO3'; Gstr{i,2} = 'RCO3';
fMACO3(i)=fMACO3(i)-1; fRCO3(i)=fRCO3(i)-1; fHCHO(i)=fHCHO(i)+1; fMECO3(i)=fMECO3(i)+1; fRO2C(i)=fRO2C(i)+1; fxHO2(i)=fxHO2(i)+1; fyROOH(i)=fyROOH(i)+1; fxCCHO(i)=fxCCHO(i)+1; fCO2(i)=fCO2(i)+2;

i=i+1;
Rnames{i} = 'MACO3 + BZCO3 = HCHO + MECO3 + BZO + RO2C + 2*CO2';
k(:,i) = 2.90e-12.*(T./300).^0.00.*exp(500.201./T);
Gstr{i,1} = 'MACO3'; Gstr{i,2} = 'BZCO3';
fMACO3(i)=fMACO3(i)-1; fBZCO3(i)=fBZCO3(i)-1; fHCHO(i)=fHCHO(i)+1; fMECO3(i)=fMECO3(i)+1; fBZO(i)=fBZO(i)+1; fRO2C(i)=fRO2C(i)+1; fCO2(i)=fCO2(i)+2;

i=i+1;
Rnames{i} = 'MACO3 + MACO3 = 2*HCHO + MECO3 + 2*CO2';
k(:,i) = 2.90e-12.*(T./300).^0.00.*exp(500.201./T);
Gstr{i,1} = 'MACO3'; Gstr{i,2} = 'MACO3';
fMACO3(i)=fMACO3(i)-1; fMACO3(i)=fMACO3(i)-1; fHCHO(i)=fHCHO(i)+2; fMECO3(i)=fMECO3(i)+1; fCO2(i)=fCO2(i)+2;

i=i+1;
Rnames{i} = 'TBUO + NO2 = RNO3 - 2*XC';
k(:,i) = 2.40e-11;
Gstr{i,1} = 'TBUO'; Gstr{i,2} = 'NO2';
fTBUO(i)=fTBUO(i)-1; fNO2(i)=fNO2(i)-1; fRNO3(i)=fRNO3(i)+1; fXC(i)=fXC(i)-2;

i=i+1;
Rnames{i} = 'TBUO = ACET + MEO2';
k(:,i) = 7.50e+14.*(T./300).^0.00.*exp(-8152.174./T);
Gstr{i,1} = 'TBUO';
fTBUO(i)=fTBUO(i)-1; fACET(i)=fACET(i)+1; fMEO2(i)=fMEO2(i)+1;

i=i+1;
Rnames{i} = 'BZO + NO2 = NPHE';
k(:,i) = 2.30e-11.*(T./300).^0.00.*exp(149.96./T);
Gstr{i,1} = 'BZO'; Gstr{i,2} = 'NO2';
fBZO(i)=fBZO(i)-1; fNO2(i)=fNO2(i)-1; fNPHE(i)=fNPHE(i)+1;

i=i+1;
Rnames{i} = 'BZO + HO2 = CRES - 1*XC';
k(:,i) = 3.80e-13.*(T./300).^0.00.*exp(899.758./T);
Gstr{i,1} = 'BZO'; Gstr{i,2} = 'HO2';
fBZO(i)=fBZO(i)-1; fHO2(i)=fHO2(i)-1; fCRES(i)=fCRES(i)+1; fXC(i)=fXC(i)-1;

i=i+1;
Rnames{i} = 'BZO = CRES + RO2C + xHO2 - 1*XC';
k(:,i) = 1.00e-03;
Gstr{i,1} = 'BZO';
fBZO(i)=fBZO(i)-1; fCRES(i)=fCRES(i)+1; fRO2C(i)=fRO2C(i)+1; fxHO2(i)=fxHO2(i)+1; fXC(i)=fXC(i)-1;

i=i+1;
Rnames{i} = 'xHO2 + NO = NO + HO2';
k(:,i) = 2.60e-12.*(T./300).^0.00.*exp(379.932./T);
Gstr{i,1} = 'xHO2'; Gstr{i,2} = 'NO';
fxHO2(i)=fxHO2(i)-1; fNO(i)=fNO(i)-1; fNO(i)=fNO(i)+1; fHO2(i)=fHO2(i)+1;

i=i+1;
Rnames{i} = 'xHO2 + HO2 = HO2';
k(:,i) = 3.80e-13.*(T./300).^0.00.*exp(899.758./T);
Gstr{i,1} = 'xHO2'; Gstr{i,2} = 'HO2';
fxHO2(i)=fxHO2(i)-1; fHO2(i)=fHO2(i)-1; fHO2(i)=fHO2(i)+1;

i=i+1;
Rnames{i} = 'xHO2 + NO3 = NO3 + HO2';
k(:,i) = 2.30e-12;
Gstr{i,1} = 'xHO2'; Gstr{i,2} = 'NO3';
fxHO2(i)=fxHO2(i)-1; fNO3(i)=fNO3(i)-1; fNO3(i)=fNO3(i)+1; fHO2(i)=fHO2(i)+1;

i=i+1;
Rnames{i} = 'xHO2 + MEO2 = MEO2 + .5*HO2';
k(:,i) = 2.00e-13;
Gstr{i,1} = 'xHO2'; Gstr{i,2} = 'MEO2';
fxHO2(i)=fxHO2(i)-1; fMEO2(i)=fMEO2(i)-1; fMEO2(i)=fMEO2(i)+1; fHO2(i)=fHO2(i)+.5;

i=i+1;
Rnames{i} = 'xHO2 + RO2C = RO2C + .5*HO2';
k(:,i) = 3.50e-14;
Gstr{i,1} = 'xHO2'; Gstr{i,2} = 'RO2C';
fxHO2(i)=fxHO2(i)-1; fRO2C(i)=fRO2C(i)-1; fRO2C(i)=fRO2C(i)+1; fHO2(i)=fHO2(i)+.5;

i=i+1;
Rnames{i} = 'xHO2 + RO2XC = RO2XC + .5*HO2';
k(:,i) = 3.50e-14;
Gstr{i,1} = 'xHO2'; Gstr{i,2} = 'RO2XC';
fxHO2(i)=fxHO2(i)-1; fRO2XC(i)=fRO2XC(i)-1; fRO2XC(i)=fRO2XC(i)+1; fHO2(i)=fHO2(i)+.5;

i=i+1;
Rnames{i} = 'xHO2 + MECO3 = MECO3 + HO2';
k(:,i) = 4.40e-13.*(T./300).^0.00.*exp(1069.847./T);
Gstr{i,1} = 'xHO2'; Gstr{i,2} = 'MECO3';
fxHO2(i)=fxHO2(i)-1; fMECO3(i)=fMECO3(i)-1; fMECO3(i)=fMECO3(i)+1; fHO2(i)=fHO2(i)+1;

i=i+1;
Rnames{i} = 'xHO2 + RCO3 = RCO3 + HO2';
k(:,i) = 4.40e-13.*(T./300).^0.00.*exp(1069.847./T);
Gstr{i,1} = 'xHO2'; Gstr{i,2} = 'RCO3';
fxHO2(i)=fxHO2(i)-1; fRCO3(i)=fRCO3(i)-1; fRCO3(i)=fRCO3(i)+1; fHO2(i)=fHO2(i)+1;

i=i+1;
Rnames{i} = 'xHO2 + BZCO3 = BZCO3 + HO2';
k(:,i) = 4.40e-13.*(T./300).^0.00.*exp(1069.847./T);
Gstr{i,1} = 'xHO2'; Gstr{i,2} = 'BZCO3';
fxHO2(i)=fxHO2(i)-1; fBZCO3(i)=fBZCO3(i)-1; fBZCO3(i)=fBZCO3(i)+1; fHO2(i)=fHO2(i)+1;

i=i+1;
Rnames{i} = 'xHO2 + MACO3 = MACO3 + HO2';
k(:,i) = 4.40e-13.*(T./300).^0.00.*exp(1069.847./T);
Gstr{i,1} = 'xHO2'; Gstr{i,2} = 'MACO3';
fxHO2(i)=fxHO2(i)-1; fMACO3(i)=fMACO3(i)-1; fMACO3(i)=fMACO3(i)+1; fHO2(i)=fHO2(i)+1;

i=i+1;
Rnames{i} = 'xOH + NO = NO + OH';
k(:,i) = 2.60e-12.*(T./300).^0.00.*exp(379.932./T);
Gstr{i,1} = 'xOH'; Gstr{i,2} = 'NO';
fxOH(i)=fxOH(i)-1; fNO(i)=fNO(i)-1; fNO(i)=fNO(i)+1; fOH(i)=fOH(i)+1;

i=i+1;
Rnames{i} = 'xOH + HO2 = HO2';
k(:,i) = 3.80e-13.*(T./300).^0.00.*exp(899.758./T);
Gstr{i,1} = 'xOH'; Gstr{i,2} = 'HO2';
fxOH(i)=fxOH(i)-1; fHO2(i)=fHO2(i)-1; fHO2(i)=fHO2(i)+1;

i=i+1;
Rnames{i} = 'xOH + NO3 = NO3 + OH';
k(:,i) = 2.30e-12;
Gstr{i,1} = 'xOH'; Gstr{i,2} = 'NO3';
fxOH(i)=fxOH(i)-1; fNO3(i)=fNO3(i)-1; fNO3(i)=fNO3(i)+1; fOH(i)=fOH(i)+1;

i=i+1;
Rnames{i} = 'xOH + MEO2 = MEO2 + .5*OH';
k(:,i) = 2.00e-13;
Gstr{i,1} = 'xOH'; Gstr{i,2} = 'MEO2';
fxOH(i)=fxOH(i)-1; fMEO2(i)=fMEO2(i)-1; fMEO2(i)=fMEO2(i)+1; fOH(i)=fOH(i)+.5;

i=i+1;
Rnames{i} = 'xOH + RO2C = RO2C + .5*OH';
k(:,i) = 3.50e-14;
Gstr{i,1} = 'xOH'; Gstr{i,2} = 'RO2C';
fxOH(i)=fxOH(i)-1; fRO2C(i)=fRO2C(i)-1; fRO2C(i)=fRO2C(i)+1; fOH(i)=fOH(i)+.5;

i=i+1;
Rnames{i} = 'xOH + RO2XC = RO2XC + .5*OH';
k(:,i) = 3.50e-14;
Gstr{i,1} = 'xOH'; Gstr{i,2} = 'RO2XC';
fxOH(i)=fxOH(i)-1; fRO2XC(i)=fRO2XC(i)-1; fRO2XC(i)=fRO2XC(i)+1; fOH(i)=fOH(i)+.5;

i=i+1;
Rnames{i} = 'xOH + MECO3 = MECO3 + OH';
k(:,i) = 4.40e-13.*(T./300).^0.00.*exp(1069.847./T);
Gstr{i,1} = 'xOH'; Gstr{i,2} = 'MECO3';
fxOH(i)=fxOH(i)-1; fMECO3(i)=fMECO3(i)-1; fMECO3(i)=fMECO3(i)+1; fOH(i)=fOH(i)+1;

i=i+1;
Rnames{i} = 'xOH + RCO3 = RCO3 + OH';
k(:,i) = 4.40e-13.*(T./300).^0.00.*exp(1069.847./T);
Gstr{i,1} = 'xOH'; Gstr{i,2} = 'RCO3';
fxOH(i)=fxOH(i)-1; fRCO3(i)=fRCO3(i)-1; fRCO3(i)=fRCO3(i)+1; fOH(i)=fOH(i)+1;

i=i+1;
Rnames{i} = 'xOH + BZCO3 = BZCO3 + OH';
k(:,i) = 4.40e-13.*(T./300).^0.00.*exp(1069.847./T);
Gstr{i,1} = 'xOH'; Gstr{i,2} = 'BZCO3';
fxOH(i)=fxOH(i)-1; fBZCO3(i)=fBZCO3(i)-1; fBZCO3(i)=fBZCO3(i)+1; fOH(i)=fOH(i)+1;

i=i+1;
Rnames{i} = 'xOH + MACO3 = MACO3 + OH';
k(:,i) = 4.40e-13.*(T./300).^0.00.*exp(1069.847./T);
Gstr{i,1} = 'xOH'; Gstr{i,2} = 'MACO3';
fxOH(i)=fxOH(i)-1; fMACO3(i)=fMACO3(i)-1; fMACO3(i)=fMACO3(i)+1; fOH(i)=fOH(i)+1;

i=i+1;
Rnames{i} = 'xNO2 + NO = NO + NO2';
k(:,i) = 2.60e-12.*(T./300).^0.00.*exp(379.932./T);
Gstr{i,1} = 'xNO2'; Gstr{i,2} = 'NO';
fxNO2(i)=fxNO2(i)-1; fNO(i)=fNO(i)-1; fNO(i)=fNO(i)+1; fNO2(i)=fNO2(i)+1;

i=i+1;
Rnames{i} = 'xNO2 + HO2 = HO2 + XN';
k(:,i) = 3.80e-13.*(T./300).^0.00.*exp(899.758./T);
Gstr{i,1} = 'xNO2'; Gstr{i,2} = 'HO2';
fxNO2(i)=fxNO2(i)-1; fHO2(i)=fHO2(i)-1; fHO2(i)=fHO2(i)+1; fXN(i)=fXN(i)+1;

i=i+1;
Rnames{i} = 'xNO2 + NO3 = NO3 + NO2';
k(:,i) = 2.30e-12;
Gstr{i,1} = 'xNO2'; Gstr{i,2} = 'NO3';
fxNO2(i)=fxNO2(i)-1; fNO3(i)=fNO3(i)-1; fNO3(i)=fNO3(i)+1; fNO2(i)=fNO2(i)+1;

i=i+1;
Rnames{i} = 'xNO2 + MEO2 = MEO2 + .5*NO2 + .5*XN';
k(:,i) = 2.00e-13;
Gstr{i,1} = 'xNO2'; Gstr{i,2} = 'MEO2';
fxNO2(i)=fxNO2(i)-1; fMEO2(i)=fMEO2(i)-1; fMEO2(i)=fMEO2(i)+1; fNO2(i)=fNO2(i)+.5; fXN(i)=fXN(i)+.5;

i=i+1;
Rnames{i} = 'xNO2 + RO2C = RO2C + .5*NO2 + .5*XN';
k(:,i) = 3.50e-14;
Gstr{i,1} = 'xNO2'; Gstr{i,2} = 'RO2C';
fxNO2(i)=fxNO2(i)-1; fRO2C(i)=fRO2C(i)-1; fRO2C(i)=fRO2C(i)+1; fNO2(i)=fNO2(i)+.5; fXN(i)=fXN(i)+.5;

i=i+1;
Rnames{i} = 'xNO2 + RO2XC = RO2XC + .5*NO2 + .5*XN';
k(:,i) = 3.50e-14;
Gstr{i,1} = 'xNO2'; Gstr{i,2} = 'RO2XC';
fxNO2(i)=fxNO2(i)-1; fRO2XC(i)=fRO2XC(i)-1; fRO2XC(i)=fRO2XC(i)+1; fNO2(i)=fNO2(i)+.5; fXN(i)=fXN(i)+.5;

i=i+1;
Rnames{i} = 'xNO2 + MECO3 = MECO3 + NO2';
k(:,i) = 4.40e-13.*(T./300).^0.00.*exp(1069.847./T);
Gstr{i,1} = 'xNO2'; Gstr{i,2} = 'MECO3';
fxNO2(i)=fxNO2(i)-1; fMECO3(i)=fMECO3(i)-1; fMECO3(i)=fMECO3(i)+1; fNO2(i)=fNO2(i)+1;

i=i+1;
Rnames{i} = 'xNO2 + RCO3 = RCO3 + NO2';
k(:,i) = 4.40e-13.*(T./300).^0.00.*exp(1069.847./T);
Gstr{i,1} = 'xNO2'; Gstr{i,2} = 'RCO3';
fxNO2(i)=fxNO2(i)-1; fRCO3(i)=fRCO3(i)-1; fRCO3(i)=fRCO3(i)+1; fNO2(i)=fNO2(i)+1;

i=i+1;
Rnames{i} = 'xNO2 + BZCO3 = BZCO3 + NO2';
k(:,i) = 4.40e-13.*(T./300).^0.00.*exp(1069.847./T);
Gstr{i,1} = 'xNO2'; Gstr{i,2} = 'BZCO3';
fxNO2(i)=fxNO2(i)-1; fBZCO3(i)=fBZCO3(i)-1; fBZCO3(i)=fBZCO3(i)+1; fNO2(i)=fNO2(i)+1;

i=i+1;
Rnames{i} = 'xNO2 + MACO3 = MACO3 + NO2';
k(:,i) = 4.40e-13.*(T./300).^0.00.*exp(1069.847./T);
Gstr{i,1} = 'xNO2'; Gstr{i,2} = 'MACO3';
fxNO2(i)=fxNO2(i)-1; fMACO3(i)=fMACO3(i)-1; fMACO3(i)=fMACO3(i)+1; fNO2(i)=fNO2(i)+1;

i=i+1;
Rnames{i} = 'xMEO2 + NO = NO + MEO2';
k(:,i) = 2.60e-12.*(T./300).^0.00.*exp(379.932./T);
Gstr{i,1} = 'xMEO2'; Gstr{i,2} = 'NO';
fxMEO2(i)=fxMEO2(i)-1; fNO(i)=fNO(i)-1; fNO(i)=fNO(i)+1; fMEO2(i)=fMEO2(i)+1;

i=i+1;
Rnames{i} = 'xMEO2 + HO2 = HO2 + XC';
k(:,i) = 3.80e-13.*(T./300).^0.00.*exp(899.758./T);
Gstr{i,1} = 'xMEO2'; Gstr{i,2} = 'HO2';
fxMEO2(i)=fxMEO2(i)-1; fHO2(i)=fHO2(i)-1; fHO2(i)=fHO2(i)+1; fXC(i)=fXC(i)+1;

i=i+1;
Rnames{i} = 'xMEO2 + NO3 = NO3 + MEO2';
k(:,i) = 2.30e-12;
Gstr{i,1} = 'xMEO2'; Gstr{i,2} = 'NO3';
fxMEO2(i)=fxMEO2(i)-1; fNO3(i)=fNO3(i)-1; fNO3(i)=fNO3(i)+1; fMEO2(i)=fMEO2(i)+1;

i=i+1;
Rnames{i} = 'xMEO2 + MEO2 = MEO2 + .5*MEO2 + .5*XC';
k(:,i) = 2.00e-13;
Gstr{i,1} = 'xMEO2'; Gstr{i,2} = 'MEO2';
fxMEO2(i)=fxMEO2(i)-1; fMEO2(i)=fMEO2(i)-1; fMEO2(i)=fMEO2(i)+1; fMEO2(i)=fMEO2(i)+.5; fXC(i)=fXC(i)+.5;

i=i+1;
Rnames{i} = 'xMEO2 + RO2C = RO2C + .5*MEO2 + .5*XC';
k(:,i) = 3.50e-14;
Gstr{i,1} = 'xMEO2'; Gstr{i,2} = 'RO2C';
fxMEO2(i)=fxMEO2(i)-1; fRO2C(i)=fRO2C(i)-1; fRO2C(i)=fRO2C(i)+1; fMEO2(i)=fMEO2(i)+.5; fXC(i)=fXC(i)+.5;

i=i+1;
Rnames{i} = 'xMEO2 + RO2XC = RO2XC + .5*MEO2 + .5*XC';
k(:,i) = 3.50e-14;
Gstr{i,1} = 'xMEO2'; Gstr{i,2} = 'RO2XC';
fxMEO2(i)=fxMEO2(i)-1; fRO2XC(i)=fRO2XC(i)-1; fRO2XC(i)=fRO2XC(i)+1; fMEO2(i)=fMEO2(i)+.5; fXC(i)=fXC(i)+.5;

i=i+1;
Rnames{i} = 'xMEO2 + MECO3 = MECO3 + MEO2';
k(:,i) = 4.40e-13.*(T./300).^0.00.*exp(1069.847./T);
Gstr{i,1} = 'xMEO2'; Gstr{i,2} = 'MECO3';
fxMEO2(i)=fxMEO2(i)-1; fMECO3(i)=fMECO3(i)-1; fMECO3(i)=fMECO3(i)+1; fMEO2(i)=fMEO2(i)+1;

i=i+1;
Rnames{i} = 'xMEO2 + RCO3 = RCO3 + MEO2';
k(:,i) = 4.40e-13.*(T./300).^0.00.*exp(1069.847./T);
Gstr{i,1} = 'xMEO2'; Gstr{i,2} = 'RCO3';
fxMEO2(i)=fxMEO2(i)-1; fRCO3(i)=fRCO3(i)-1; fRCO3(i)=fRCO3(i)+1; fMEO2(i)=fMEO2(i)+1;

i=i+1;
Rnames{i} = 'xMEO2 + BZCO3 = BZCO3 + MEO2';
k(:,i) = 4.40e-13.*(T./300).^0.00.*exp(1069.847./T);
Gstr{i,1} = 'xMEO2'; Gstr{i,2} = 'BZCO3';
fxMEO2(i)=fxMEO2(i)-1; fBZCO3(i)=fBZCO3(i)-1; fBZCO3(i)=fBZCO3(i)+1; fMEO2(i)=fMEO2(i)+1;

i=i+1;
Rnames{i} = 'xMEO2 + MACO3 = MACO3 + MEO2';
k(:,i) = 4.40e-13.*(T./300).^0.00.*exp(1069.847./T);
Gstr{i,1} = 'xMEO2'; Gstr{i,2} = 'MACO3';
fxMEO2(i)=fxMEO2(i)-1; fMACO3(i)=fMACO3(i)-1; fMACO3(i)=fMACO3(i)+1; fMEO2(i)=fMEO2(i)+1;

i=i+1;
Rnames{i} = 'xMECO3 + NO = NO + MECO3';
k(:,i) = 2.60e-12.*(T./300).^0.00.*exp(379.932./T);
Gstr{i,1} = 'xMECO3'; Gstr{i,2} = 'NO';
fxMECO3(i)=fxMECO3(i)-1; fNO(i)=fNO(i)-1; fNO(i)=fNO(i)+1; fMECO3(i)=fMECO3(i)+1;

i=i+1;
Rnames{i} = 'xMECO3 + HO2 = HO2 + 2*XC';
k(:,i) = 3.80e-13.*(T./300).^0.00.*exp(899.758./T);
Gstr{i,1} = 'xMECO3'; Gstr{i,2} = 'HO2';
fxMECO3(i)=fxMECO3(i)-1; fHO2(i)=fHO2(i)-1; fHO2(i)=fHO2(i)+1; fXC(i)=fXC(i)+2;

i=i+1;
Rnames{i} = 'xMECO3 + NO3 = NO3 + MECO3';
k(:,i) = 2.30e-12;
Gstr{i,1} = 'xMECO3'; Gstr{i,2} = 'NO3';
fxMECO3(i)=fxMECO3(i)-1; fNO3(i)=fNO3(i)-1; fNO3(i)=fNO3(i)+1; fMECO3(i)=fMECO3(i)+1;

i=i+1;
Rnames{i} = 'xMECO3 + MEO2 = MEO2 + .5*MECO3 + XC';
k(:,i) = 2.00e-13;
Gstr{i,1} = 'xMECO3'; Gstr{i,2} = 'MEO2';
fxMECO3(i)=fxMECO3(i)-1; fMEO2(i)=fMEO2(i)-1; fMEO2(i)=fMEO2(i)+1; fMECO3(i)=fMECO3(i)+.5; fXC(i)=fXC(i)+1;

i=i+1;
Rnames{i} = 'xMECO3 + RO2C = RO2C + .5*MECO3 + XC';
k(:,i) = 3.50e-14;
Gstr{i,1} = 'xMECO3'; Gstr{i,2} = 'RO2C';
fxMECO3(i)=fxMECO3(i)-1; fRO2C(i)=fRO2C(i)-1; fRO2C(i)=fRO2C(i)+1; fMECO3(i)=fMECO3(i)+.5; fXC(i)=fXC(i)+1;

i=i+1;
Rnames{i} = 'xMECO3 + RO2XC = RO2XC + .5*MECO3 + XC';
k(:,i) = 3.50e-14;
Gstr{i,1} = 'xMECO3'; Gstr{i,2} = 'RO2XC';
fxMECO3(i)=fxMECO3(i)-1; fRO2XC(i)=fRO2XC(i)-1; fRO2XC(i)=fRO2XC(i)+1; fMECO3(i)=fMECO3(i)+.5; fXC(i)=fXC(i)+1;

i=i+1;
Rnames{i} = 'xMECO3 + MECO3 = MECO3 + MECO3';
k(:,i) = 4.40e-13.*(T./300).^0.00.*exp(1069.847./T);
Gstr{i,1} = 'xMECO3'; Gstr{i,2} = 'MECO3';
fxMECO3(i)=fxMECO3(i)-1; fMECO3(i)=fMECO3(i)-1; fMECO3(i)=fMECO3(i)+1; fMECO3(i)=fMECO3(i)+1;

i=i+1;
Rnames{i} = 'xMECO3 + RCO3 = RCO3 + MECO3';
k(:,i) = 4.40e-13.*(T./300).^0.00.*exp(1069.847./T);
Gstr{i,1} = 'xMECO3'; Gstr{i,2} = 'RCO3';
fxMECO3(i)=fxMECO3(i)-1; fRCO3(i)=fRCO3(i)-1; fRCO3(i)=fRCO3(i)+1; fMECO3(i)=fMECO3(i)+1;

i=i+1;
Rnames{i} = 'xMECO3 + BZCO3 = BZCO3 + MECO3';
k(:,i) = 4.40e-13.*(T./300).^0.00.*exp(1069.847./T);
Gstr{i,1} = 'xMECO3'; Gstr{i,2} = 'BZCO3';
fxMECO3(i)=fxMECO3(i)-1; fBZCO3(i)=fBZCO3(i)-1; fBZCO3(i)=fBZCO3(i)+1; fMECO3(i)=fMECO3(i)+1;

i=i+1;
Rnames{i} = 'xMECO3 + MACO3 = MACO3 + MECO3';
k(:,i) = 4.40e-13.*(T./300).^0.00.*exp(1069.847./T);
Gstr{i,1} = 'xMECO3'; Gstr{i,2} = 'MACO3';
fxMECO3(i)=fxMECO3(i)-1; fMACO3(i)=fMACO3(i)-1; fMACO3(i)=fMACO3(i)+1; fMECO3(i)=fMECO3(i)+1;

i=i+1;
Rnames{i} = 'xRCO3 + NO = NO + RCO3';
k(:,i) = 2.60e-12.*(T./300).^0.00.*exp(379.932./T);
Gstr{i,1} = 'xRCO3'; Gstr{i,2} = 'NO';
fxRCO3(i)=fxRCO3(i)-1; fNO(i)=fNO(i)-1; fNO(i)=fNO(i)+1; fRCO3(i)=fRCO3(i)+1;

i=i+1;
Rnames{i} = 'xRCO3 + HO2 = HO2 + 3*XC';
k(:,i) = 3.80e-13.*(T./300).^0.00.*exp(899.758./T);
Gstr{i,1} = 'xRCO3'; Gstr{i,2} = 'HO2';
fxRCO3(i)=fxRCO3(i)-1; fHO2(i)=fHO2(i)-1; fHO2(i)=fHO2(i)+1; fXC(i)=fXC(i)+3;

i=i+1;
Rnames{i} = 'xRCO3 + NO3 = NO3 + RCO3';
k(:,i) = 2.30e-12;
Gstr{i,1} = 'xRCO3'; Gstr{i,2} = 'NO3';
fxRCO3(i)=fxRCO3(i)-1; fNO3(i)=fNO3(i)-1; fNO3(i)=fNO3(i)+1; fRCO3(i)=fRCO3(i)+1;

i=i+1;
Rnames{i} = 'xRCO3 + MEO2 = MEO2 + .5*RCO3 + 1.5*XC';
k(:,i) = 2.00e-13;
Gstr{i,1} = 'xRCO3'; Gstr{i,2} = 'MEO2';
fxRCO3(i)=fxRCO3(i)-1; fMEO2(i)=fMEO2(i)-1; fMEO2(i)=fMEO2(i)+1; fRCO3(i)=fRCO3(i)+.5; fXC(i)=fXC(i)+1.5;

i=i+1;
Rnames{i} = 'xRCO3 + RO2C = RO2C + .5*RCO3 + 1.5*XC';
k(:,i) = 3.50e-14;
Gstr{i,1} = 'xRCO3'; Gstr{i,2} = 'RO2C';
fxRCO3(i)=fxRCO3(i)-1; fRO2C(i)=fRO2C(i)-1; fRO2C(i)=fRO2C(i)+1; fRCO3(i)=fRCO3(i)+.5; fXC(i)=fXC(i)+1.5;

i=i+1;
Rnames{i} = 'xRCO3 + RO2XC = RO2XC + .5*RCO3 + 1.5*XC';
k(:,i) = 3.50e-14;
Gstr{i,1} = 'xRCO3'; Gstr{i,2} = 'RO2XC';
fxRCO3(i)=fxRCO3(i)-1; fRO2XC(i)=fRO2XC(i)-1; fRO2XC(i)=fRO2XC(i)+1; fRCO3(i)=fRCO3(i)+.5; fXC(i)=fXC(i)+1.5;

i=i+1;
Rnames{i} = 'xRCO3 + MECO3 = MECO3 + RCO3';
k(:,i) = 4.40e-13.*(T./300).^0.00.*exp(1069.847./T);
Gstr{i,1} = 'xRCO3'; Gstr{i,2} = 'MECO3';
fxRCO3(i)=fxRCO3(i)-1; fMECO3(i)=fMECO3(i)-1; fMECO3(i)=fMECO3(i)+1; fRCO3(i)=fRCO3(i)+1;

i=i+1;
Rnames{i} = 'xRCO3 + RCO3 = RCO3 + RCO3';
k(:,i) = 4.40e-13.*(T./300).^0.00.*exp(1069.847./T);
Gstr{i,1} = 'xRCO3'; Gstr{i,2} = 'RCO3';
fxRCO3(i)=fxRCO3(i)-1; fRCO3(i)=fRCO3(i)-1; fRCO3(i)=fRCO3(i)+1; fRCO3(i)=fRCO3(i)+1;

i=i+1;
Rnames{i} = 'xRCO3 + BZCO3 = BZCO3 + RCO3';
k(:,i) = 4.40e-13.*(T./300).^0.00.*exp(1069.847./T);
Gstr{i,1} = 'xRCO3'; Gstr{i,2} = 'BZCO3';
fxRCO3(i)=fxRCO3(i)-1; fBZCO3(i)=fBZCO3(i)-1; fBZCO3(i)=fBZCO3(i)+1; fRCO3(i)=fRCO3(i)+1;

i=i+1;
Rnames{i} = 'xRCO3 + MACO3 = MACO3 + RCO3';
k(:,i) = 4.40e-13.*(T./300).^0.00.*exp(1069.847./T);
Gstr{i,1} = 'xRCO3'; Gstr{i,2} = 'MACO3';
fxRCO3(i)=fxRCO3(i)-1; fMACO3(i)=fMACO3(i)-1; fMACO3(i)=fMACO3(i)+1; fRCO3(i)=fRCO3(i)+1;

i=i+1;
Rnames{i} = 'xMACO3 + NO = NO + MACO3';
k(:,i) = 2.60e-12.*(T./300).^0.00.*exp(379.932./T);
Gstr{i,1} = 'xMACO3'; Gstr{i,2} = 'NO';
fxMACO3(i)=fxMACO3(i)-1; fNO(i)=fNO(i)-1; fNO(i)=fNO(i)+1; fMACO3(i)=fMACO3(i)+1;

i=i+1;
Rnames{i} = 'xMACO3 + HO2 = HO2 + 4*XC';
k(:,i) = 3.80e-13.*(T./300).^0.00.*exp(899.758./T);
Gstr{i,1} = 'xMACO3'; Gstr{i,2} = 'HO2';
fxMACO3(i)=fxMACO3(i)-1; fHO2(i)=fHO2(i)-1; fHO2(i)=fHO2(i)+1; fXC(i)=fXC(i)+4;

i=i+1;
Rnames{i} = 'xMACO3 + NO3 = NO3 + MACO3';
k(:,i) = 2.30e-12;
Gstr{i,1} = 'xMACO3'; Gstr{i,2} = 'NO3';
fxMACO3(i)=fxMACO3(i)-1; fNO3(i)=fNO3(i)-1; fNO3(i)=fNO3(i)+1; fMACO3(i)=fMACO3(i)+1;

i=i+1;
Rnames{i} = 'xMACO3 + MEO2 = MEO2 + .5*MACO3 + 2*XC';
k(:,i) = 2.00e-13;
Gstr{i,1} = 'xMACO3'; Gstr{i,2} = 'MEO2';
fxMACO3(i)=fxMACO3(i)-1; fMEO2(i)=fMEO2(i)-1; fMEO2(i)=fMEO2(i)+1; fMACO3(i)=fMACO3(i)+.5; fXC(i)=fXC(i)+2;

i=i+1;
Rnames{i} = 'xMACO3 + RO2C = RO2C + .5*MACO3 + 2*XC';
k(:,i) = 3.50e-14;
Gstr{i,1} = 'xMACO3'; Gstr{i,2} = 'RO2C';
fxMACO3(i)=fxMACO3(i)-1; fRO2C(i)=fRO2C(i)-1; fRO2C(i)=fRO2C(i)+1; fMACO3(i)=fMACO3(i)+.5; fXC(i)=fXC(i)+2;

i=i+1;
Rnames{i} = 'xMACO3 + RO2XC = RO2XC + .5*MACO3 + 2*XC';
k(:,i) = 3.50e-14;
Gstr{i,1} = 'xMACO3'; Gstr{i,2} = 'RO2XC';
fxMACO3(i)=fxMACO3(i)-1; fRO2XC(i)=fRO2XC(i)-1; fRO2XC(i)=fRO2XC(i)+1; fMACO3(i)=fMACO3(i)+.5; fXC(i)=fXC(i)+2;

i=i+1;
Rnames{i} = 'xMACO3 + MECO3 = MECO3 + MACO3';
k(:,i) = 4.40e-13.*(T./300).^0.00.*exp(1069.847./T);
Gstr{i,1} = 'xMACO3'; Gstr{i,2} = 'MECO3';
fxMACO3(i)=fxMACO3(i)-1; fMECO3(i)=fMECO3(i)-1; fMECO3(i)=fMECO3(i)+1; fMACO3(i)=fMACO3(i)+1;

i=i+1;
Rnames{i} = 'xMACO3 + RCO3 = RCO3 + MACO3';
k(:,i) = 4.40e-13.*(T./300).^0.00.*exp(1069.847./T);
Gstr{i,1} = 'xMACO3'; Gstr{i,2} = 'RCO3';
fxMACO3(i)=fxMACO3(i)-1; fRCO3(i)=fRCO3(i)-1; fRCO3(i)=fRCO3(i)+1; fMACO3(i)=fMACO3(i)+1;

i=i+1;
Rnames{i} = 'xMACO3 + BZCO3 = BZCO3 + MACO3';
k(:,i) = 4.40e-13.*(T./300).^0.00.*exp(1069.847./T);
Gstr{i,1} = 'xMACO3'; Gstr{i,2} = 'BZCO3';
fxMACO3(i)=fxMACO3(i)-1; fBZCO3(i)=fBZCO3(i)-1; fBZCO3(i)=fBZCO3(i)+1; fMACO3(i)=fMACO3(i)+1;

i=i+1;
Rnames{i} = 'xMACO3 + MACO3 = MACO3 + MACO3';
k(:,i) = 4.40e-13.*(T./300).^0.00.*exp(1069.847./T);
Gstr{i,1} = 'xMACO3'; Gstr{i,2} = 'MACO3';
fxMACO3(i)=fxMACO3(i)-1; fMACO3(i)=fMACO3(i)-1; fMACO3(i)=fMACO3(i)+1; fMACO3(i)=fMACO3(i)+1;

i=i+1;
Rnames{i} = 'xTBUO + NO = NO + TBUO';
k(:,i) = 2.60e-12.*(T./300).^0.00.*exp(379.932./T);
Gstr{i,1} = 'xTBUO'; Gstr{i,2} = 'NO';
fxTBUO(i)=fxTBUO(i)-1; fNO(i)=fNO(i)-1; fNO(i)=fNO(i)+1; fTBUO(i)=fTBUO(i)+1;

i=i+1;
Rnames{i} = 'xTBUO + HO2 = HO2 + 4*XC';
k(:,i) = 3.80e-13.*(T./300).^0.00.*exp(899.758./T);
Gstr{i,1} = 'xTBUO'; Gstr{i,2} = 'HO2';
fxTBUO(i)=fxTBUO(i)-1; fHO2(i)=fHO2(i)-1; fHO2(i)=fHO2(i)+1; fXC(i)=fXC(i)+4;

i=i+1;
Rnames{i} = 'xTBUO + NO3 = NO3 + TBUO';
k(:,i) = 2.30e-12;
Gstr{i,1} = 'xTBUO'; Gstr{i,2} = 'NO3';
fxTBUO(i)=fxTBUO(i)-1; fNO3(i)=fNO3(i)-1; fNO3(i)=fNO3(i)+1; fTBUO(i)=fTBUO(i)+1;

i=i+1;
Rnames{i} = 'xTBUO + MEO2 = MEO2 + .5*TBUO + 2*XC';
k(:,i) = 2.00e-13;
Gstr{i,1} = 'xTBUO'; Gstr{i,2} = 'MEO2';
fxTBUO(i)=fxTBUO(i)-1; fMEO2(i)=fMEO2(i)-1; fMEO2(i)=fMEO2(i)+1; fTBUO(i)=fTBUO(i)+.5; fXC(i)=fXC(i)+2;

i=i+1;
Rnames{i} = 'xTBUO + RO2C = RO2C + .5*TBUO + 2*XC';
k(:,i) = 3.50e-14;
Gstr{i,1} = 'xTBUO'; Gstr{i,2} = 'RO2C';
fxTBUO(i)=fxTBUO(i)-1; fRO2C(i)=fRO2C(i)-1; fRO2C(i)=fRO2C(i)+1; fTBUO(i)=fTBUO(i)+.5; fXC(i)=fXC(i)+2;

i=i+1;
Rnames{i} = 'xTBUO + RO2XC = RO2XC + .5*TBUO + 2*XC';
k(:,i) = 3.50e-14;
Gstr{i,1} = 'xTBUO'; Gstr{i,2} = 'RO2XC';
fxTBUO(i)=fxTBUO(i)-1; fRO2XC(i)=fRO2XC(i)-1; fRO2XC(i)=fRO2XC(i)+1; fTBUO(i)=fTBUO(i)+.5; fXC(i)=fXC(i)+2;

i=i+1;
Rnames{i} = 'xTBUO + MECO3 = MECO3 + TBUO';
k(:,i) = 4.40e-13.*(T./300).^0.00.*exp(1069.847./T);
Gstr{i,1} = 'xTBUO'; Gstr{i,2} = 'MECO3';
fxTBUO(i)=fxTBUO(i)-1; fMECO3(i)=fMECO3(i)-1; fMECO3(i)=fMECO3(i)+1; fTBUO(i)=fTBUO(i)+1;

i=i+1;
Rnames{i} = 'xTBUO + RCO3 = RCO3 + TBUO';
k(:,i) = 4.40e-13.*(T./300).^0.00.*exp(1069.847./T);
Gstr{i,1} = 'xTBUO'; Gstr{i,2} = 'RCO3';
fxTBUO(i)=fxTBUO(i)-1; fRCO3(i)=fRCO3(i)-1; fRCO3(i)=fRCO3(i)+1; fTBUO(i)=fTBUO(i)+1;

i=i+1;
Rnames{i} = 'xTBUO + BZCO3 = BZCO3 + TBUO';
k(:,i) = 4.40e-13.*(T./300).^0.00.*exp(1069.847./T);
Gstr{i,1} = 'xTBUO'; Gstr{i,2} = 'BZCO3';
fxTBUO(i)=fxTBUO(i)-1; fBZCO3(i)=fBZCO3(i)-1; fBZCO3(i)=fBZCO3(i)+1; fTBUO(i)=fTBUO(i)+1;

i=i+1;
Rnames{i} = 'xTBUO + MACO3 = MACO3 + TBUO';
k(:,i) = 4.40e-13.*(T./300).^0.00.*exp(1069.847./T);
Gstr{i,1} = 'xTBUO'; Gstr{i,2} = 'MACO3';
fxTBUO(i)=fxTBUO(i)-1; fMACO3(i)=fMACO3(i)-1; fMACO3(i)=fMACO3(i)+1; fTBUO(i)=fTBUO(i)+1;

i=i+1;
Rnames{i} = 'xCO + NO = NO + CO';
k(:,i) = 2.60e-12.*(T./300).^0.00.*exp(379.932./T);
Gstr{i,1} = 'xCO'; Gstr{i,2} = 'NO';
fxCO(i)=fxCO(i)-1; fNO(i)=fNO(i)-1; fNO(i)=fNO(i)+1; fCO(i)=fCO(i)+1;

i=i+1;
Rnames{i} = 'xCO + HO2 = HO2 + XC';
k(:,i) = 3.80e-13.*(T./300).^0.00.*exp(899.758./T);
Gstr{i,1} = 'xCO'; Gstr{i,2} = 'HO2';
fxCO(i)=fxCO(i)-1; fHO2(i)=fHO2(i)-1; fHO2(i)=fHO2(i)+1; fXC(i)=fXC(i)+1;

i=i+1;
Rnames{i} = 'xCO + NO3 = NO3 + CO';
k(:,i) = 2.30e-12;
Gstr{i,1} = 'xCO'; Gstr{i,2} = 'NO3';
fxCO(i)=fxCO(i)-1; fNO3(i)=fNO3(i)-1; fNO3(i)=fNO3(i)+1; fCO(i)=fCO(i)+1;

i=i+1;
Rnames{i} = 'xCO + MEO2 = MEO2 + .5*CO + .5*XC';
k(:,i) = 2.00e-13;
Gstr{i,1} = 'xCO'; Gstr{i,2} = 'MEO2';
fxCO(i)=fxCO(i)-1; fMEO2(i)=fMEO2(i)-1; fMEO2(i)=fMEO2(i)+1; fCO(i)=fCO(i)+.5; fXC(i)=fXC(i)+.5;

i=i+1;
Rnames{i} = 'xCO + RO2C = RO2C + .5*CO + .5*XC';
k(:,i) = 3.50e-14;
Gstr{i,1} = 'xCO'; Gstr{i,2} = 'RO2C';
fxCO(i)=fxCO(i)-1; fRO2C(i)=fRO2C(i)-1; fRO2C(i)=fRO2C(i)+1; fCO(i)=fCO(i)+.5; fXC(i)=fXC(i)+.5;

i=i+1;
Rnames{i} = 'xCO + RO2XC = RO2XC + .5*CO + .5*XC';
k(:,i) = 3.50e-14;
Gstr{i,1} = 'xCO'; Gstr{i,2} = 'RO2XC';
fxCO(i)=fxCO(i)-1; fRO2XC(i)=fRO2XC(i)-1; fRO2XC(i)=fRO2XC(i)+1; fCO(i)=fCO(i)+.5; fXC(i)=fXC(i)+.5;

i=i+1;
Rnames{i} = 'xCO + MECO3 = MECO3 + CO';
k(:,i) = 4.40e-13.*(T./300).^0.00.*exp(1069.847./T);
Gstr{i,1} = 'xCO'; Gstr{i,2} = 'MECO3';
fxCO(i)=fxCO(i)-1; fMECO3(i)=fMECO3(i)-1; fMECO3(i)=fMECO3(i)+1; fCO(i)=fCO(i)+1;

i=i+1;
Rnames{i} = 'xCO + RCO3 = RCO3 + CO';
k(:,i) = 4.40e-13.*(T./300).^0.00.*exp(1069.847./T);
Gstr{i,1} = 'xCO'; Gstr{i,2} = 'RCO3';
fxCO(i)=fxCO(i)-1; fRCO3(i)=fRCO3(i)-1; fRCO3(i)=fRCO3(i)+1; fCO(i)=fCO(i)+1;

i=i+1;
Rnames{i} = 'xCO + BZCO3 = BZCO3 + CO';
k(:,i) = 4.40e-13.*(T./300).^0.00.*exp(1069.847./T);
Gstr{i,1} = 'xCO'; Gstr{i,2} = 'BZCO3';
fxCO(i)=fxCO(i)-1; fBZCO3(i)=fBZCO3(i)-1; fBZCO3(i)=fBZCO3(i)+1; fCO(i)=fCO(i)+1;

i=i+1;
Rnames{i} = 'xCO + MACO3 = MACO3 + CO';
k(:,i) = 4.40e-13.*(T./300).^0.00.*exp(1069.847./T);
Gstr{i,1} = 'xCO'; Gstr{i,2} = 'MACO3';
fxCO(i)=fxCO(i)-1; fMACO3(i)=fMACO3(i)-1; fMACO3(i)=fMACO3(i)+1; fCO(i)=fCO(i)+1;

i=i+1;
Rnames{i} = 'HCHO + HV = 2*HO2 + CO';
k(:,i) = JHCHOR_06;
Gstr{i,1} = 'HCHO';
fHCHO(i)=fHCHO(i)-1; fHO2(i)=fHO2(i)+2; fCO(i)=fCO(i)+1;

i=i+1;
Rnames{i} = 'HCHO + HV = H2 + CO';
k(:,i) = JHCHOM_06;
Gstr{i,1} = 'HCHO';
fHCHO(i)=fHCHO(i)-1; fH2(i)=fH2(i)+1; fCO(i)=fCO(i)+1;

i=i+1;
Rnames{i} = 'HCHO + OH = HO2 + CO + H2O';
k(:,i) = 5.40e-12.*(T./300).^0.00.*exp(134.863./T);
Gstr{i,1} = 'HCHO'; Gstr{i,2} = 'OH';
fHCHO(i)=fHCHO(i)-1; fOH(i)=fOH(i)-1; fHO2(i)=fHO2(i)+1; fCO(i)=fCO(i)+1; fH2O(i)=fH2O(i)+1;

i=i+1;
Rnames{i} = 'HCHO + NO3 = HNO3 + HO2 + CO';
k(:,i) = 2.00e-12.*(T./300).^0.00.*exp(-2430.556./T);
Gstr{i,1} = 'HCHO'; Gstr{i,2} = 'NO3';
fHCHO(i)=fHCHO(i)-1; fNO3(i)=fNO3(i)-1; fHNO3(i)=fHNO3(i)+1; fHO2(i)=fHO2(i)+1; fCO(i)=fCO(i)+1;

i=i+1;
Rnames{i} = 'CCHO + OH = MECO3 + H2O';
k(:,i) = 4.40e-12.*(T./300).^0.00.*exp(364.835./T);
Gstr{i,1} = 'CCHO'; Gstr{i,2} = 'OH';
fCCHO(i)=fCCHO(i)-1; fOH(i)=fOH(i)-1; fMECO3(i)=fMECO3(i)+1; fH2O(i)=fH2O(i)+1;

i=i+1;
Rnames{i} = 'CCHO + HV = CO + HO2 + MEO2';
k(:,i) = JCCHO_R;
Gstr{i,1} = 'CCHO';
fCCHO(i)=fCCHO(i)-1; fCO(i)=fCO(i)+1; fHO2(i)=fHO2(i)+1; fMEO2(i)=fMEO2(i)+1;

i=i+1;
Rnames{i} = 'CCHO + NO3 = HNO3 + MECO3';
k(:,i) = 1.40e-12.*(T./300).^0.00.*exp(-1859.903./T);
Gstr{i,1} = 'CCHO'; Gstr{i,2} = 'NO3';
fCCHO(i)=fCCHO(i)-1; fNO3(i)=fNO3(i)-1; fHNO3(i)=fHNO3(i)+1; fMECO3(i)=fMECO3(i)+1;

i=i+1;
Rnames{i} = 'RCHO + OH = .965*RCO3 + .035*RO2C + xHO2 + xCO + xCCHO + .035*yROOH';
k(:,i) = 5.10e-12.*exp(405.093./T);
Gstr{i,1} = 'RCHO'; Gstr{i,2} = 'OH';
fRCHO(i)=fRCHO(i)-1; fOH(i)=fOH(i)-1; fRCO3(i)=fRCO3(i)+.965; fRO2C(i)=fRO2C(i)+.035; fxHO2(i)=fxHO2(i)+1; fxCO(i)=fxCO(i)+1; fxCCHO(i)=fxCCHO(i)+1; fyROOH(i)=fyROOH(i)+.035;

i=i+1;
Rnames{i} = 'RCHO + HV = RO2C + xHO2 + yROOH + xCCHO + CO + HO2';
k(:,i) = JC2CHO;
Gstr{i,1} = 'RCHO';
fRCHO(i)=fRCHO(i)-1; fRO2C(i)=fRO2C(i)+1; fxHO2(i)=fxHO2(i)+1; fyROOH(i)=fyROOH(i)+1; fxCCHO(i)=fxCCHO(i)+1; fCO(i)=fCO(i)+1; fHO2(i)=fHO2(i)+1;

i=i+1;
Rnames{i} = 'RCHO + NO3 = HNO3 + RCO3';
k(:,i) = 1.40e-12.*exp(-1601.248./T);
Gstr{i,1} = 'RCHO'; Gstr{i,2} = 'NO3';
fRCHO(i)=fRCHO(i)-1; fNO3(i)=fNO3(i)-1; fHNO3(i)=fHNO3(i)+1; fRCO3(i)=fRCO3(i)+1;

i=i+1;
Rnames{i} = 'ACET + OH = RO2C + xMECO3 + xHCHO + yROOH';
k(:,i) = 4.56e-14.*(T./300).^3.65.*exp(428.744./T);
Gstr{i,1} = 'ACET'; Gstr{i,2} = 'OH';
fACET(i)=fACET(i)-1; fOH(i)=fOH(i)-1; fRO2C(i)=fRO2C(i)+1; fxMECO3(i)=fxMECO3(i)+1; fxHCHO(i)=fxHCHO(i)+1; fyROOH(i)=fyROOH(i)+1;

i=i+1;
Rnames{i} = 'ACET + HV = .62*MECO3 + 1.38*MEO2 + .38*CO';
k(:,i) = JACET_06.*5.00e-1;
Gstr{i,1} = 'ACET';
fACET(i)=fACET(i)-1; fMECO3(i)=fMECO3(i)+.62; fMEO2(i)=fMEO2(i)+1.38; fCO(i)=fCO(i)+.38;

i=i+1;
Rnames{i} = 'MEK + OH = .967*RO2C + .039*RO2XC + .039*zRNO3 + .376*xHO2 + .51*xMECO3 + .074*xRCO3 + .088*xHCHO + .504*xCCHO + .376*xRCHO + yROOH + .3*XC';
k(:,i) = 1.30e-12.*(T./300).^2.00.*exp(-25.161./T);
Gstr{i,1} = 'MEK'; Gstr{i,2} = 'OH';
fMEK(i)=fMEK(i)-1; fOH(i)=fOH(i)-1; fRO2C(i)=fRO2C(i)+.967; fRO2XC(i)=fRO2XC(i)+.039; fzRNO3(i)=fzRNO3(i)+.039; fxHO2(i)=fxHO2(i)+.376; fxMECO3(i)=fxMECO3(i)+.51; fxRCO3(i)=fxRCO3(i)+.074; fxHCHO(i)=fxHCHO(i)+.088; fxCCHO(i)=fxCCHO(i)+.504; fxRCHO(i)=fxRCHO(i)+.376; fyROOH(i)=fyROOH(i)+1; fXC(i)=fXC(i)+.3;

i=i+1;
Rnames{i} = 'MEK + HV = MECO3 + RO2C + xHO2 + xCCHO + yROOH';
k(:,i) = JMEK_06.*1.75e-1;
Gstr{i,1} = 'MEK';
fMEK(i)=fMEK(i)-1; fMECO3(i)=fMECO3(i)+1; fRO2C(i)=fRO2C(i)+1; fxHO2(i)=fxHO2(i)+1; fxCCHO(i)=fxCCHO(i)+1; fyROOH(i)=fyROOH(i)+1;

i=i+1;
Rnames{i} = 'MEOH + OH = HCHO + HO2';
k(:,i) = 2.85e-12.*(T./300).^0.00.*exp(-345.209./T);
Gstr{i,1} = 'MEOH'; Gstr{i,2} = 'OH';
fMEOH(i)=fMEOH(i)-1; fOH(i)=fOH(i)-1; fHCHO(i)=fHCHO(i)+1; fHO2(i)=fHO2(i)+1;

i=i+1;
Rnames{i} = 'HCOOH + OH = HO2 + CO2';
k(:,i) = 4.50e-13;
Gstr{i,1} = 'HCOOH'; Gstr{i,2} = 'OH';
fHCOOH(i)=fHCOOH(i)-1; fOH(i)=fOH(i)-1; fHO2(i)=fHO2(i)+1; fCO2(i)=fCO2(i)+1;

i=i+1;
Rnames{i} = 'CCOOH + OH = .509*MEO2 + .491*RO2C + .509*CO2 + .491*xHO2 + .491*xMGLY + .491*yROOH - 0.491*XC';
k(:,i) = 4.20e-14.*exp(854.972./T);
Gstr{i,1} = 'CCOOH'; Gstr{i,2} = 'OH';
fCCOOH(i)=fCCOOH(i)-1; fOH(i)=fOH(i)-1; fMEO2(i)=fMEO2(i)+.509; fRO2C(i)=fRO2C(i)+.491; fCO2(i)=fCO2(i)+.509; fxHO2(i)=fxHO2(i)+.491; fxMGLY(i)=fxMGLY(i)+.491; fyROOH(i)=fyROOH(i)+.491; fXC(i)=fXC(i)-0.491;

i=i+1;
Rnames{i} = 'RCOOH + OH = RO2C + xHO2 + .143*CO2 + .142*xCCHO + .4*xRCHO + .457*xBACL + yROOH - 0.455*XC';
k(:,i) = 1.20e-12;
Gstr{i,1} = 'RCOOH'; Gstr{i,2} = 'OH';
fRCOOH(i)=fRCOOH(i)-1; fOH(i)=fOH(i)-1; fRO2C(i)=fRO2C(i)+1; fxHO2(i)=fxHO2(i)+1; fCO2(i)=fCO2(i)+.143; fxCCHO(i)=fxCCHO(i)+.142; fxRCHO(i)=fxRCHO(i)+.4; fxBACL(i)=fxBACL(i)+.457; fyROOH(i)=fyROOH(i)+1; fXC(i)=fXC(i)-0.455;

i=i+1;
Rnames{i} = 'COOH + OH = H2O + .3*HCHO + .3*OH + .7*MEO2';
k(:,i) = 3.80e-12.*exp(199.779./T);
Gstr{i,1} = 'COOH'; Gstr{i,2} = 'OH';
fCOOH(i)=fCOOH(i)-1; fOH(i)=fOH(i)-1; fH2O(i)=fH2O(i)+1; fHCHO(i)=fHCHO(i)+.3; fOH(i)=fOH(i)+.3; fMEO2(i)=fMEO2(i)+.7;

i=i+1;
Rnames{i} = 'COOH + HV = HCHO + HO2 + OH';
k(:,i) = JCOOH;
Gstr{i,1} = 'COOH';
fCOOH(i)=fCOOH(i)-1; fHCHO(i)=fHCHO(i)+1; fHO2(i)=fHO2(i)+1; fOH(i)=fOH(i)+1;

i=i+1;
Rnames{i} = 'ROOH + OH = .744*OH + .251*RO2C + .004*RO2XC + .004*zRNO3 + .744*RCHO + .239*xHO2 + .012*xOH + .012*xHCHO + .012*xCCHO + .205*xRCHO + .034*xPROD2 + .256*yROOH - 0.115*XC';
k(:,i) = 2.50e-11;
Gstr{i,1} = 'ROOH'; Gstr{i,2} = 'OH';
fROOH(i)=fROOH(i)-1; fOH(i)=fOH(i)-1; fOH(i)=fOH(i)+.744; fRO2C(i)=fRO2C(i)+.251; fRO2XC(i)=fRO2XC(i)+.004; fzRNO3(i)=fzRNO3(i)+.004; fRCHO(i)=fRCHO(i)+.744; fxHO2(i)=fxHO2(i)+.239; fxOH(i)=fxOH(i)+.012; fxHCHO(i)=fxHCHO(i)+.012; fxCCHO(i)=fxCCHO(i)+.012; fxRCHO(i)=fxRCHO(i)+.205; fxPROD2(i)=fxPROD2(i)+.034; fyROOH(i)=fyROOH(i)+.256; fXC(i)=fXC(i)-0.115;

i=i+1;
Rnames{i} = 'ROOH + HV = RCHO + HO2 + OH';
k(:,i) = JCOOH;
Gstr{i,1} = 'ROOH';
fROOH(i)=fROOH(i)-1; fRCHO(i)=fRCHO(i)+1; fHO2(i)=fHO2(i)+1; fOH(i)=fOH(i)+1;

i=i+1;
Rnames{i} = 'R6OOH + OH = .84*OH + .222*RO2C + .029*RO2XC + .029*zRNO3 + .84*PROD2 + .09*xHO2 + .041*xOH + .02*xCCHO + .075*xRCHO + .084*xPROD2 + .16*yROOH + .02*XC';
k(:,i) = 5.60e-11;
Gstr{i,1} = 'R6OOH'; Gstr{i,2} = 'OH';
fR6OOH(i)=fR6OOH(i)-1; fOH(i)=fOH(i)-1; fOH(i)=fOH(i)+.84; fRO2C(i)=fRO2C(i)+.222; fRO2XC(i)=fRO2XC(i)+.029; fzRNO3(i)=fzRNO3(i)+.029; fPROD2(i)=fPROD2(i)+.84; fxHO2(i)=fxHO2(i)+.09; fxOH(i)=fxOH(i)+.041; fxCCHO(i)=fxCCHO(i)+.02; fxRCHO(i)=fxRCHO(i)+.075; fxPROD2(i)=fxPROD2(i)+.084; fyROOH(i)=fyROOH(i)+.16; fXC(i)=fXC(i)+.02;

i=i+1;
Rnames{i} = 'R6OOH + HV = OH + .142*HO2 + .782*RO2C + .077*RO2XC + .077*zRNO3 + .085*RCHO + .142*PROD2 + .782*xHO2 + .026*xCCHO + .058*xRCHO + .698*xPROD2 + .858*yR6OOH + .017*XC';
k(:,i) = JCOOH;
Gstr{i,1} = 'R6OOH';
fR6OOH(i)=fR6OOH(i)-1; fOH(i)=fOH(i)+1; fHO2(i)=fHO2(i)+.142; fRO2C(i)=fRO2C(i)+.782; fRO2XC(i)=fRO2XC(i)+.077; fzRNO3(i)=fzRNO3(i)+.077; fRCHO(i)=fRCHO(i)+.085; fPROD2(i)=fPROD2(i)+.142; fxHO2(i)=fxHO2(i)+.782; fxCCHO(i)=fxCCHO(i)+.026; fxRCHO(i)=fxRCHO(i)+.058; fxPROD2(i)=fxPROD2(i)+.698; fyR6OOH(i)=fyR6OOH(i)+.858; fXC(i)=fXC(i)+.017;

i=i+1;
Rnames{i} = 'RAOOH + OH = .139*OH + .148*HO2 + .589*RO2C + .124*RO2XC + .124*zRNO3 + .074*PROD2 + .147*MGLY + .139*IPRD + .565*xHO2 + .024*xOH + .448*xRCHO + .026*xGLY + .030*xMEK + .252*xMGLY + .073*xAFG1 + .073*xAFG2 + .713*yR6OOH + 2.674*XC';
k(:,i) = 1.41e-10;
Gstr{i,1} = 'RAOOH'; Gstr{i,2} = 'OH';
fRAOOH(i)=fRAOOH(i)-1; fOH(i)=fOH(i)-1; fOH(i)=fOH(i)+.139; fHO2(i)=fHO2(i)+.148; fRO2C(i)=fRO2C(i)+.589; fRO2XC(i)=fRO2XC(i)+.124; fzRNO3(i)=fzRNO3(i)+.124; fPROD2(i)=fPROD2(i)+.074; fMGLY(i)=fMGLY(i)+.147; fIPRD(i)=fIPRD(i)+.139; fxHO2(i)=fxHO2(i)+.565; fxOH(i)=fxOH(i)+.024; fxRCHO(i)=fxRCHO(i)+.448; fxGLY(i)=fxGLY(i)+.026; fxMEK(i)=fxMEK(i)+.030; fxMGLY(i)=fxMGLY(i)+.252; fxAFG1(i)=fxAFG1(i)+.073; fxAFG2(i)=fxAFG2(i)+.073; fyR6OOH(i)=fyR6OOH(i)+.713; fXC(i)=fXC(i)+2.674;

i=i+1;
Rnames{i} = 'RAOOH + HV = OH + HO2 + .5*GLY + MGLY + AFG1 + .5*AFG2 + .5*XC';
k(:,i) = JCOOH;
Gstr{i,1} = 'RAOOH';
fRAOOH(i)=fRAOOH(i)-1; fOH(i)=fOH(i)+1; fHO2(i)=fHO2(i)+1; fGLY(i)=fGLY(i)+.5; fMGLY(i)=fMGLY(i)+1; fAFG1(i)=fAFG1(i)+1; fAFG2(i)=fAFG2(i)+.5; fXC(i)=fXC(i)+.5;

i=i+1;
Rnames{i} = 'GLY + HV = 2*CO + 2*HO2';
k(:,i) = JGLY_07R;
Gstr{i,1} = 'GLY';
fGLY(i)=fGLY(i)-1; fCO(i)=fCO(i)+2; fHO2(i)=fHO2(i)+2;

i=i+1;
Rnames{i} = 'GLY + HV = HCHO + CO';
k(:,i) = JGLY_07M;
Gstr{i,1} = 'GLY';
fGLY(i)=fGLY(i)-1; fHCHO(i)=fHCHO(i)+1; fCO(i)=fCO(i)+1;

i=i+1;
Rnames{i} = 'GLY + OH = .63*HO2 + 1.26*CO + .37*RCO3 - .37*XC';
k(:,i) = 1.10e-11;
Gstr{i,1} = 'GLY'; Gstr{i,2} = 'OH';
fGLY(i)=fGLY(i)-1; fOH(i)=fOH(i)-1; fHO2(i)=fHO2(i)+.63; fCO(i)=fCO(i)+1.26; fRCO3(i)=fRCO3(i)+.37; fXC(i)=fXC(i)-.37;

i=i+1;
Rnames{i} = 'GLY + NO3 = HNO3 + .63*HO2 + 1.26*CO + .37*RCO3 - .37*XC';
k(:,i) = 2.80e-12.*exp(-2376.208./T);
Gstr{i,1} = 'GLY'; Gstr{i,2} = 'NO3';
fGLY(i)=fGLY(i)-1; fNO3(i)=fNO3(i)-1; fHNO3(i)=fHNO3(i)+1; fHO2(i)=fHO2(i)+.63; fCO(i)=fCO(i)+1.26; fRCO3(i)=fRCO3(i)+.37; fXC(i)=fXC(i)-.37;

i=i+1;
Rnames{i} = 'MGLY + HV = HO2 + CO + MECO3';
k(:,i) = JMGLY_06;
Gstr{i,1} = 'MGLY';
fMGLY(i)=fMGLY(i)-1; fHO2(i)=fHO2(i)+1; fCO(i)=fCO(i)+1; fMECO3(i)=fMECO3(i)+1;

i=i+1;
Rnames{i} = 'MGLY + OH = CO + MECO3';
k(:,i) = 1.50e-11;
Gstr{i,1} = 'MGLY'; Gstr{i,2} = 'OH';
fMGLY(i)=fMGLY(i)-1; fOH(i)=fOH(i)-1; fCO(i)=fCO(i)+1; fMECO3(i)=fMECO3(i)+1;

i=i+1;
Rnames{i} = 'MGLY + NO3 = HNO3 + CO + MECO3';
k(:,i) = 1.40e-12.*exp(-1894.626./T);
Gstr{i,1} = 'MGLY'; Gstr{i,2} = 'NO3';
fMGLY(i)=fMGLY(i)-1; fNO3(i)=fNO3(i)-1; fHNO3(i)=fHNO3(i)+1; fCO(i)=fCO(i)+1; fMECO3(i)=fMECO3(i)+1;

i=i+1;
Rnames{i} = 'BACL + HV = 2*MECO3';
k(:,i) = JBACL_07;
Gstr{i,1} = 'BACL';
fBACL(i)=fBACL(i)-1; fMECO3(i)=fMECO3(i)+2;

i=i+1;
Rnames{i} = 'CRES + OH = .2*BZO + .8*RO2C + xHO2 + .8*yR6OOH + .25*xMGLY + 5.05*XC';
k(:,i) = 1.70e-12.*exp(950.081./T);
Gstr{i,1} = 'CRES'; Gstr{i,2} = 'OH';
fCRES(i)=fCRES(i)-1; fOH(i)=fOH(i)-1; fBZO(i)=fBZO(i)+.2; fRO2C(i)=fRO2C(i)+.8; fxHO2(i)=fxHO2(i)+1; fyR6OOH(i)=fyR6OOH(i)+.8; fxMGLY(i)=fxMGLY(i)+.25; fXC(i)=fXC(i)+5.05;

i=i+1;
Rnames{i} = 'CRES + NO3 = HNO3 + BZO + XC';
k(:,i) = 1.40e-11;
Gstr{i,1} = 'CRES'; Gstr{i,2} = 'NO3';
fCRES(i)=fCRES(i)-1; fNO3(i)=fNO3(i)-1; fHNO3(i)=fHNO3(i)+1; fBZO(i)=fBZO(i)+1; fXC(i)=fXC(i)+1;

i=i+1;
Rnames{i} = 'NPHE + OH = BZO + XN';
k(:,i) = 3.50e-12;
Gstr{i,1} = 'NPHE'; Gstr{i,2} = 'OH';
fNPHE(i)=fNPHE(i)-1; fOH(i)=fOH(i)-1; fBZO(i)=fBZO(i)+1; fXN(i)=fXN(i)+1;

i=i+1;
Rnames{i} = 'NPHE + HV = HONO + 6*XC';
k(:,i) = JNO2_06.*1.50e-3;
Gstr{i,1} = 'NPHE';
fNPHE(i)=fNPHE(i)-1; fHONO(i)=fHONO(i)+1; fXC(i)=fXC(i)+6;

i=i+1;
Rnames{i} = 'NPHE + HV = 6*XC + XN';
k(:,i) = JNO2_06.*1.50e-2;
Gstr{i,1} = 'NPHE';
fNPHE(i)=fNPHE(i)-1; fXC(i)=fXC(i)+6; fXN(i)=fXN(i)+1;

i=i+1;
Rnames{i} = 'BALD + OH = BZCO3';
k(:,i) = 1.20e-11;
Gstr{i,1} = 'BALD'; Gstr{i,2} = 'OH';
fBALD(i)=fBALD(i)-1; fOH(i)=fOH(i)-1; fBZCO3(i)=fBZCO3(i)+1;

i=i+1;
Rnames{i} = 'BALD + HV = 7*XC';
k(:,i) = JBALD_06.*6.00e-2;
Gstr{i,1} = 'BALD';
fBALD(i)=fBALD(i)-1; fXC(i)=fXC(i)+7;

i=i+1;
Rnames{i} = 'BALD + NO3 = HNO3 + BZCO3';
k(:,i) = 1.34e-12.*(T./300).^0.00.*exp(-1859.903./T);
Gstr{i,1} = 'BALD'; Gstr{i,2} = 'NO3';
fBALD(i)=fBALD(i)-1; fNO3(i)=fNO3(i)-1; fHNO3(i)=fHNO3(i)+1; fBZCO3(i)=fBZCO3(i)+1;

i=i+1;
Rnames{i} = 'AFG1 + OH = .217*MACO3 + .723*RO2C + .060*RO2XC + .060*zRNO3 + .521*xHO2 + .201*xMECO3 + .334*xCO + .407*xRCHO + .129*xMEK + .107*xGLY + .267*xMGLY + .783*yR6OOH + .284*XC';
k(:,i) = 7.40e-11;
Gstr{i,1} = 'AFG1'; Gstr{i,2} = 'OH';
fAFG1(i)=fAFG1(i)-1; fOH(i)=fOH(i)-1; fMACO3(i)=fMACO3(i)+.217; fRO2C(i)=fRO2C(i)+.723; fRO2XC(i)=fRO2XC(i)+.060; fzRNO3(i)=fzRNO3(i)+.060; fxHO2(i)=fxHO2(i)+.521; fxMECO3(i)=fxMECO3(i)+.201; fxCO(i)=fxCO(i)+.334; fxRCHO(i)=fxRCHO(i)+.407; fxMEK(i)=fxMEK(i)+.129; fxGLY(i)=fxGLY(i)+.107; fxMGLY(i)=fxMGLY(i)+.267; fyR6OOH(i)=fyR6OOH(i)+.783; fXC(i)=fXC(i)+.284;

i=i+1;
Rnames{i} = 'AFG1 + O3 = .826*OH + .522*HO2 + .652*RO2C + .522*CO + .174*CO2 + .432*GLY + .568*MGLY + .652*xRCO3 + .652*xHCHO + .652*yR6OOH - .872*XC';
k(:,i) = 9.66e-18;
Gstr{i,1} = 'AFG1'; Gstr{i,2} = 'O3';
fAFG1(i)=fAFG1(i)-1; fO3(i)=fO3(i)-1; fOH(i)=fOH(i)+.826; fHO2(i)=fHO2(i)+.522; fRO2C(i)=fRO2C(i)+.652; fCO(i)=fCO(i)+.522; fCO2(i)=fCO2(i)+.174; fGLY(i)=fGLY(i)+.432; fMGLY(i)=fMGLY(i)+.568; fxRCO3(i)=fxRCO3(i)+.652; fxHCHO(i)=fxHCHO(i)+.652; fyR6OOH(i)=fyR6OOH(i)+.652; fXC(i)=fXC(i)-.872;

i=i+1;
Rnames{i} = 'AFG1 + HV = 1.023*HO2 + .173*MEO2 + .305*MECO3 + .500*MACO3 + .695*CO + .195*GLY + .305*MGLY + .217*XC';
k(:,i) = JAFG1;
Gstr{i,1} = 'AFG1';
fAFG1(i)=fAFG1(i)-1; fHO2(i)=fHO2(i)+1.023; fMEO2(i)=fMEO2(i)+.173; fMECO3(i)=fMECO3(i)+.305; fMACO3(i)=fMACO3(i)+.500; fCO(i)=fCO(i)+.695; fGLY(i)=fGLY(i)+.195; fMGLY(i)=fMGLY(i)+.305; fXC(i)=fXC(i)+.217;

i=i+1;
Rnames{i} = 'AFG2 + OH = .217*MACO3 + .723*RO2C + .060*RO2XC + .060*zRNO3 + .521*xHO2 + .201*xMECO3 + .334*xCO + .407*xRCHO + .129*xMEK + .107*xGLY + .267*xMGLY + .783*yR6OOH + .284*XC';
k(:,i) = 7.40e-11;
Gstr{i,1} = 'AFG2'; Gstr{i,2} = 'OH';
fAFG2(i)=fAFG2(i)-1; fOH(i)=fOH(i)-1; fMACO3(i)=fMACO3(i)+.217; fRO2C(i)=fRO2C(i)+.723; fRO2XC(i)=fRO2XC(i)+.060; fzRNO3(i)=fzRNO3(i)+.060; fxHO2(i)=fxHO2(i)+.521; fxMECO3(i)=fxMECO3(i)+.201; fxCO(i)=fxCO(i)+.334; fxRCHO(i)=fxRCHO(i)+.407; fxMEK(i)=fxMEK(i)+.129; fxGLY(i)=fxGLY(i)+.107; fxMGLY(i)=fxMGLY(i)+.267; fyR6OOH(i)=fyR6OOH(i)+.783; fXC(i)=fXC(i)+.284;

i=i+1;
Rnames{i} = 'AFG2 + O3 = .826*OH + .522*HO2 + .652*RO2C + .522*CO + .174*CO2 + .432*GLY + .568*MGLY + .652*xRCO3 + .652*xHCHO + .652*yR6OOH - .872*XC';
k(:,i) = 9.66e-18;
Gstr{i,1} = 'AFG2'; Gstr{i,2} = 'O3';
fAFG2(i)=fAFG2(i)-1; fO3(i)=fO3(i)-1; fOH(i)=fOH(i)+.826; fHO2(i)=fHO2(i)+.522; fRO2C(i)=fRO2C(i)+.652; fCO(i)=fCO(i)+.522; fCO2(i)=fCO2(i)+.174; fGLY(i)=fGLY(i)+.432; fMGLY(i)=fMGLY(i)+.568; fxRCO3(i)=fxRCO3(i)+.652; fxHCHO(i)=fxHCHO(i)+.652; fyR6OOH(i)=fyR6OOH(i)+.652; fXC(i)=fXC(i)-.872;

i=i+1;
Rnames{i} = 'AFG2 + HV = PROD2 - 1*XC';
k(:,i) = JAFG1;
Gstr{i,1} = 'AFG2';
fAFG2(i)=fAFG2(i)-1; fPROD2(i)=fPROD2(i)+1; fXC(i)=fXC(i)-1;

i=i+1;
Rnames{i} = 'AFG3 + OH = .206*MACO3 + .733*RO2C + .117*RO2XC + .117*zRNO3 + .561*xHO2 + .117*xMECO3 + .114*xCO + .274*xGLY + .153*xMGLY + .019*xBACL + .195*xAFG1 + .195*xAFG2 + .231*xIPRD + .794*yR6OOH + .938*XC';
k(:,i) = 9.35e-11;
Gstr{i,1} = 'AFG3'; Gstr{i,2} = 'OH';
fAFG3(i)=fAFG3(i)-1; fOH(i)=fOH(i)-1; fMACO3(i)=fMACO3(i)+.206; fRO2C(i)=fRO2C(i)+.733; fRO2XC(i)=fRO2XC(i)+.117; fzRNO3(i)=fzRNO3(i)+.117; fxHO2(i)=fxHO2(i)+.561; fxMECO3(i)=fxMECO3(i)+.117; fxCO(i)=fxCO(i)+.114; fxGLY(i)=fxGLY(i)+.274; fxMGLY(i)=fxMGLY(i)+.153; fxBACL(i)=fxBACL(i)+.019; fxAFG1(i)=fxAFG1(i)+.195; fxAFG2(i)=fxAFG2(i)+.195; fxIPRD(i)=fxIPRD(i)+.231; fyR6OOH(i)=fyR6OOH(i)+.794; fXC(i)=fXC(i)+.938;

i=i+1;
Rnames{i} = 'AFG3 + O3 = .471*OH + .554*HO2 + .013*MECO3 + .258*RO2C + .007*RO2XC + .007*zRNO3 + .580*CO + .190*CO2 + .366*GLY + .184*MGLY + .350*AFG1 + .350*AFG2 + .139*AFG3 + .003*MACR + .004*MVK + .003*IPRD + .095*xHO2 + .163*xRCO3 + .163*xHCHO + .095*xMGLY + .264*yR6OOH - .575*XC';
k(:,i) = 1.43e-17;
Gstr{i,1} = 'AFG3'; Gstr{i,2} = 'O3';
fAFG3(i)=fAFG3(i)-1; fO3(i)=fO3(i)-1; fOH(i)=fOH(i)+.471; fHO2(i)=fHO2(i)+.554; fMECO3(i)=fMECO3(i)+.013; fRO2C(i)=fRO2C(i)+.258; fRO2XC(i)=fRO2XC(i)+.007; fzRNO3(i)=fzRNO3(i)+.007; fCO(i)=fCO(i)+.580; fCO2(i)=fCO2(i)+.190; fGLY(i)=fGLY(i)+.366; fMGLY(i)=fMGLY(i)+.184; fAFG1(i)=fAFG1(i)+.350; fAFG2(i)=fAFG2(i)+.350; fAFG3(i)=fAFG3(i)+.139; fMACR(i)=fMACR(i)+.003; fMVK(i)=fMVK(i)+.004; fIPRD(i)=fIPRD(i)+.003; fxHO2(i)=fxHO2(i)+.095; fxRCO3(i)=fxRCO3(i)+.163; fxHCHO(i)=fxHCHO(i)+.163; fxMGLY(i)=fxMGLY(i)+.095; fyR6OOH(i)=fyR6OOH(i)+.264; fXC(i)=fXC(i)-.575;

i=i+1;
Rnames{i} = 'MACR + OH = .5*MACO3 + .5*RO2C + .5*xHO2 + .416*xCO + .084*xHCHO + .416*xMEK + .084*xMGLY + .5*yROOH - 0.416*XC';
k(:,i) = 8.00e-12.*(T./300).^0.00.*exp(379.932./T);
Gstr{i,1} = 'MACR'; Gstr{i,2} = 'OH';
fMACR(i)=fMACR(i)-1; fOH(i)=fOH(i)-1; fMACO3(i)=fMACO3(i)+.5; fRO2C(i)=fRO2C(i)+.5; fxHO2(i)=fxHO2(i)+.5; fxCO(i)=fxCO(i)+.416; fxHCHO(i)=fxHCHO(i)+.084; fxMEK(i)=fxMEK(i)+.416; fxMGLY(i)=fxMGLY(i)+.084; fyROOH(i)=fyROOH(i)+.5; fXC(i)=fXC(i)-0.416;

i=i+1;
Rnames{i} = 'MACR + O3 = .208*OH + .108*HO2 + .1*RO2C + .45*CO + .117*CO2 + .1*HCHO + .9*MGLY + .333*HCOOH + .1*xRCO3 + .1*xHCHO + .1*yROOH - 0.1*XC';
k(:,i) = 1.40e-15.*(T./300).^0.00.*exp(-2099.94./T);
Gstr{i,1} = 'MACR'; Gstr{i,2} = 'O3';
fMACR(i)=fMACR(i)-1; fO3(i)=fO3(i)-1; fOH(i)=fOH(i)+.208; fHO2(i)=fHO2(i)+.108; fRO2C(i)=fRO2C(i)+.1; fCO(i)=fCO(i)+.45; fCO2(i)=fCO2(i)+.117; fHCHO(i)=fHCHO(i)+.1; fMGLY(i)=fMGLY(i)+.9; fHCOOH(i)=fHCOOH(i)+.333; fxRCO3(i)=fxRCO3(i)+.1; fxHCHO(i)=fxHCHO(i)+.1; fyROOH(i)=fyROOH(i)+.1; fXC(i)=fXC(i)-0.1;

i=i+1;
Rnames{i} = 'MACR + NO3 = .5*MACO3 + RO2C + HNO3 + xHO2 + .5*xCO + .5*yROOH + 1.5*XC + .5*XN';
k(:,i) = 1.50e-12.*(T./300).^0.00.*exp(-1815.117./T);
Gstr{i,1} = 'MACR'; Gstr{i,2} = 'NO3';
fMACR(i)=fMACR(i)-1; fNO3(i)=fNO3(i)-1; fMACO3(i)=fMACO3(i)+.5; fRO2C(i)=fRO2C(i)+1; fHNO3(i)=fHNO3(i)+1; fxHO2(i)=fxHO2(i)+1; fxCO(i)=fxCO(i)+.5; fyROOH(i)=fyROOH(i)+.5; fXC(i)=fXC(i)+1.5; fXN(i)=fXN(i)+.5;

i=i+1;
Rnames{i} = 'MACR + O3P = RCHO + XC';
k(:,i) = 6.34e-12;
Gstr{i,1} = 'MACR'; Gstr{i,2} = 'O3P';
fMACR(i)=fMACR(i)-1; fO3P(i)=fO3P(i)-1; fRCHO(i)=fRCHO(i)+1; fXC(i)=fXC(i)+1;

i=i+1;
Rnames{i} = 'MACR + HV = .33*OH + .67*HO2 + .34*MECO3 + .33*MACO3 + .33*RO2C + .67*CO + .34*HCHO + .33*xMECO3 + .33*xHCHO + .33*yROOH';
k(:,i) = JMACR_06;
Gstr{i,1} = 'MACR';
fMACR(i)=fMACR(i)-1; fOH(i)=fOH(i)+.33; fHO2(i)=fHO2(i)+.67; fMECO3(i)=fMECO3(i)+.34; fMACO3(i)=fMACO3(i)+.33; fRO2C(i)=fRO2C(i)+.33; fCO(i)=fCO(i)+.67; fHCHO(i)=fHCHO(i)+.34; fxMECO3(i)=fxMECO3(i)+.33; fxHCHO(i)=fxHCHO(i)+.33; fyROOH(i)=fyROOH(i)+.33;

i=i+1;
Rnames{i} = 'MVK + OH = .975*RO2C + .025*RO2XC + .025*zRNO3 + .3*xHO2 + .675*xMECO3 + .3*xHCHO + .675*xHOCCHO + .3*xMGLY + yROOH - 0.05*XC';
k(:,i) = 2.60e-12.*(T./300).^0.00.*exp(609.903./T);
Gstr{i,1} = 'MVK'; Gstr{i,2} = 'OH';
fMVK(i)=fMVK(i)-1; fOH(i)=fOH(i)-1; fRO2C(i)=fRO2C(i)+.975; fRO2XC(i)=fRO2XC(i)+.025; fzRNO3(i)=fzRNO3(i)+.025; fxHO2(i)=fxHO2(i)+.3; fxMECO3(i)=fxMECO3(i)+.675; fxHCHO(i)=fxHCHO(i)+.3; fxHOCCHO(i)=fxHOCCHO(i)+.675; fxMGLY(i)=fxMGLY(i)+.3; fyROOH(i)=fyROOH(i)+1; fXC(i)=fXC(i)-0.05;

i=i+1;
Rnames{i} = 'MVK + O3 = .164*OH + .064*HO2 + .05*RO2C + .05*xHO2 + .475*CO + .124*CO2 + .05*HCHO + .95*MGLY + .351*HCOOH + .05*xRCO3 + .05*xHCHO + .05*yROOH - 0.05*XC';
k(:,i) = 8.50e-16.*(T./300).^0.00.*exp(-1519.726./T);
Gstr{i,1} = 'MVK'; Gstr{i,2} = 'O3';
fMVK(i)=fMVK(i)-1; fO3(i)=fO3(i)-1; fOH(i)=fOH(i)+.164; fHO2(i)=fHO2(i)+.064; fRO2C(i)=fRO2C(i)+.05; fxHO2(i)=fxHO2(i)+.05; fCO(i)=fCO(i)+.475; fCO2(i)=fCO2(i)+.124; fHCHO(i)=fHCHO(i)+.05; fMGLY(i)=fMGLY(i)+.95; fHCOOH(i)=fHCOOH(i)+.351; fxRCO3(i)=fxRCO3(i)+.05; fxHCHO(i)=fxHCHO(i)+.05; fyROOH(i)=fyROOH(i)+.05; fXC(i)=fXC(i)-0.05;

i=i+1;
Rnames{i} = 'MVK + O3P = .45*RCHO + .55*MEK + .45*XC';
k(:,i) = 4.32e-12;
Gstr{i,1} = 'MVK'; Gstr{i,2} = 'O3P';
fMVK(i)=fMVK(i)-1; fO3P(i)=fO3P(i)-1; fRCHO(i)=fRCHO(i)+.45; fMEK(i)=fMEK(i)+.55; fXC(i)=fXC(i)+.45;

i=i+1;
Rnames{i} = 'MVK + HV = .4*MEO2 + .6*CO + .6*PROD2 + .4*MACO3 - 2.2*XC';
k(:,i) = JMVK_06;
Gstr{i,1} = 'MVK';
fMVK(i)=fMVK(i)-1; fMEO2(i)=fMEO2(i)+.4; fCO(i)=fCO(i)+.6; fPROD2(i)=fPROD2(i)+.6; fMACO3(i)=fMACO3(i)+.4; fXC(i)=fXC(i)-2.2;

i=i+1;
Rnames{i} = 'IPRD + OH = .289*MACO3 + .67*RO2C + .67*xHO2 + .041*RO2XC + .041*zRNO3 + .336*xCO + .055*xHCHO + .129*xHOCCHO + .013*xRCHO + .15*xMEK + .332*xPROD2 + .15*xGLY + .174*xMGLY - 0.504*XC + .711*yR6OOH';
k(:,i) = 6.19e-11;
Gstr{i,1} = 'IPRD'; Gstr{i,2} = 'OH';
fIPRD(i)=fIPRD(i)-1; fOH(i)=fOH(i)-1; fMACO3(i)=fMACO3(i)+.289; fRO2C(i)=fRO2C(i)+.67; fxHO2(i)=fxHO2(i)+.67; fRO2XC(i)=fRO2XC(i)+.041; fzRNO3(i)=fzRNO3(i)+.041; fxCO(i)=fxCO(i)+.336; fxHCHO(i)=fxHCHO(i)+.055; fxHOCCHO(i)=fxHOCCHO(i)+.129; fxRCHO(i)=fxRCHO(i)+.013; fxMEK(i)=fxMEK(i)+.15; fxPROD2(i)=fxPROD2(i)+.332; fxGLY(i)=fxGLY(i)+.15; fxMGLY(i)=fxMGLY(i)+.174; fXC(i)=fXC(i)-0.504; fyR6OOH(i)=fyR6OOH(i)+.711;

i=i+1;
Rnames{i} = 'IPRD + O3 = .285*OH + .4*HO2 + .048*RO2C + .048*xRCO3 + .498*CO + .14*CO2 + .124*HCHO + .21*MEK + .023*GLY + .742*MGLY + .1*HCOOH + .372*RCOOH + .047*xHOCCHO + .001*xHCHO + .048*yR6OOH - .329*XC';
k(:,i) = 4.18e-18;
Gstr{i,1} = 'IPRD'; Gstr{i,2} = 'O3';
fIPRD(i)=fIPRD(i)-1; fO3(i)=fO3(i)-1; fOH(i)=fOH(i)+.285; fHO2(i)=fHO2(i)+.4; fRO2C(i)=fRO2C(i)+.048; fxRCO3(i)=fxRCO3(i)+.048; fCO(i)=fCO(i)+.498; fCO2(i)=fCO2(i)+.14; fHCHO(i)=fHCHO(i)+.124; fMEK(i)=fMEK(i)+.21; fGLY(i)=fGLY(i)+.023; fMGLY(i)=fMGLY(i)+.742; fHCOOH(i)=fHCOOH(i)+.1; fRCOOH(i)=fRCOOH(i)+.372; fxHOCCHO(i)=fxHOCCHO(i)+.047; fxHCHO(i)=fxHCHO(i)+.001; fyR6OOH(i)=fyR6OOH(i)+.048; fXC(i)=fXC(i)-.329;

i=i+1;
Rnames{i} = 'IPRD + NO3 = .15*MACO3 + .15*HNO3 + .799*RO2C + .799*xHO2 + .051*RO2XC + .051*zRNO3 + .572*xCO + .227*xHCHO + .218*xRCHO + .008*xMGLY + .572*xRNO3 + .85*yR6OOH + .278*XN - .815*XC';
k(:,i) = 1.00e-13;
Gstr{i,1} = 'IPRD'; Gstr{i,2} = 'NO3';
fIPRD(i)=fIPRD(i)-1; fNO3(i)=fNO3(i)-1; fMACO3(i)=fMACO3(i)+.15; fHNO3(i)=fHNO3(i)+.15; fRO2C(i)=fRO2C(i)+.799; fxHO2(i)=fxHO2(i)+.799; fRO2XC(i)=fRO2XC(i)+.051; fzRNO3(i)=fzRNO3(i)+.051; fxCO(i)=fxCO(i)+.572; fxHCHO(i)=fxHCHO(i)+.227; fxRCHO(i)=fxRCHO(i)+.218; fxMGLY(i)=fxMGLY(i)+.008; fxRNO3(i)=fxRNO3(i)+.572; fyR6OOH(i)=fyR6OOH(i)+.85; fXN(i)=fXN(i)+.278; fXC(i)=fXC(i)-.815;

i=i+1;
Rnames{i} = 'IPRD + HV = 1.233*HO2 + .467*MECO3 + .3*RCO3 + 1.233*CO + .3*HCHO + .467*HOCCHO + .233*MEK - .233*XC';
k(:,i) = JMACR_06;
Gstr{i,1} = 'IPRD';
fIPRD(i)=fIPRD(i)-1; fHO2(i)=fHO2(i)+1.233; fMECO3(i)=fMECO3(i)+.467; fRCO3(i)=fRCO3(i)+.3; fCO(i)=fCO(i)+1.233; fHCHO(i)=fHCHO(i)+.3; fHOCCHO(i)=fHOCCHO(i)+.467; fMEK(i)=fMEK(i)+.233; fXC(i)=fXC(i)-.233;

i=i+1;
Rnames{i} = 'PROD2 + OH = .472*HO2 + .379*xHO2 + .029*xMECO3 + .049*xRCO3 + .473*RO2C + .071*RO2XC + .071*zRNO3 + .002*HCHO + .211*xHCHO + .001*CCHO + .083*xCCHO + .143*RCHO + .402*xRCHO + .115*xMEK + .329*PROD2 + .007*xPROD2 + .528*yR6OOH + .877*XC';
k(:,i) = 1.55e-11;
Gstr{i,1} = 'PROD2'; Gstr{i,2} = 'OH';
fPROD2(i)=fPROD2(i)-1; fOH(i)=fOH(i)-1; fHO2(i)=fHO2(i)+.472; fxHO2(i)=fxHO2(i)+.379; fxMECO3(i)=fxMECO3(i)+.029; fxRCO3(i)=fxRCO3(i)+.049; fRO2C(i)=fRO2C(i)+.473; fRO2XC(i)=fRO2XC(i)+.071; fzRNO3(i)=fzRNO3(i)+.071; fHCHO(i)=fHCHO(i)+.002; fxHCHO(i)=fxHCHO(i)+.211; fCCHO(i)=fCCHO(i)+.001; fxCCHO(i)=fxCCHO(i)+.083; fRCHO(i)=fRCHO(i)+.143; fxRCHO(i)=fxRCHO(i)+.402; fxMEK(i)=fxMEK(i)+.115; fPROD2(i)=fPROD2(i)+.329; fxPROD2(i)=fxPROD2(i)+.007; fyR6OOH(i)=fyR6OOH(i)+.528; fXC(i)=fXC(i)+.877;

i=i+1;
Rnames{i} = 'PROD2 + HV = .913*xHO2 + .4*MECO3 + .6*RCO3 + 1.59*RO2C + .087*RO2XC + .087*zRNO3 + .303*xHCHO + .163*xCCHO + .78*xRCHO + yR6OOH - .091*XC';
k(:,i) = JMEK_06.*4.86e-3;
Gstr{i,1} = 'PROD2';
fPROD2(i)=fPROD2(i)-1; fxHO2(i)=fxHO2(i)+.913; fMECO3(i)=fMECO3(i)+.4; fRCO3(i)=fRCO3(i)+.6; fRO2C(i)=fRO2C(i)+1.59; fRO2XC(i)=fRO2XC(i)+.087; fzRNO3(i)=fzRNO3(i)+.087; fxHCHO(i)=fxHCHO(i)+.303; fxCCHO(i)=fxCCHO(i)+.163; fxRCHO(i)=fxRCHO(i)+.78; fyR6OOH(i)=fyR6OOH(i)+1; fXC(i)=fXC(i)-.091;

i=i+1;
Rnames{i} = 'RNO3 + OH = .189*HO2 + .305*xHO2 + .019*NO2 + .313*xNO2 + .976*RO2C + .175*RO2XC + .175*zRNO3 + .011*xHCHO + .429*xCCHO + .001*RCHO + .036*xRCHO + .004*xACET + .01*MEK + .17*xMEK + .008*PROD2 + .031*xPROD2 + .189*RNO3 + .305*xRNO3 + .157*yROOH + .636*yR6OOH + .174*XN + .04*XC';
k(:,i) = 7.20e-12;
Gstr{i,1} = 'RNO3'; Gstr{i,2} = 'OH';
fRNO3(i)=fRNO3(i)-1; fOH(i)=fOH(i)-1; fHO2(i)=fHO2(i)+.189; fxHO2(i)=fxHO2(i)+.305; fNO2(i)=fNO2(i)+.019; fxNO2(i)=fxNO2(i)+.313; fRO2C(i)=fRO2C(i)+.976; fRO2XC(i)=fRO2XC(i)+.175; fzRNO3(i)=fzRNO3(i)+.175; fxHCHO(i)=fxHCHO(i)+.011; fxCCHO(i)=fxCCHO(i)+.429; fRCHO(i)=fRCHO(i)+.001; fxRCHO(i)=fxRCHO(i)+.036; fxACET(i)=fxACET(i)+.004; fMEK(i)=fMEK(i)+.01; fxMEK(i)=fxMEK(i)+.17; fPROD2(i)=fPROD2(i)+.008; fxPROD2(i)=fxPROD2(i)+.031; fRNO3(i)=fRNO3(i)+.189; fxRNO3(i)=fxRNO3(i)+.305; fyROOH(i)=fyROOH(i)+.157; fyR6OOH(i)=fyR6OOH(i)+.636; fXN(i)=fXN(i)+.174; fXC(i)=fXC(i)+.04;

i=i+1;
Rnames{i} = 'RNO3 + HV = .344*HO2 + .554*xHO2 + NO2 + .721*RO2C + .102*RO2XC + .102*zRNO3 + .074*HCHO + .061*xHCHO + .214*CCHO + .23*xCCHO + .074*RCHO + .063*xRCHO + .008*xACET + .124*MEK + .083*xMEK + .19*PROD2 + .261*xPROD2 + .066*yROOH + .591*yR6OOH + .396*XC';
k(:,i) = JIC3ONO2;
Gstr{i,1} = 'RNO3';
fRNO3(i)=fRNO3(i)-1; fHO2(i)=fHO2(i)+.344; fxHO2(i)=fxHO2(i)+.554; fNO2(i)=fNO2(i)+1; fRO2C(i)=fRO2C(i)+.721; fRO2XC(i)=fRO2XC(i)+.102; fzRNO3(i)=fzRNO3(i)+.102; fHCHO(i)=fHCHO(i)+.074; fxHCHO(i)=fxHCHO(i)+.061; fCCHO(i)=fCCHO(i)+.214; fxCCHO(i)=fxCCHO(i)+.23; fRCHO(i)=fRCHO(i)+.074; fxRCHO(i)=fxRCHO(i)+.063; fxACET(i)=fxACET(i)+.008; fMEK(i)=fMEK(i)+.124; fxMEK(i)=fxMEK(i)+.083; fPROD2(i)=fPROD2(i)+.19; fxPROD2(i)=fxPROD2(i)+.261; fyROOH(i)=fyROOH(i)+.066; fyR6OOH(i)=fyR6OOH(i)+.591; fXC(i)=fXC(i)+.396;

i=i+1;
Rnames{i} = 'HOCCHO + OH = MECO3 + H2O';
k(:,i) = 4.40e-12.*(T./300).^0.00.*exp(364.835./T);
Gstr{i,1} = 'HOCCHO'; Gstr{i,2} = 'OH';
fHOCCHO(i)=fHOCCHO(i)-1; fOH(i)=fOH(i)-1; fMECO3(i)=fMECO3(i)+1; fH2O(i)=fH2O(i)+1;

i=i+1;
Rnames{i} = 'HOCCHO + HV = CO + 2*HO2 + HCHO';
k(:,i) = JHOCCHO;
Gstr{i,1} = 'HOCCHO';
fHOCCHO(i)=fHOCCHO(i)-1; fCO(i)=fCO(i)+1; fHO2(i)=fHO2(i)+2; fHCHO(i)=fHCHO(i)+1;

i=i+1;
Rnames{i} = 'HOCCHO + NO3 = HNO3 + MECO3';
k(:,i) = 1.40e-12.*(T./300).^0.00.*exp(-1859.903./T);
Gstr{i,1} = 'HOCCHO'; Gstr{i,2} = 'NO3';
fHOCCHO(i)=fHOCCHO(i)-1; fNO3(i)=fNO3(i)-1; fHNO3(i)=fHNO3(i)+1; fMECO3(i)=fMECO3(i)+1;

i=i+1;
Rnames{i} = 'ACRO + OH = .25*xHO2 + .75*MACO3 + .25*RO2C + .167*xCO + .083*xHCHO + .167*xCCHO + .083*xGLY + .25*yROOH - .75*XC';
k(:,i) = 1.99e-11;
Gstr{i,1} = 'ACRO'; Gstr{i,2} = 'OH';
fACRO(i)=fACRO(i)-1; fOH(i)=fOH(i)-1; fxHO2(i)=fxHO2(i)+.25; fMACO3(i)=fMACO3(i)+.75; fRO2C(i)=fRO2C(i)+.25; fxCO(i)=fxCO(i)+.167; fxHCHO(i)=fxHCHO(i)+.083; fxCCHO(i)=fxCCHO(i)+.167; fxGLY(i)=fxGLY(i)+.083; fyROOH(i)=fyROOH(i)+.25; fXC(i)=fXC(i)-.75;

i=i+1;
Rnames{i} = 'ACRO + O3 = .83*HO2 + .33*OH + 1.005*CO + .31*CO2 + .5*HCHO + .185*HCOOH + .5*GLY';
k(:,i) = 1.40e-15.*exp(-2528.18./T);
Gstr{i,1} = 'ACRO'; Gstr{i,2} = 'O3';
fACRO(i)=fACRO(i)-1; fO3(i)=fO3(i)-1; fHO2(i)=fHO2(i)+.83; fOH(i)=fOH(i)+.33; fCO(i)=fCO(i)+1.005; fCO2(i)=fCO2(i)+.31; fHCHO(i)=fHCHO(i)+.5; fHCOOH(i)=fHCOOH(i)+.185; fGLY(i)=fGLY(i)+.5;

i=i+1;
Rnames{i} = 'ACRO + NO3 = .031*xHO2 + .967*MACO3 + .031*RO2C + .002*RO2XC + .002*zRNO3 + .967*HNO3 + .031*xCO + .031*xRNO3 + .033*yROOH + .002*XN - 1.097*XC';
k(:,i) = 1.18e-15;
Gstr{i,1} = 'ACRO'; Gstr{i,2} = 'NO3';
fACRO(i)=fACRO(i)-1; fNO3(i)=fNO3(i)-1; fxHO2(i)=fxHO2(i)+.031; fMACO3(i)=fMACO3(i)+.967; fRO2C(i)=fRO2C(i)+.031; fRO2XC(i)=fRO2XC(i)+.002; fzRNO3(i)=fzRNO3(i)+.002; fHNO3(i)=fHNO3(i)+.967; fxCO(i)=fxCO(i)+.031; fxRNO3(i)=fxRNO3(i)+.031; fyROOH(i)=fyROOH(i)+.033; fXN(i)=fXN(i)+.002; fXC(i)=fXC(i)-1.097;

i=i+1;
Rnames{i} = 'ACRO + O3P = RCHO';
k(:,i) = 2.37e-12;
Gstr{i,1} = 'ACRO'; Gstr{i,2} = 'O3P';
fACRO(i)=fACRO(i)-1; fO3P(i)=fO3P(i)-1; fRCHO(i)=fRCHO(i)+1;

i=i+1;
Rnames{i} = 'ACRO + HV = 1.066*HO2 + .178*OH + .234*MEO2 + .33*MACO3 + 1.188*CO + .102*CO2 + .34*HCHO + .05*CCOOH - .284*XC';
k(:,i) = JACRO_09;
Gstr{i,1} = 'ACRO';
fACRO(i)=fACRO(i)-1; fHO2(i)=fHO2(i)+1.066; fOH(i)=fOH(i)+.178; fMEO2(i)=fMEO2(i)+.234; fMACO3(i)=fMACO3(i)+.33; fCO(i)=fCO(i)+1.188; fCO2(i)=fCO2(i)+.102; fHCHO(i)=fHCHO(i)+.34; fCCOOH(i)=fCCOOH(i)+.05; fXC(i)=fXC(i)-.284;

i=i+1;
Rnames{i} = 'CCO3H + OH = .98*MECO3 + .02*RO2C + CO2 + xOH + xHCHO + .02*yROOH';
k(:,i) = 5.28e-12;
Gstr{i,1} = 'CCO3H'; Gstr{i,2} = 'OH';
fCCO3H(i)=fCCO3H(i)-1; fOH(i)=fOH(i)-1; fMECO3(i)=fMECO3(i)+.98; fRO2C(i)=fRO2C(i)+.02; fCO2(i)=fCO2(i)+1; fxOH(i)=fxOH(i)+1; fxHCHO(i)=fxHCHO(i)+1; fyROOH(i)=fyROOH(i)+.02;

i=i+1;
Rnames{i} = 'CCO3H + HV = MEO2 + CO2 + OH';
k(:,i) = JPAA;
Gstr{i,1} = 'CCO3H';
fCCO3H(i)=fCCO3H(i)-1; fMEO2(i)=fMEO2(i)+1; fCO2(i)=fCO2(i)+1; fOH(i)=fOH(i)+1;

i=i+1;
Rnames{i} = 'RCO3H + OH = .806*RCO3 + .194*RO2C + .194*yROOH + .11*CO2 + xOH + .11*xCCHO + .084*xHO2 + .084*xRCHO';
k(:,i) = 6.42e-12;
Gstr{i,1} = 'RCO3H'; Gstr{i,2} = 'OH';
fRCO3H(i)=fRCO3H(i)-1; fOH(i)=fOH(i)-1; fRCO3(i)=fRCO3(i)+.806; fRO2C(i)=fRO2C(i)+.194; fyROOH(i)=fyROOH(i)+.194; fCO2(i)=fCO2(i)+.11; fxOH(i)=fxOH(i)+1; fxCCHO(i)=fxCCHO(i)+.11; fxHO2(i)=fxHO2(i)+.084; fxRCHO(i)=fxRCHO(i)+.084;

i=i+1;
Rnames{i} = 'RCO3H + HV = xHO2 + xCCHO + yROOH + CO2 + OH';
k(:,i) = JPAA;
Gstr{i,1} = 'RCO3H';
fRCO3H(i)=fRCO3H(i)-1; fxHO2(i)=fxHO2(i)+1; fxCCHO(i)=fxCCHO(i)+1; fyROOH(i)=fyROOH(i)+1; fCO2(i)=fCO2(i)+1; fOH(i)=fOH(i)+1;

i=i+1;
Rnames{i} = 'xHCHO + NO = NO + HCHO';
k(:,i) = 2.60e-12.*(T./300).^0.00.*exp(379.932./T);
Gstr{i,1} = 'xHCHO'; Gstr{i,2} = 'NO';
fxHCHO(i)=fxHCHO(i)-1; fNO(i)=fNO(i)-1; fNO(i)=fNO(i)+1; fHCHO(i)=fHCHO(i)+1;

i=i+1;
Rnames{i} = 'xHCHO + HO2 = HO2 + XC';
k(:,i) = 3.80e-13.*(T./300).^0.00.*exp(899.758./T);
Gstr{i,1} = 'xHCHO'; Gstr{i,2} = 'HO2';
fxHCHO(i)=fxHCHO(i)-1; fHO2(i)=fHO2(i)-1; fHO2(i)=fHO2(i)+1; fXC(i)=fXC(i)+1;

i=i+1;
Rnames{i} = 'xHCHO + NO3 = NO3 + HCHO';
k(:,i) = 2.30e-12;
Gstr{i,1} = 'xHCHO'; Gstr{i,2} = 'NO3';
fxHCHO(i)=fxHCHO(i)-1; fNO3(i)=fNO3(i)-1; fNO3(i)=fNO3(i)+1; fHCHO(i)=fHCHO(i)+1;

i=i+1;
Rnames{i} = 'xHCHO + MEO2 = MEO2 + .5*HCHO + .5*XC';
k(:,i) = 2.00e-13;
Gstr{i,1} = 'xHCHO'; Gstr{i,2} = 'MEO2';
fxHCHO(i)=fxHCHO(i)-1; fMEO2(i)=fMEO2(i)-1; fMEO2(i)=fMEO2(i)+1; fHCHO(i)=fHCHO(i)+.5; fXC(i)=fXC(i)+.5;

i=i+1;
Rnames{i} = 'xHCHO + RO2C = RO2C + .5*HCHO + .5*XC';
k(:,i) = 3.50e-14;
Gstr{i,1} = 'xHCHO'; Gstr{i,2} = 'RO2C';
fxHCHO(i)=fxHCHO(i)-1; fRO2C(i)=fRO2C(i)-1; fRO2C(i)=fRO2C(i)+1; fHCHO(i)=fHCHO(i)+.5; fXC(i)=fXC(i)+.5;

i=i+1;
Rnames{i} = 'xHCHO + RO2XC = RO2XC + .5*HCHO + .5*XC';
k(:,i) = 3.50e-14;
Gstr{i,1} = 'xHCHO'; Gstr{i,2} = 'RO2XC';
fxHCHO(i)=fxHCHO(i)-1; fRO2XC(i)=fRO2XC(i)-1; fRO2XC(i)=fRO2XC(i)+1; fHCHO(i)=fHCHO(i)+.5; fXC(i)=fXC(i)+.5;

i=i+1;
Rnames{i} = 'xHCHO + MECO3 = MECO3 + HCHO';
k(:,i) = 4.40e-13.*(T./300).^0.00.*exp(1069.847./T);
Gstr{i,1} = 'xHCHO'; Gstr{i,2} = 'MECO3';
fxHCHO(i)=fxHCHO(i)-1; fMECO3(i)=fMECO3(i)-1; fMECO3(i)=fMECO3(i)+1; fHCHO(i)=fHCHO(i)+1;

i=i+1;
Rnames{i} = 'xHCHO + RCO3 = RCO3 + HCHO';
k(:,i) = 4.40e-13.*(T./300).^0.00.*exp(1069.847./T);
Gstr{i,1} = 'xHCHO'; Gstr{i,2} = 'RCO3';
fxHCHO(i)=fxHCHO(i)-1; fRCO3(i)=fRCO3(i)-1; fRCO3(i)=fRCO3(i)+1; fHCHO(i)=fHCHO(i)+1;

i=i+1;
Rnames{i} = 'xHCHO + BZCO3 = BZCO3 + HCHO';
k(:,i) = 4.40e-13.*(T./300).^0.00.*exp(1069.847./T);
Gstr{i,1} = 'xHCHO'; Gstr{i,2} = 'BZCO3';
fxHCHO(i)=fxHCHO(i)-1; fBZCO3(i)=fBZCO3(i)-1; fBZCO3(i)=fBZCO3(i)+1; fHCHO(i)=fHCHO(i)+1;

i=i+1;
Rnames{i} = 'xHCHO + MACO3 = MACO3 + HCHO';
k(:,i) = 4.40e-13.*(T./300).^0.00.*exp(1069.847./T);
Gstr{i,1} = 'xHCHO'; Gstr{i,2} = 'MACO3';
fxHCHO(i)=fxHCHO(i)-1; fMACO3(i)=fMACO3(i)-1; fMACO3(i)=fMACO3(i)+1; fHCHO(i)=fHCHO(i)+1;

i=i+1;
Rnames{i} = 'xCCHO + NO = NO + CCHO';
k(:,i) = 2.60e-12.*(T./300).^0.00.*exp(379.932./T);
Gstr{i,1} = 'xCCHO'; Gstr{i,2} = 'NO';
fxCCHO(i)=fxCCHO(i)-1; fNO(i)=fNO(i)-1; fNO(i)=fNO(i)+1; fCCHO(i)=fCCHO(i)+1;

i=i+1;
Rnames{i} = 'xCCHO + HO2 = HO2 + 2*XC';
k(:,i) = 3.80e-13.*(T./300).^0.00.*exp(899.758./T);
Gstr{i,1} = 'xCCHO'; Gstr{i,2} = 'HO2';
fxCCHO(i)=fxCCHO(i)-1; fHO2(i)=fHO2(i)-1; fHO2(i)=fHO2(i)+1; fXC(i)=fXC(i)+2;

i=i+1;
Rnames{i} = 'xCCHO + NO3 = NO3 + CCHO';
k(:,i) = 2.30e-12;
Gstr{i,1} = 'xCCHO'; Gstr{i,2} = 'NO3';
fxCCHO(i)=fxCCHO(i)-1; fNO3(i)=fNO3(i)-1; fNO3(i)=fNO3(i)+1; fCCHO(i)=fCCHO(i)+1;

i=i+1;
Rnames{i} = 'xCCHO + MEO2 = MEO2 + .5*CCHO + XC';
k(:,i) = 2.00e-13;
Gstr{i,1} = 'xCCHO'; Gstr{i,2} = 'MEO2';
fxCCHO(i)=fxCCHO(i)-1; fMEO2(i)=fMEO2(i)-1; fMEO2(i)=fMEO2(i)+1; fCCHO(i)=fCCHO(i)+.5; fXC(i)=fXC(i)+1;

i=i+1;
Rnames{i} = 'xCCHO + RO2C = RO2C + .5*CCHO + XC';
k(:,i) = 3.50e-14;
Gstr{i,1} = 'xCCHO'; Gstr{i,2} = 'RO2C';
fxCCHO(i)=fxCCHO(i)-1; fRO2C(i)=fRO2C(i)-1; fRO2C(i)=fRO2C(i)+1; fCCHO(i)=fCCHO(i)+.5; fXC(i)=fXC(i)+1;

i=i+1;
Rnames{i} = 'xCCHO + RO2XC = RO2XC + .5*CCHO + XC';
k(:,i) = 3.50e-14;
Gstr{i,1} = 'xCCHO'; Gstr{i,2} = 'RO2XC';
fxCCHO(i)=fxCCHO(i)-1; fRO2XC(i)=fRO2XC(i)-1; fRO2XC(i)=fRO2XC(i)+1; fCCHO(i)=fCCHO(i)+.5; fXC(i)=fXC(i)+1;

i=i+1;
Rnames{i} = 'xCCHO + MECO3 = MECO3 + CCHO';
k(:,i) = 4.40e-13.*(T./300).^0.00.*exp(1069.847./T);
Gstr{i,1} = 'xCCHO'; Gstr{i,2} = 'MECO3';
fxCCHO(i)=fxCCHO(i)-1; fMECO3(i)=fMECO3(i)-1; fMECO3(i)=fMECO3(i)+1; fCCHO(i)=fCCHO(i)+1;

i=i+1;
Rnames{i} = 'xCCHO + RCO3 = RCO3 + CCHO';
k(:,i) = 4.40e-13.*(T./300).^0.00.*exp(1069.847./T);
Gstr{i,1} = 'xCCHO'; Gstr{i,2} = 'RCO3';
fxCCHO(i)=fxCCHO(i)-1; fRCO3(i)=fRCO3(i)-1; fRCO3(i)=fRCO3(i)+1; fCCHO(i)=fCCHO(i)+1;

i=i+1;
Rnames{i} = 'xCCHO + BZCO3 = BZCO3 + CCHO';
k(:,i) = 4.40e-13.*(T./300).^0.00.*exp(1069.847./T);
Gstr{i,1} = 'xCCHO'; Gstr{i,2} = 'BZCO3';
fxCCHO(i)=fxCCHO(i)-1; fBZCO3(i)=fBZCO3(i)-1; fBZCO3(i)=fBZCO3(i)+1; fCCHO(i)=fCCHO(i)+1;

i=i+1;
Rnames{i} = 'xCCHO + MACO3 = MACO3 + CCHO';
k(:,i) = 4.40e-13.*(T./300).^0.00.*exp(1069.847./T);
Gstr{i,1} = 'xCCHO'; Gstr{i,2} = 'MACO3';
fxCCHO(i)=fxCCHO(i)-1; fMACO3(i)=fMACO3(i)-1; fMACO3(i)=fMACO3(i)+1; fCCHO(i)=fCCHO(i)+1;

i=i+1;
Rnames{i} = 'xRCHO + NO = NO + RCHO';
k(:,i) = 2.60e-12.*(T./300).^0.00.*exp(379.932./T);
Gstr{i,1} = 'xRCHO'; Gstr{i,2} = 'NO';
fxRCHO(i)=fxRCHO(i)-1; fNO(i)=fNO(i)-1; fNO(i)=fNO(i)+1; fRCHO(i)=fRCHO(i)+1;

i=i+1;
Rnames{i} = 'xRCHO + HO2 = HO2 + 3*XC';
k(:,i) = 3.80e-13.*(T./300).^0.00.*exp(899.758./T);
Gstr{i,1} = 'xRCHO'; Gstr{i,2} = 'HO2';
fxRCHO(i)=fxRCHO(i)-1; fHO2(i)=fHO2(i)-1; fHO2(i)=fHO2(i)+1; fXC(i)=fXC(i)+3;

i=i+1;
Rnames{i} = 'xRCHO + NO3 = NO3 + RCHO';
k(:,i) = 2.30e-12;
Gstr{i,1} = 'xRCHO'; Gstr{i,2} = 'NO3';
fxRCHO(i)=fxRCHO(i)-1; fNO3(i)=fNO3(i)-1; fNO3(i)=fNO3(i)+1; fRCHO(i)=fRCHO(i)+1;

i=i+1;
Rnames{i} = 'xRCHO + MEO2 = MEO2 + .5*RCHO + 1.5*XC';
k(:,i) = 2.00e-13;
Gstr{i,1} = 'xRCHO'; Gstr{i,2} = 'MEO2';
fxRCHO(i)=fxRCHO(i)-1; fMEO2(i)=fMEO2(i)-1; fMEO2(i)=fMEO2(i)+1; fRCHO(i)=fRCHO(i)+.5; fXC(i)=fXC(i)+1.5;

i=i+1;
Rnames{i} = 'xRCHO + RO2C = RO2C + .5*RCHO + 1.5*XC';
k(:,i) = 3.50e-14;
Gstr{i,1} = 'xRCHO'; Gstr{i,2} = 'RO2C';
fxRCHO(i)=fxRCHO(i)-1; fRO2C(i)=fRO2C(i)-1; fRO2C(i)=fRO2C(i)+1; fRCHO(i)=fRCHO(i)+.5; fXC(i)=fXC(i)+1.5;

i=i+1;
Rnames{i} = 'xRCHO + RO2XC = RO2XC + .5*RCHO + 1.5*XC';
k(:,i) = 3.50e-14;
Gstr{i,1} = 'xRCHO'; Gstr{i,2} = 'RO2XC';
fxRCHO(i)=fxRCHO(i)-1; fRO2XC(i)=fRO2XC(i)-1; fRO2XC(i)=fRO2XC(i)+1; fRCHO(i)=fRCHO(i)+.5; fXC(i)=fXC(i)+1.5;

i=i+1;
Rnames{i} = 'xRCHO + MECO3 = MECO3 + RCHO';
k(:,i) = 4.40e-13.*(T./300).^0.00.*exp(1069.847./T);
Gstr{i,1} = 'xRCHO'; Gstr{i,2} = 'MECO3';
fxRCHO(i)=fxRCHO(i)-1; fMECO3(i)=fMECO3(i)-1; fMECO3(i)=fMECO3(i)+1; fRCHO(i)=fRCHO(i)+1;

i=i+1;
Rnames{i} = 'xRCHO + RCO3 = RCO3 + RCHO';
k(:,i) = 4.40e-13.*(T./300).^0.00.*exp(1069.847./T);
Gstr{i,1} = 'xRCHO'; Gstr{i,2} = 'RCO3';
fxRCHO(i)=fxRCHO(i)-1; fRCO3(i)=fRCO3(i)-1; fRCO3(i)=fRCO3(i)+1; fRCHO(i)=fRCHO(i)+1;

i=i+1;
Rnames{i} = 'xRCHO + BZCO3 = BZCO3 + RCHO';
k(:,i) = 4.40e-13.*(T./300).^0.00.*exp(1069.847./T);
Gstr{i,1} = 'xRCHO'; Gstr{i,2} = 'BZCO3';
fxRCHO(i)=fxRCHO(i)-1; fBZCO3(i)=fBZCO3(i)-1; fBZCO3(i)=fBZCO3(i)+1; fRCHO(i)=fRCHO(i)+1;

i=i+1;
Rnames{i} = 'xRCHO + MACO3 = MACO3 + RCHO';
k(:,i) = 4.40e-13.*(T./300).^0.00.*exp(1069.847./T);
Gstr{i,1} = 'xRCHO'; Gstr{i,2} = 'MACO3';
fxRCHO(i)=fxRCHO(i)-1; fMACO3(i)=fMACO3(i)-1; fMACO3(i)=fMACO3(i)+1; fRCHO(i)=fRCHO(i)+1;

i=i+1;
Rnames{i} = 'xACET + NO = NO + ACET';
k(:,i) = 2.60e-12.*(T./300).^0.00.*exp(379.932./T);
Gstr{i,1} = 'xACET'; Gstr{i,2} = 'NO';
fxACET(i)=fxACET(i)-1; fNO(i)=fNO(i)-1; fNO(i)=fNO(i)+1; fACET(i)=fACET(i)+1;

i=i+1;
Rnames{i} = 'xACET + HO2 = HO2 + 3*XC';
k(:,i) = 3.80e-13.*(T./300).^0.00.*exp(899.758./T);
Gstr{i,1} = 'xACET'; Gstr{i,2} = 'HO2';
fxACET(i)=fxACET(i)-1; fHO2(i)=fHO2(i)-1; fHO2(i)=fHO2(i)+1; fXC(i)=fXC(i)+3;

i=i+1;
Rnames{i} = 'xACET + NO3 = NO3 + ACET';
k(:,i) = 2.30e-12;
Gstr{i,1} = 'xACET'; Gstr{i,2} = 'NO3';
fxACET(i)=fxACET(i)-1; fNO3(i)=fNO3(i)-1; fNO3(i)=fNO3(i)+1; fACET(i)=fACET(i)+1;

i=i+1;
Rnames{i} = 'xACET + MEO2 = MEO2 + .5*ACET + 1.5*XC';
k(:,i) = 2.00e-13;
Gstr{i,1} = 'xACET'; Gstr{i,2} = 'MEO2';
fxACET(i)=fxACET(i)-1; fMEO2(i)=fMEO2(i)-1; fMEO2(i)=fMEO2(i)+1; fACET(i)=fACET(i)+.5; fXC(i)=fXC(i)+1.5;

i=i+1;
Rnames{i} = 'xACET + RO2C = RO2C + .5*ACET + 1.5*XC';
k(:,i) = 3.50e-14;
Gstr{i,1} = 'xACET'; Gstr{i,2} = 'RO2C';
fxACET(i)=fxACET(i)-1; fRO2C(i)=fRO2C(i)-1; fRO2C(i)=fRO2C(i)+1; fACET(i)=fACET(i)+.5; fXC(i)=fXC(i)+1.5;

i=i+1;
Rnames{i} = 'xACET + RO2XC = RO2XC + .5*ACET + 1.5*XC';
k(:,i) = 3.50e-14;
Gstr{i,1} = 'xACET'; Gstr{i,2} = 'RO2XC';
fxACET(i)=fxACET(i)-1; fRO2XC(i)=fRO2XC(i)-1; fRO2XC(i)=fRO2XC(i)+1; fACET(i)=fACET(i)+.5; fXC(i)=fXC(i)+1.5;

i=i+1;
Rnames{i} = 'xACET + MECO3 = MECO3 + ACET';
k(:,i) = 4.40e-13.*(T./300).^0.00.*exp(1069.847./T);
Gstr{i,1} = 'xACET'; Gstr{i,2} = 'MECO3';
fxACET(i)=fxACET(i)-1; fMECO3(i)=fMECO3(i)-1; fMECO3(i)=fMECO3(i)+1; fACET(i)=fACET(i)+1;

i=i+1;
Rnames{i} = 'xACET + RCO3 = RCO3 + ACET';
k(:,i) = 4.40e-13.*(T./300).^0.00.*exp(1069.847./T);
Gstr{i,1} = 'xACET'; Gstr{i,2} = 'RCO3';
fxACET(i)=fxACET(i)-1; fRCO3(i)=fRCO3(i)-1; fRCO3(i)=fRCO3(i)+1; fACET(i)=fACET(i)+1;

i=i+1;
Rnames{i} = 'xACET + BZCO3 = BZCO3 + ACET';
k(:,i) = 4.40e-13.*(T./300).^0.00.*exp(1069.847./T);
Gstr{i,1} = 'xACET'; Gstr{i,2} = 'BZCO3';
fxACET(i)=fxACET(i)-1; fBZCO3(i)=fBZCO3(i)-1; fBZCO3(i)=fBZCO3(i)+1; fACET(i)=fACET(i)+1;

i=i+1;
Rnames{i} = 'xACET + MACO3 = MACO3 + ACET';
k(:,i) = 4.40e-13.*(T./300).^0.00.*exp(1069.847./T);
Gstr{i,1} = 'xACET'; Gstr{i,2} = 'MACO3';
fxACET(i)=fxACET(i)-1; fMACO3(i)=fMACO3(i)-1; fMACO3(i)=fMACO3(i)+1; fACET(i)=fACET(i)+1;

i=i+1;
Rnames{i} = 'xMEK + NO = NO + MEK';
k(:,i) = 2.60e-12.*(T./300).^0.00.*exp(379.932./T);
Gstr{i,1} = 'xMEK'; Gstr{i,2} = 'NO';
fxMEK(i)=fxMEK(i)-1; fNO(i)=fNO(i)-1; fNO(i)=fNO(i)+1; fMEK(i)=fMEK(i)+1;

i=i+1;
Rnames{i} = 'xMEK + HO2 = HO2 + 4*XC';
k(:,i) = 3.80e-13.*(T./300).^0.00.*exp(899.758./T);
Gstr{i,1} = 'xMEK'; Gstr{i,2} = 'HO2';
fxMEK(i)=fxMEK(i)-1; fHO2(i)=fHO2(i)-1; fHO2(i)=fHO2(i)+1; fXC(i)=fXC(i)+4;

i=i+1;
Rnames{i} = 'xMEK + NO3 = NO3 + MEK';
k(:,i) = 2.30e-12;
Gstr{i,1} = 'xMEK'; Gstr{i,2} = 'NO3';
fxMEK(i)=fxMEK(i)-1; fNO3(i)=fNO3(i)-1; fNO3(i)=fNO3(i)+1; fMEK(i)=fMEK(i)+1;

i=i+1;
Rnames{i} = 'xMEK + MEO2 = MEO2 + .5*MEK + 2*XC';
k(:,i) = 2.00e-13;
Gstr{i,1} = 'xMEK'; Gstr{i,2} = 'MEO2';
fxMEK(i)=fxMEK(i)-1; fMEO2(i)=fMEO2(i)-1; fMEO2(i)=fMEO2(i)+1; fMEK(i)=fMEK(i)+.5; fXC(i)=fXC(i)+2;

i=i+1;
Rnames{i} = 'xMEK + RO2C = RO2C + .5*MEK + 2*XC';
k(:,i) = 3.50e-14;
Gstr{i,1} = 'xMEK'; Gstr{i,2} = 'RO2C';
fxMEK(i)=fxMEK(i)-1; fRO2C(i)=fRO2C(i)-1; fRO2C(i)=fRO2C(i)+1; fMEK(i)=fMEK(i)+.5; fXC(i)=fXC(i)+2;

i=i+1;
Rnames{i} = 'xMEK + RO2XC = RO2XC + .5*MEK + 2*XC';
k(:,i) = 3.50e-14;
Gstr{i,1} = 'xMEK'; Gstr{i,2} = 'RO2XC';
fxMEK(i)=fxMEK(i)-1; fRO2XC(i)=fRO2XC(i)-1; fRO2XC(i)=fRO2XC(i)+1; fMEK(i)=fMEK(i)+.5; fXC(i)=fXC(i)+2;

i=i+1;
Rnames{i} = 'xMEK + MECO3 = MECO3 + MEK';
k(:,i) = 4.40e-13.*(T./300).^0.00.*exp(1069.847./T);
Gstr{i,1} = 'xMEK'; Gstr{i,2} = 'MECO3';
fxMEK(i)=fxMEK(i)-1; fMECO3(i)=fMECO3(i)-1; fMECO3(i)=fMECO3(i)+1; fMEK(i)=fMEK(i)+1;

i=i+1;
Rnames{i} = 'xMEK + RCO3 = RCO3 + MEK';
k(:,i) = 4.40e-13.*(T./300).^0.00.*exp(1069.847./T);
Gstr{i,1} = 'xMEK'; Gstr{i,2} = 'RCO3';
fxMEK(i)=fxMEK(i)-1; fRCO3(i)=fRCO3(i)-1; fRCO3(i)=fRCO3(i)+1; fMEK(i)=fMEK(i)+1;

i=i+1;
Rnames{i} = 'xMEK + BZCO3 = BZCO3 + MEK';
k(:,i) = 4.40e-13.*(T./300).^0.00.*exp(1069.847./T);
Gstr{i,1} = 'xMEK'; Gstr{i,2} = 'BZCO3';
fxMEK(i)=fxMEK(i)-1; fBZCO3(i)=fBZCO3(i)-1; fBZCO3(i)=fBZCO3(i)+1; fMEK(i)=fMEK(i)+1;

i=i+1;
Rnames{i} = 'xMEK + MACO3 = MACO3 + MEK';
k(:,i) = 4.40e-13.*(T./300).^0.00.*exp(1069.847./T);
Gstr{i,1} = 'xMEK'; Gstr{i,2} = 'MACO3';
fxMEK(i)=fxMEK(i)-1; fMACO3(i)=fMACO3(i)-1; fMACO3(i)=fMACO3(i)+1; fMEK(i)=fMEK(i)+1;

i=i+1;
Rnames{i} = 'xPROD2 + NO = NO + PROD2';
k(:,i) = 2.60e-12.*(T./300).^0.00.*exp(379.932./T);
Gstr{i,1} = 'xPROD2'; Gstr{i,2} = 'NO';
fxPROD2(i)=fxPROD2(i)-1; fNO(i)=fNO(i)-1; fNO(i)=fNO(i)+1; fPROD2(i)=fPROD2(i)+1;

i=i+1;
Rnames{i} = 'xPROD2 + HO2 = HO2 + 6*XC';
k(:,i) = 3.80e-13.*(T./300).^0.00.*exp(899.758./T);
Gstr{i,1} = 'xPROD2'; Gstr{i,2} = 'HO2';
fxPROD2(i)=fxPROD2(i)-1; fHO2(i)=fHO2(i)-1; fHO2(i)=fHO2(i)+1; fXC(i)=fXC(i)+6;

i=i+1;
Rnames{i} = 'xPROD2 + NO3 = NO3 + PROD2';
k(:,i) = 2.30e-12;
Gstr{i,1} = 'xPROD2'; Gstr{i,2} = 'NO3';
fxPROD2(i)=fxPROD2(i)-1; fNO3(i)=fNO3(i)-1; fNO3(i)=fNO3(i)+1; fPROD2(i)=fPROD2(i)+1;

i=i+1;
Rnames{i} = 'xPROD2 + MEO2 = MEO2 + .5*PROD2 + 3*XC';
k(:,i) = 2.00e-13;
Gstr{i,1} = 'xPROD2'; Gstr{i,2} = 'MEO2';
fxPROD2(i)=fxPROD2(i)-1; fMEO2(i)=fMEO2(i)-1; fMEO2(i)=fMEO2(i)+1; fPROD2(i)=fPROD2(i)+.5; fXC(i)=fXC(i)+3;

i=i+1;
Rnames{i} = 'xPROD2 + RO2C = RO2C + .5*PROD2 + 3*XC';
k(:,i) = 3.50e-14;
Gstr{i,1} = 'xPROD2'; Gstr{i,2} = 'RO2C';
fxPROD2(i)=fxPROD2(i)-1; fRO2C(i)=fRO2C(i)-1; fRO2C(i)=fRO2C(i)+1; fPROD2(i)=fPROD2(i)+.5; fXC(i)=fXC(i)+3;

i=i+1;
Rnames{i} = 'xPROD2 + RO2XC = RO2XC + .5*PROD2 + 3*XC';
k(:,i) = 3.50e-14;
Gstr{i,1} = 'xPROD2'; Gstr{i,2} = 'RO2XC';
fxPROD2(i)=fxPROD2(i)-1; fRO2XC(i)=fRO2XC(i)-1; fRO2XC(i)=fRO2XC(i)+1; fPROD2(i)=fPROD2(i)+.5; fXC(i)=fXC(i)+3;

i=i+1;
Rnames{i} = 'xPROD2 + MECO3 = MECO3 + PROD2';
k(:,i) = 4.40e-13.*(T./300).^0.00.*exp(1069.847./T);
Gstr{i,1} = 'xPROD2'; Gstr{i,2} = 'MECO3';
fxPROD2(i)=fxPROD2(i)-1; fMECO3(i)=fMECO3(i)-1; fMECO3(i)=fMECO3(i)+1; fPROD2(i)=fPROD2(i)+1;

i=i+1;
Rnames{i} = 'xPROD2 + RCO3 = RCO3 + PROD2';
k(:,i) = 4.40e-13.*(T./300).^0.00.*exp(1069.847./T);
Gstr{i,1} = 'xPROD2'; Gstr{i,2} = 'RCO3';
fxPROD2(i)=fxPROD2(i)-1; fRCO3(i)=fRCO3(i)-1; fRCO3(i)=fRCO3(i)+1; fPROD2(i)=fPROD2(i)+1;

i=i+1;
Rnames{i} = 'xPROD2 + BZCO3 = BZCO3 + PROD2';
k(:,i) = 4.40e-13.*(T./300).^0.00.*exp(1069.847./T);
Gstr{i,1} = 'xPROD2'; Gstr{i,2} = 'BZCO3';
fxPROD2(i)=fxPROD2(i)-1; fBZCO3(i)=fBZCO3(i)-1; fBZCO3(i)=fBZCO3(i)+1; fPROD2(i)=fPROD2(i)+1;

i=i+1;
Rnames{i} = 'xPROD2 + MACO3 = MACO3 + PROD2';
k(:,i) = 4.40e-13.*(T./300).^0.00.*exp(1069.847./T);
Gstr{i,1} = 'xPROD2'; Gstr{i,2} = 'MACO3';
fxPROD2(i)=fxPROD2(i)-1; fMACO3(i)=fMACO3(i)-1; fMACO3(i)=fMACO3(i)+1; fPROD2(i)=fPROD2(i)+1;

i=i+1;
Rnames{i} = 'xGLY + NO = NO + GLY';
k(:,i) = 2.60e-12.*(T./300).^0.00.*exp(379.932./T);
Gstr{i,1} = 'xGLY'; Gstr{i,2} = 'NO';
fxGLY(i)=fxGLY(i)-1; fNO(i)=fNO(i)-1; fNO(i)=fNO(i)+1; fGLY(i)=fGLY(i)+1;

i=i+1;
Rnames{i} = 'xGLY + HO2 = HO2 + 2*XC';
k(:,i) = 3.80e-13.*(T./300).^0.00.*exp(899.758./T);
Gstr{i,1} = 'xGLY'; Gstr{i,2} = 'HO2';
fxGLY(i)=fxGLY(i)-1; fHO2(i)=fHO2(i)-1; fHO2(i)=fHO2(i)+1; fXC(i)=fXC(i)+2;

i=i+1;
Rnames{i} = 'xGLY + NO3 = NO3 + GLY';
k(:,i) = 2.30e-12;
Gstr{i,1} = 'xGLY'; Gstr{i,2} = 'NO3';
fxGLY(i)=fxGLY(i)-1; fNO3(i)=fNO3(i)-1; fNO3(i)=fNO3(i)+1; fGLY(i)=fGLY(i)+1;

i=i+1;
Rnames{i} = 'xGLY + MEO2 = MEO2 + .5*GLY + XC';
k(:,i) = 2.00e-13;
Gstr{i,1} = 'xGLY'; Gstr{i,2} = 'MEO2';
fxGLY(i)=fxGLY(i)-1; fMEO2(i)=fMEO2(i)-1; fMEO2(i)=fMEO2(i)+1; fGLY(i)=fGLY(i)+.5; fXC(i)=fXC(i)+1;

i=i+1;
Rnames{i} = 'xGLY + RO2C = RO2C + .5*GLY + XC';
k(:,i) = 3.50e-14;
Gstr{i,1} = 'xGLY'; Gstr{i,2} = 'RO2C';
fxGLY(i)=fxGLY(i)-1; fRO2C(i)=fRO2C(i)-1; fRO2C(i)=fRO2C(i)+1; fGLY(i)=fGLY(i)+.5; fXC(i)=fXC(i)+1;

i=i+1;
Rnames{i} = 'xGLY + RO2XC = RO2XC + .5*GLY + XC';
k(:,i) = 3.50e-14;
Gstr{i,1} = 'xGLY'; Gstr{i,2} = 'RO2XC';
fxGLY(i)=fxGLY(i)-1; fRO2XC(i)=fRO2XC(i)-1; fRO2XC(i)=fRO2XC(i)+1; fGLY(i)=fGLY(i)+.5; fXC(i)=fXC(i)+1;

i=i+1;
Rnames{i} = 'xGLY + MECO3 = MECO3 + GLY';
k(:,i) = 4.40e-13.*(T./300).^0.00.*exp(1069.847./T);
Gstr{i,1} = 'xGLY'; Gstr{i,2} = 'MECO3';
fxGLY(i)=fxGLY(i)-1; fMECO3(i)=fMECO3(i)-1; fMECO3(i)=fMECO3(i)+1; fGLY(i)=fGLY(i)+1;

i=i+1;
Rnames{i} = 'xGLY + RCO3 = RCO3 + GLY';
k(:,i) = 4.40e-13.*(T./300).^0.00.*exp(1069.847./T);
Gstr{i,1} = 'xGLY'; Gstr{i,2} = 'RCO3';
fxGLY(i)=fxGLY(i)-1; fRCO3(i)=fRCO3(i)-1; fRCO3(i)=fRCO3(i)+1; fGLY(i)=fGLY(i)+1;

i=i+1;
Rnames{i} = 'xGLY + BZCO3 = BZCO3 + GLY';
k(:,i) = 4.40e-13.*(T./300).^0.00.*exp(1069.847./T);
Gstr{i,1} = 'xGLY'; Gstr{i,2} = 'BZCO3';
fxGLY(i)=fxGLY(i)-1; fBZCO3(i)=fBZCO3(i)-1; fBZCO3(i)=fBZCO3(i)+1; fGLY(i)=fGLY(i)+1;

i=i+1;
Rnames{i} = 'xGLY + MACO3 = MACO3 + GLY';
k(:,i) = 4.40e-13.*(T./300).^0.00.*exp(1069.847./T);
Gstr{i,1} = 'xGLY'; Gstr{i,2} = 'MACO3';
fxGLY(i)=fxGLY(i)-1; fMACO3(i)=fMACO3(i)-1; fMACO3(i)=fMACO3(i)+1; fGLY(i)=fGLY(i)+1;

i=i+1;
Rnames{i} = 'xMGLY + NO = NO + MGLY';
k(:,i) = 2.60e-12.*(T./300).^0.00.*exp(379.932./T);
Gstr{i,1} = 'xMGLY'; Gstr{i,2} = 'NO';
fxMGLY(i)=fxMGLY(i)-1; fNO(i)=fNO(i)-1; fNO(i)=fNO(i)+1; fMGLY(i)=fMGLY(i)+1;

i=i+1;
Rnames{i} = 'xMGLY + HO2 = HO2 + 3*XC';
k(:,i) = 3.80e-13.*(T./300).^0.00.*exp(899.758./T);
Gstr{i,1} = 'xMGLY'; Gstr{i,2} = 'HO2';
fxMGLY(i)=fxMGLY(i)-1; fHO2(i)=fHO2(i)-1; fHO2(i)=fHO2(i)+1; fXC(i)=fXC(i)+3;

i=i+1;
Rnames{i} = 'xMGLY + NO3 = NO3 + MGLY';
k(:,i) = 2.30e-12;
Gstr{i,1} = 'xMGLY'; Gstr{i,2} = 'NO3';
fxMGLY(i)=fxMGLY(i)-1; fNO3(i)=fNO3(i)-1; fNO3(i)=fNO3(i)+1; fMGLY(i)=fMGLY(i)+1;

i=i+1;
Rnames{i} = 'xMGLY + MEO2 = MEO2 + .5*MGLY + 1.5*XC';
k(:,i) = 2.00e-13;
Gstr{i,1} = 'xMGLY'; Gstr{i,2} = 'MEO2';
fxMGLY(i)=fxMGLY(i)-1; fMEO2(i)=fMEO2(i)-1; fMEO2(i)=fMEO2(i)+1; fMGLY(i)=fMGLY(i)+.5; fXC(i)=fXC(i)+1.5;

i=i+1;
Rnames{i} = 'xMGLY + RO2C = RO2C + .5*MGLY + 1.5*XC';
k(:,i) = 3.50e-14;
Gstr{i,1} = 'xMGLY'; Gstr{i,2} = 'RO2C';
fxMGLY(i)=fxMGLY(i)-1; fRO2C(i)=fRO2C(i)-1; fRO2C(i)=fRO2C(i)+1; fMGLY(i)=fMGLY(i)+.5; fXC(i)=fXC(i)+1.5;

i=i+1;
Rnames{i} = 'xMGLY + RO2XC = RO2XC + .5*MGLY + 1.5*XC';
k(:,i) = 3.50e-14;
Gstr{i,1} = 'xMGLY'; Gstr{i,2} = 'RO2XC';
fxMGLY(i)=fxMGLY(i)-1; fRO2XC(i)=fRO2XC(i)-1; fRO2XC(i)=fRO2XC(i)+1; fMGLY(i)=fMGLY(i)+.5; fXC(i)=fXC(i)+1.5;

i=i+1;
Rnames{i} = 'xMGLY + MECO3 = MECO3 + MGLY';
k(:,i) = 4.40e-13.*(T./300).^0.00.*exp(1069.847./T);
Gstr{i,1} = 'xMGLY'; Gstr{i,2} = 'MECO3';
fxMGLY(i)=fxMGLY(i)-1; fMECO3(i)=fMECO3(i)-1; fMECO3(i)=fMECO3(i)+1; fMGLY(i)=fMGLY(i)+1;

i=i+1;
Rnames{i} = 'xMGLY + RCO3 = RCO3 + MGLY';
k(:,i) = 4.40e-13.*(T./300).^0.00.*exp(1069.847./T);
Gstr{i,1} = 'xMGLY'; Gstr{i,2} = 'RCO3';
fxMGLY(i)=fxMGLY(i)-1; fRCO3(i)=fRCO3(i)-1; fRCO3(i)=fRCO3(i)+1; fMGLY(i)=fMGLY(i)+1;

i=i+1;
Rnames{i} = 'xMGLY + BZCO3 = BZCO3 + MGLY';
k(:,i) = 4.40e-13.*(T./300).^0.00.*exp(1069.847./T);
Gstr{i,1} = 'xMGLY'; Gstr{i,2} = 'BZCO3';
fxMGLY(i)=fxMGLY(i)-1; fBZCO3(i)=fBZCO3(i)-1; fBZCO3(i)=fBZCO3(i)+1; fMGLY(i)=fMGLY(i)+1;

i=i+1;
Rnames{i} = 'xMGLY + MACO3 = MACO3 + MGLY';
k(:,i) = 4.40e-13.*(T./300).^0.00.*exp(1069.847./T);
Gstr{i,1} = 'xMGLY'; Gstr{i,2} = 'MACO3';
fxMGLY(i)=fxMGLY(i)-1; fMACO3(i)=fMACO3(i)-1; fMACO3(i)=fMACO3(i)+1; fMGLY(i)=fMGLY(i)+1;

i=i+1;
Rnames{i} = 'xBACL + NO = NO + BACL';
k(:,i) = 2.60e-12.*(T./300).^0.00.*exp(379.932./T);
Gstr{i,1} = 'xBACL'; Gstr{i,2} = 'NO';
fxBACL(i)=fxBACL(i)-1; fNO(i)=fNO(i)-1; fNO(i)=fNO(i)+1; fBACL(i)=fBACL(i)+1;

i=i+1;
Rnames{i} = 'xBACL + HO2 = HO2 + 4*XC';
k(:,i) = 3.80e-13.*(T./300).^0.00.*exp(899.758./T);
Gstr{i,1} = 'xBACL'; Gstr{i,2} = 'HO2';
fxBACL(i)=fxBACL(i)-1; fHO2(i)=fHO2(i)-1; fHO2(i)=fHO2(i)+1; fXC(i)=fXC(i)+4;

i=i+1;
Rnames{i} = 'xBACL + NO3 = NO3 + BACL';
k(:,i) = 2.30e-12;
Gstr{i,1} = 'xBACL'; Gstr{i,2} = 'NO3';
fxBACL(i)=fxBACL(i)-1; fNO3(i)=fNO3(i)-1; fNO3(i)=fNO3(i)+1; fBACL(i)=fBACL(i)+1;

i=i+1;
Rnames{i} = 'xBACL + MEO2 = MEO2 + .5*BACL + 2*XC';
k(:,i) = 2.00e-13;
Gstr{i,1} = 'xBACL'; Gstr{i,2} = 'MEO2';
fxBACL(i)=fxBACL(i)-1; fMEO2(i)=fMEO2(i)-1; fMEO2(i)=fMEO2(i)+1; fBACL(i)=fBACL(i)+.5; fXC(i)=fXC(i)+2;

i=i+1;
Rnames{i} = 'xBACL + RO2C = RO2C + .5*BACL + 2*XC';
k(:,i) = 3.50e-14;
Gstr{i,1} = 'xBACL'; Gstr{i,2} = 'RO2C';
fxBACL(i)=fxBACL(i)-1; fRO2C(i)=fRO2C(i)-1; fRO2C(i)=fRO2C(i)+1; fBACL(i)=fBACL(i)+.5; fXC(i)=fXC(i)+2;

i=i+1;
Rnames{i} = 'xBACL + RO2XC = RO2XC + .5*BACL + 2*XC';
k(:,i) = 3.50e-14;
Gstr{i,1} = 'xBACL'; Gstr{i,2} = 'RO2XC';
fxBACL(i)=fxBACL(i)-1; fRO2XC(i)=fRO2XC(i)-1; fRO2XC(i)=fRO2XC(i)+1; fBACL(i)=fBACL(i)+.5; fXC(i)=fXC(i)+2;

i=i+1;
Rnames{i} = 'xBACL + MECO3 = MECO3 + BACL';
k(:,i) = 4.40e-13.*(T./300).^0.00.*exp(1069.847./T);
Gstr{i,1} = 'xBACL'; Gstr{i,2} = 'MECO3';
fxBACL(i)=fxBACL(i)-1; fMECO3(i)=fMECO3(i)-1; fMECO3(i)=fMECO3(i)+1; fBACL(i)=fBACL(i)+1;

i=i+1;
Rnames{i} = 'xBACL + RCO3 = RCO3 + BACL';
k(:,i) = 4.40e-13.*(T./300).^0.00.*exp(1069.847./T);
Gstr{i,1} = 'xBACL'; Gstr{i,2} = 'RCO3';
fxBACL(i)=fxBACL(i)-1; fRCO3(i)=fRCO3(i)-1; fRCO3(i)=fRCO3(i)+1; fBACL(i)=fBACL(i)+1;

i=i+1;
Rnames{i} = 'xBACL + BZCO3 = BZCO3 + BACL';
k(:,i) = 4.40e-13.*(T./300).^0.00.*exp(1069.847./T);
Gstr{i,1} = 'xBACL'; Gstr{i,2} = 'BZCO3';
fxBACL(i)=fxBACL(i)-1; fBZCO3(i)=fBZCO3(i)-1; fBZCO3(i)=fBZCO3(i)+1; fBACL(i)=fBACL(i)+1;

i=i+1;
Rnames{i} = 'xBACL + MACO3 = MACO3 + BACL';
k(:,i) = 4.40e-13.*(T./300).^0.00.*exp(1069.847./T);
Gstr{i,1} = 'xBACL'; Gstr{i,2} = 'MACO3';
fxBACL(i)=fxBACL(i)-1; fMACO3(i)=fMACO3(i)-1; fMACO3(i)=fMACO3(i)+1; fBACL(i)=fBACL(i)+1;

i=i+1;
Rnames{i} = 'xBALD + NO = NO + BALD';
k(:,i) = 2.60e-12.*(T./300).^0.00.*exp(379.932./T);
Gstr{i,1} = 'xBALD'; Gstr{i,2} = 'NO';
fxBALD(i)=fxBALD(i)-1; fNO(i)=fNO(i)-1; fNO(i)=fNO(i)+1; fBALD(i)=fBALD(i)+1;

i=i+1;
Rnames{i} = 'xBALD + HO2 = HO2 + 7*XC';
k(:,i) = 3.80e-13.*(T./300).^0.00.*exp(899.758./T);
Gstr{i,1} = 'xBALD'; Gstr{i,2} = 'HO2';
fxBALD(i)=fxBALD(i)-1; fHO2(i)=fHO2(i)-1; fHO2(i)=fHO2(i)+1; fXC(i)=fXC(i)+7;

i=i+1;
Rnames{i} = 'xBALD + NO3 = NO3 + BALD';
k(:,i) = 2.30e-12;
Gstr{i,1} = 'xBALD'; Gstr{i,2} = 'NO3';
fxBALD(i)=fxBALD(i)-1; fNO3(i)=fNO3(i)-1; fNO3(i)=fNO3(i)+1; fBALD(i)=fBALD(i)+1;

i=i+1;
Rnames{i} = 'xBALD + MEO2 = MEO2 + .5*BALD + 3.5*XC';
k(:,i) = 2.00e-13;
Gstr{i,1} = 'xBALD'; Gstr{i,2} = 'MEO2';
fxBALD(i)=fxBALD(i)-1; fMEO2(i)=fMEO2(i)-1; fMEO2(i)=fMEO2(i)+1; fBALD(i)=fBALD(i)+.5; fXC(i)=fXC(i)+3.5;

i=i+1;
Rnames{i} = 'xBALD + RO2C = RO2C + .5*BALD + 3.5*XC';
k(:,i) = 3.50e-14;
Gstr{i,1} = 'xBALD'; Gstr{i,2} = 'RO2C';
fxBALD(i)=fxBALD(i)-1; fRO2C(i)=fRO2C(i)-1; fRO2C(i)=fRO2C(i)+1; fBALD(i)=fBALD(i)+.5; fXC(i)=fXC(i)+3.5;

i=i+1;
Rnames{i} = 'xBALD + RO2XC = RO2XC + .5*BALD + 3.5*XC';
k(:,i) = 3.50e-14;
Gstr{i,1} = 'xBALD'; Gstr{i,2} = 'RO2XC';
fxBALD(i)=fxBALD(i)-1; fRO2XC(i)=fRO2XC(i)-1; fRO2XC(i)=fRO2XC(i)+1; fBALD(i)=fBALD(i)+.5; fXC(i)=fXC(i)+3.5;

i=i+1;
Rnames{i} = 'xBALD + MECO3 = MECO3 + BALD';
k(:,i) = 4.40e-13.*(T./300).^0.00.*exp(1069.847./T);
Gstr{i,1} = 'xBALD'; Gstr{i,2} = 'MECO3';
fxBALD(i)=fxBALD(i)-1; fMECO3(i)=fMECO3(i)-1; fMECO3(i)=fMECO3(i)+1; fBALD(i)=fBALD(i)+1;

i=i+1;
Rnames{i} = 'xBALD + RCO3 = RCO3 + BALD';
k(:,i) = 4.40e-13.*(T./300).^0.00.*exp(1069.847./T);
Gstr{i,1} = 'xBALD'; Gstr{i,2} = 'RCO3';
fxBALD(i)=fxBALD(i)-1; fRCO3(i)=fRCO3(i)-1; fRCO3(i)=fRCO3(i)+1; fBALD(i)=fBALD(i)+1;

i=i+1;
Rnames{i} = 'xBALD + BZCO3 = BZCO3 + BALD';
k(:,i) = 4.40e-13.*(T./300).^0.00.*exp(1069.847./T);
Gstr{i,1} = 'xBALD'; Gstr{i,2} = 'BZCO3';
fxBALD(i)=fxBALD(i)-1; fBZCO3(i)=fBZCO3(i)-1; fBZCO3(i)=fBZCO3(i)+1; fBALD(i)=fBALD(i)+1;

i=i+1;
Rnames{i} = 'xBALD + MACO3 = MACO3 + BALD';
k(:,i) = 4.40e-13.*(T./300).^0.00.*exp(1069.847./T);
Gstr{i,1} = 'xBALD'; Gstr{i,2} = 'MACO3';
fxBALD(i)=fxBALD(i)-1; fMACO3(i)=fMACO3(i)-1; fMACO3(i)=fMACO3(i)+1; fBALD(i)=fBALD(i)+1;

i=i+1;
Rnames{i} = 'xAFG1 + NO = NO + AFG1';
k(:,i) = 2.60e-12.*(T./300).^0.00.*exp(379.932./T);
Gstr{i,1} = 'xAFG1'; Gstr{i,2} = 'NO';
fxAFG1(i)=fxAFG1(i)-1; fNO(i)=fNO(i)-1; fNO(i)=fNO(i)+1; fAFG1(i)=fAFG1(i)+1;

i=i+1;
Rnames{i} = 'xAFG1 + HO2 = HO2 + 5*XC';
k(:,i) = 3.80e-13.*(T./300).^0.00.*exp(899.758./T);
Gstr{i,1} = 'xAFG1'; Gstr{i,2} = 'HO2';
fxAFG1(i)=fxAFG1(i)-1; fHO2(i)=fHO2(i)-1; fHO2(i)=fHO2(i)+1; fXC(i)=fXC(i)+5;

i=i+1;
Rnames{i} = 'xAFG1 + NO3 = NO3 + AFG1';
k(:,i) = 2.30e-12;
Gstr{i,1} = 'xAFG1'; Gstr{i,2} = 'NO3';
fxAFG1(i)=fxAFG1(i)-1; fNO3(i)=fNO3(i)-1; fNO3(i)=fNO3(i)+1; fAFG1(i)=fAFG1(i)+1;

i=i+1;
Rnames{i} = 'xAFG1 + MEO2 = MEO2 + .5*AFG1 + 2.5*XC';
k(:,i) = 2.00e-13;
Gstr{i,1} = 'xAFG1'; Gstr{i,2} = 'MEO2';
fxAFG1(i)=fxAFG1(i)-1; fMEO2(i)=fMEO2(i)-1; fMEO2(i)=fMEO2(i)+1; fAFG1(i)=fAFG1(i)+.5; fXC(i)=fXC(i)+2.5;

i=i+1;
Rnames{i} = 'xAFG1 + RO2C = RO2C + .5*AFG1 + 2.5*XC';
k(:,i) = 3.50e-14;
Gstr{i,1} = 'xAFG1'; Gstr{i,2} = 'RO2C';
fxAFG1(i)=fxAFG1(i)-1; fRO2C(i)=fRO2C(i)-1; fRO2C(i)=fRO2C(i)+1; fAFG1(i)=fAFG1(i)+.5; fXC(i)=fXC(i)+2.5;

i=i+1;
Rnames{i} = 'xAFG1 + RO2XC = RO2XC + .5*AFG1 + 2.5*XC';
k(:,i) = 3.50e-14;
Gstr{i,1} = 'xAFG1'; Gstr{i,2} = 'RO2XC';
fxAFG1(i)=fxAFG1(i)-1; fRO2XC(i)=fRO2XC(i)-1; fRO2XC(i)=fRO2XC(i)+1; fAFG1(i)=fAFG1(i)+.5; fXC(i)=fXC(i)+2.5;

i=i+1;
Rnames{i} = 'xAFG1 + MECO3 = MECO3 + AFG1';
k(:,i) = 4.40e-13.*(T./300).^0.00.*exp(1069.847./T);
Gstr{i,1} = 'xAFG1'; Gstr{i,2} = 'MECO3';
fxAFG1(i)=fxAFG1(i)-1; fMECO3(i)=fMECO3(i)-1; fMECO3(i)=fMECO3(i)+1; fAFG1(i)=fAFG1(i)+1;

i=i+1;
Rnames{i} = 'xAFG1 + RCO3 = RCO3 + AFG1';
k(:,i) = 4.40e-13.*(T./300).^0.00.*exp(1069.847./T);
Gstr{i,1} = 'xAFG1'; Gstr{i,2} = 'RCO3';
fxAFG1(i)=fxAFG1(i)-1; fRCO3(i)=fRCO3(i)-1; fRCO3(i)=fRCO3(i)+1; fAFG1(i)=fAFG1(i)+1;

i=i+1;
Rnames{i} = 'xAFG1 + BZCO3 = BZCO3 + AFG1';
k(:,i) = 4.40e-13.*(T./300).^0.00.*exp(1069.847./T);
Gstr{i,1} = 'xAFG1'; Gstr{i,2} = 'BZCO3';
fxAFG1(i)=fxAFG1(i)-1; fBZCO3(i)=fBZCO3(i)-1; fBZCO3(i)=fBZCO3(i)+1; fAFG1(i)=fAFG1(i)+1;

i=i+1;
Rnames{i} = 'xAFG1 + MACO3 = MACO3 + AFG1';
k(:,i) = 4.40e-13.*(T./300).^0.00.*exp(1069.847./T);
Gstr{i,1} = 'xAFG1'; Gstr{i,2} = 'MACO3';
fxAFG1(i)=fxAFG1(i)-1; fMACO3(i)=fMACO3(i)-1; fMACO3(i)=fMACO3(i)+1; fAFG1(i)=fAFG1(i)+1;

i=i+1;
Rnames{i} = 'xAFG2 + NO = NO + AFG2';
k(:,i) = 2.60e-12.*(T./300).^0.00.*exp(379.932./T);
Gstr{i,1} = 'xAFG2'; Gstr{i,2} = 'NO';
fxAFG2(i)=fxAFG2(i)-1; fNO(i)=fNO(i)-1; fNO(i)=fNO(i)+1; fAFG2(i)=fAFG2(i)+1;

i=i+1;
Rnames{i} = 'xAFG2 + HO2 = HO2 + 5*XC';
k(:,i) = 3.80e-13.*(T./300).^0.00.*exp(899.758./T);
Gstr{i,1} = 'xAFG2'; Gstr{i,2} = 'HO2';
fxAFG2(i)=fxAFG2(i)-1; fHO2(i)=fHO2(i)-1; fHO2(i)=fHO2(i)+1; fXC(i)=fXC(i)+5;

i=i+1;
Rnames{i} = 'xAFG2 + NO3 = NO3 + AFG2';
k(:,i) = 2.30e-12;
Gstr{i,1} = 'xAFG2'; Gstr{i,2} = 'NO3';
fxAFG2(i)=fxAFG2(i)-1; fNO3(i)=fNO3(i)-1; fNO3(i)=fNO3(i)+1; fAFG2(i)=fAFG2(i)+1;

i=i+1;
Rnames{i} = 'xAFG2 + MEO2 = MEO2 + .5*AFG2 + 2.5*XC';
k(:,i) = 2.00e-13;
Gstr{i,1} = 'xAFG2'; Gstr{i,2} = 'MEO2';
fxAFG2(i)=fxAFG2(i)-1; fMEO2(i)=fMEO2(i)-1; fMEO2(i)=fMEO2(i)+1; fAFG2(i)=fAFG2(i)+.5; fXC(i)=fXC(i)+2.5;

i=i+1;
Rnames{i} = 'xAFG2 + RO2C = RO2C + .5*AFG2 + 2.5*XC';
k(:,i) = 3.50e-14;
Gstr{i,1} = 'xAFG2'; Gstr{i,2} = 'RO2C';
fxAFG2(i)=fxAFG2(i)-1; fRO2C(i)=fRO2C(i)-1; fRO2C(i)=fRO2C(i)+1; fAFG2(i)=fAFG2(i)+.5; fXC(i)=fXC(i)+2.5;

i=i+1;
Rnames{i} = 'xAFG2 + RO2XC = RO2XC + .5*AFG2 + 2.5*XC';
k(:,i) = 3.50e-14;
Gstr{i,1} = 'xAFG2'; Gstr{i,2} = 'RO2XC';
fxAFG2(i)=fxAFG2(i)-1; fRO2XC(i)=fRO2XC(i)-1; fRO2XC(i)=fRO2XC(i)+1; fAFG2(i)=fAFG2(i)+.5; fXC(i)=fXC(i)+2.5;

i=i+1;
Rnames{i} = 'xAFG2 + MECO3 = MECO3 + AFG2';
k(:,i) = 4.40e-13.*(T./300).^0.00.*exp(1069.847./T);
Gstr{i,1} = 'xAFG2'; Gstr{i,2} = 'MECO3';
fxAFG2(i)=fxAFG2(i)-1; fMECO3(i)=fMECO3(i)-1; fMECO3(i)=fMECO3(i)+1; fAFG2(i)=fAFG2(i)+1;

i=i+1;
Rnames{i} = 'xAFG2 + RCO3 = RCO3 + AFG2';
k(:,i) = 4.40e-13.*(T./300).^0.00.*exp(1069.847./T);
Gstr{i,1} = 'xAFG2'; Gstr{i,2} = 'RCO3';
fxAFG2(i)=fxAFG2(i)-1; fRCO3(i)=fRCO3(i)-1; fRCO3(i)=fRCO3(i)+1; fAFG2(i)=fAFG2(i)+1;

i=i+1;
Rnames{i} = 'xAFG2 + BZCO3 = BZCO3 + AFG2';
k(:,i) = 4.40e-13.*(T./300).^0.00.*exp(1069.847./T);
Gstr{i,1} = 'xAFG2'; Gstr{i,2} = 'BZCO3';
fxAFG2(i)=fxAFG2(i)-1; fBZCO3(i)=fBZCO3(i)-1; fBZCO3(i)=fBZCO3(i)+1; fAFG2(i)=fAFG2(i)+1;

i=i+1;
Rnames{i} = 'xAFG2 + MACO3 = MACO3 + AFG2';
k(:,i) = 4.40e-13.*(T./300).^0.00.*exp(1069.847./T);
Gstr{i,1} = 'xAFG2'; Gstr{i,2} = 'MACO3';
fxAFG2(i)=fxAFG2(i)-1; fMACO3(i)=fMACO3(i)-1; fMACO3(i)=fMACO3(i)+1; fAFG2(i)=fAFG2(i)+1;

i=i+1;
Rnames{i} = 'xAFG3 + NO = NO + AFG3';
k(:,i) = 2.60e-12.*(T./300).^0.00.*exp(379.932./T);
Gstr{i,1} = 'xAFG3'; Gstr{i,2} = 'NO';
fxAFG3(i)=fxAFG3(i)-1; fNO(i)=fNO(i)-1; fNO(i)=fNO(i)+1; fAFG3(i)=fAFG3(i)+1;

i=i+1;
Rnames{i} = 'xAFG3 + HO2 = HO2 + 7*XC';
k(:,i) = 3.80e-13.*(T./300).^0.00.*exp(899.758./T);
Gstr{i,1} = 'xAFG3'; Gstr{i,2} = 'HO2';
fxAFG3(i)=fxAFG3(i)-1; fHO2(i)=fHO2(i)-1; fHO2(i)=fHO2(i)+1; fXC(i)=fXC(i)+7;

i=i+1;
Rnames{i} = 'xAFG3 + NO3 = NO3 + AFG3';
k(:,i) = 2.30e-12;
Gstr{i,1} = 'xAFG3'; Gstr{i,2} = 'NO3';
fxAFG3(i)=fxAFG3(i)-1; fNO3(i)=fNO3(i)-1; fNO3(i)=fNO3(i)+1; fAFG3(i)=fAFG3(i)+1;

i=i+1;
Rnames{i} = 'xAFG3 + MEO2 = MEO2 + .5*AFG3 + 3.5*XC';
k(:,i) = 2.00e-13;
Gstr{i,1} = 'xAFG3'; Gstr{i,2} = 'MEO2';
fxAFG3(i)=fxAFG3(i)-1; fMEO2(i)=fMEO2(i)-1; fMEO2(i)=fMEO2(i)+1; fAFG3(i)=fAFG3(i)+.5; fXC(i)=fXC(i)+3.5;

i=i+1;
Rnames{i} = 'xAFG3 + RO2C = RO2C + .5*AFG3 + 3.5*XC';
k(:,i) = 3.50e-14;
Gstr{i,1} = 'xAFG3'; Gstr{i,2} = 'RO2C';
fxAFG3(i)=fxAFG3(i)-1; fRO2C(i)=fRO2C(i)-1; fRO2C(i)=fRO2C(i)+1; fAFG3(i)=fAFG3(i)+.5; fXC(i)=fXC(i)+3.5;

i=i+1;
Rnames{i} = 'xAFG3 + RO2XC = RO2XC + .5*AFG3 + 3.5*XC';
k(:,i) = 3.50e-14;
Gstr{i,1} = 'xAFG3'; Gstr{i,2} = 'RO2XC';
fxAFG3(i)=fxAFG3(i)-1; fRO2XC(i)=fRO2XC(i)-1; fRO2XC(i)=fRO2XC(i)+1; fAFG3(i)=fAFG3(i)+.5; fXC(i)=fXC(i)+3.5;

i=i+1;
Rnames{i} = 'xAFG3 + MECO3 = MECO3 + AFG3';
k(:,i) = 4.40e-13.*(T./300).^0.00.*exp(1069.847./T);
Gstr{i,1} = 'xAFG3'; Gstr{i,2} = 'MECO3';
fxAFG3(i)=fxAFG3(i)-1; fMECO3(i)=fMECO3(i)-1; fMECO3(i)=fMECO3(i)+1; fAFG3(i)=fAFG3(i)+1;

i=i+1;
Rnames{i} = 'xAFG3 + RCO3 = RCO3 + AFG3';
k(:,i) = 4.40e-13.*(T./300).^0.00.*exp(1069.847./T);
Gstr{i,1} = 'xAFG3'; Gstr{i,2} = 'RCO3';
fxAFG3(i)=fxAFG3(i)-1; fRCO3(i)=fRCO3(i)-1; fRCO3(i)=fRCO3(i)+1; fAFG3(i)=fAFG3(i)+1;

i=i+1;
Rnames{i} = 'xAFG3 + BZCO3 = BZCO3 + AFG3';
k(:,i) = 4.40e-13.*(T./300).^0.00.*exp(1069.847./T);
Gstr{i,1} = 'xAFG3'; Gstr{i,2} = 'BZCO3';
fxAFG3(i)=fxAFG3(i)-1; fBZCO3(i)=fBZCO3(i)-1; fBZCO3(i)=fBZCO3(i)+1; fAFG3(i)=fAFG3(i)+1;

i=i+1;
Rnames{i} = 'xAFG3 + MACO3 = MACO3 + AFG3';
k(:,i) = 4.40e-13.*(T./300).^0.00.*exp(1069.847./T);
Gstr{i,1} = 'xAFG3'; Gstr{i,2} = 'MACO3';
fxAFG3(i)=fxAFG3(i)-1; fMACO3(i)=fMACO3(i)-1; fMACO3(i)=fMACO3(i)+1; fAFG3(i)=fAFG3(i)+1;

i=i+1;
Rnames{i} = 'xMACR + NO = NO + MACR';
k(:,i) = 2.60e-12.*(T./300).^0.00.*exp(379.932./T);
Gstr{i,1} = 'xMACR'; Gstr{i,2} = 'NO';
fxMACR(i)=fxMACR(i)-1; fNO(i)=fNO(i)-1; fNO(i)=fNO(i)+1; fMACR(i)=fMACR(i)+1;

i=i+1;
Rnames{i} = 'xMACR + HO2 = HO2 + 4*XC';
k(:,i) = 3.80e-13.*(T./300).^0.00.*exp(899.758./T);
Gstr{i,1} = 'xMACR'; Gstr{i,2} = 'HO2';
fxMACR(i)=fxMACR(i)-1; fHO2(i)=fHO2(i)-1; fHO2(i)=fHO2(i)+1; fXC(i)=fXC(i)+4;

i=i+1;
Rnames{i} = 'xMACR + NO3 = NO3 + MACR';
k(:,i) = 2.30e-12;
Gstr{i,1} = 'xMACR'; Gstr{i,2} = 'NO3';
fxMACR(i)=fxMACR(i)-1; fNO3(i)=fNO3(i)-1; fNO3(i)=fNO3(i)+1; fMACR(i)=fMACR(i)+1;

i=i+1;
Rnames{i} = 'xMACR + MEO2 = MEO2 + .5*MACR + 2*XC';
k(:,i) = 2.00e-13;
Gstr{i,1} = 'xMACR'; Gstr{i,2} = 'MEO2';
fxMACR(i)=fxMACR(i)-1; fMEO2(i)=fMEO2(i)-1; fMEO2(i)=fMEO2(i)+1; fMACR(i)=fMACR(i)+.5; fXC(i)=fXC(i)+2;

i=i+1;
Rnames{i} = 'xMACR + RO2C = RO2C + .5*MACR + 2*XC';
k(:,i) = 3.50e-14;
Gstr{i,1} = 'xMACR'; Gstr{i,2} = 'RO2C';
fxMACR(i)=fxMACR(i)-1; fRO2C(i)=fRO2C(i)-1; fRO2C(i)=fRO2C(i)+1; fMACR(i)=fMACR(i)+.5; fXC(i)=fXC(i)+2;

i=i+1;
Rnames{i} = 'xMACR + RO2XC = RO2XC + .5*MACR + 2*XC';
k(:,i) = 3.50e-14;
Gstr{i,1} = 'xMACR'; Gstr{i,2} = 'RO2XC';
fxMACR(i)=fxMACR(i)-1; fRO2XC(i)=fRO2XC(i)-1; fRO2XC(i)=fRO2XC(i)+1; fMACR(i)=fMACR(i)+.5; fXC(i)=fXC(i)+2;

i=i+1;
Rnames{i} = 'xMACR + MECO3 = MECO3 + MACR';
k(:,i) = 4.40e-13.*(T./300).^0.00.*exp(1069.847./T);
Gstr{i,1} = 'xMACR'; Gstr{i,2} = 'MECO3';
fxMACR(i)=fxMACR(i)-1; fMECO3(i)=fMECO3(i)-1; fMECO3(i)=fMECO3(i)+1; fMACR(i)=fMACR(i)+1;

i=i+1;
Rnames{i} = 'xMACR + RCO3 = RCO3 + MACR';
k(:,i) = 4.40e-13.*(T./300).^0.00.*exp(1069.847./T);
Gstr{i,1} = 'xMACR'; Gstr{i,2} = 'RCO3';
fxMACR(i)=fxMACR(i)-1; fRCO3(i)=fRCO3(i)-1; fRCO3(i)=fRCO3(i)+1; fMACR(i)=fMACR(i)+1;

i=i+1;
Rnames{i} = 'xMACR + BZCO3 = BZCO3 + MACR';
k(:,i) = 4.40e-13.*(T./300).^0.00.*exp(1069.847./T);
Gstr{i,1} = 'xMACR'; Gstr{i,2} = 'BZCO3';
fxMACR(i)=fxMACR(i)-1; fBZCO3(i)=fBZCO3(i)-1; fBZCO3(i)=fBZCO3(i)+1; fMACR(i)=fMACR(i)+1;

i=i+1;
Rnames{i} = 'xMACR + MACO3 = MACO3 + MACR';
k(:,i) = 4.40e-13.*(T./300).^0.00.*exp(1069.847./T);
Gstr{i,1} = 'xMACR'; Gstr{i,2} = 'MACO3';
fxMACR(i)=fxMACR(i)-1; fMACO3(i)=fMACO3(i)-1; fMACO3(i)=fMACO3(i)+1; fMACR(i)=fMACR(i)+1;

i=i+1;
Rnames{i} = 'xMVK + NO = NO + MVK';
k(:,i) = 2.60e-12.*(T./300).^0.00.*exp(379.932./T);
Gstr{i,1} = 'xMVK'; Gstr{i,2} = 'NO';
fxMVK(i)=fxMVK(i)-1; fNO(i)=fNO(i)-1; fNO(i)=fNO(i)+1; fMVK(i)=fMVK(i)+1;

i=i+1;
Rnames{i} = 'xMVK + HO2 = HO2 + 4*XC';
k(:,i) = 3.80e-13.*(T./300).^0.00.*exp(899.758./T);
Gstr{i,1} = 'xMVK'; Gstr{i,2} = 'HO2';
fxMVK(i)=fxMVK(i)-1; fHO2(i)=fHO2(i)-1; fHO2(i)=fHO2(i)+1; fXC(i)=fXC(i)+4;

i=i+1;
Rnames{i} = 'xMVK + NO3 = NO3 + MVK';
k(:,i) = 2.30e-12;
Gstr{i,1} = 'xMVK'; Gstr{i,2} = 'NO3';
fxMVK(i)=fxMVK(i)-1; fNO3(i)=fNO3(i)-1; fNO3(i)=fNO3(i)+1; fMVK(i)=fMVK(i)+1;

i=i+1;
Rnames{i} = 'xMVK + MEO2 = MEO2 + .5*MVK + 2*XC';
k(:,i) = 2.00e-13;
Gstr{i,1} = 'xMVK'; Gstr{i,2} = 'MEO2';
fxMVK(i)=fxMVK(i)-1; fMEO2(i)=fMEO2(i)-1; fMEO2(i)=fMEO2(i)+1; fMVK(i)=fMVK(i)+.5; fXC(i)=fXC(i)+2;

i=i+1;
Rnames{i} = 'xMVK + RO2C = RO2C + .5*MVK + 2*XC';
k(:,i) = 3.50e-14;
Gstr{i,1} = 'xMVK'; Gstr{i,2} = 'RO2C';
fxMVK(i)=fxMVK(i)-1; fRO2C(i)=fRO2C(i)-1; fRO2C(i)=fRO2C(i)+1; fMVK(i)=fMVK(i)+.5; fXC(i)=fXC(i)+2;

i=i+1;
Rnames{i} = 'xMVK + RO2XC = RO2XC + .5*MVK + 2*XC';
k(:,i) = 3.50e-14;
Gstr{i,1} = 'xMVK'; Gstr{i,2} = 'RO2XC';
fxMVK(i)=fxMVK(i)-1; fRO2XC(i)=fRO2XC(i)-1; fRO2XC(i)=fRO2XC(i)+1; fMVK(i)=fMVK(i)+.5; fXC(i)=fXC(i)+2;

i=i+1;
Rnames{i} = 'xMVK + MECO3 = MECO3 + MVK';
k(:,i) = 4.40e-13.*(T./300).^0.00.*exp(1069.847./T);
Gstr{i,1} = 'xMVK'; Gstr{i,2} = 'MECO3';
fxMVK(i)=fxMVK(i)-1; fMECO3(i)=fMECO3(i)-1; fMECO3(i)=fMECO3(i)+1; fMVK(i)=fMVK(i)+1;

i=i+1;
Rnames{i} = 'xMVK + RCO3 = RCO3 + MVK';
k(:,i) = 4.40e-13.*(T./300).^0.00.*exp(1069.847./T);
Gstr{i,1} = 'xMVK'; Gstr{i,2} = 'RCO3';
fxMVK(i)=fxMVK(i)-1; fRCO3(i)=fRCO3(i)-1; fRCO3(i)=fRCO3(i)+1; fMVK(i)=fMVK(i)+1;

i=i+1;
Rnames{i} = 'xMVK + BZCO3 = BZCO3 + MVK';
k(:,i) = 4.40e-13.*(T./300).^0.00.*exp(1069.847./T);
Gstr{i,1} = 'xMVK'; Gstr{i,2} = 'BZCO3';
fxMVK(i)=fxMVK(i)-1; fBZCO3(i)=fBZCO3(i)-1; fBZCO3(i)=fBZCO3(i)+1; fMVK(i)=fMVK(i)+1;

i=i+1;
Rnames{i} = 'xMVK + MACO3 = MACO3 + MVK';
k(:,i) = 4.40e-13.*(T./300).^0.00.*exp(1069.847./T);
Gstr{i,1} = 'xMVK'; Gstr{i,2} = 'MACO3';
fxMVK(i)=fxMVK(i)-1; fMACO3(i)=fMACO3(i)-1; fMACO3(i)=fMACO3(i)+1; fMVK(i)=fMVK(i)+1;

i=i+1;
Rnames{i} = 'xIPRD + NO = NO + IPRD';
k(:,i) = 2.60e-12.*(T./300).^0.00.*exp(379.932./T);
Gstr{i,1} = 'xIPRD'; Gstr{i,2} = 'NO';
fxIPRD(i)=fxIPRD(i)-1; fNO(i)=fNO(i)-1; fNO(i)=fNO(i)+1; fIPRD(i)=fIPRD(i)+1;

i=i+1;
Rnames{i} = 'xIPRD + HO2 = HO2 + 5*XC';
k(:,i) = 3.80e-13.*(T./300).^0.00.*exp(899.758./T);
Gstr{i,1} = 'xIPRD'; Gstr{i,2} = 'HO2';
fxIPRD(i)=fxIPRD(i)-1; fHO2(i)=fHO2(i)-1; fHO2(i)=fHO2(i)+1; fXC(i)=fXC(i)+5;

i=i+1;
Rnames{i} = 'xIPRD + NO3 = NO3 + IPRD';
k(:,i) = 2.30e-12;
Gstr{i,1} = 'xIPRD'; Gstr{i,2} = 'NO3';
fxIPRD(i)=fxIPRD(i)-1; fNO3(i)=fNO3(i)-1; fNO3(i)=fNO3(i)+1; fIPRD(i)=fIPRD(i)+1;

i=i+1;
Rnames{i} = 'xIPRD + MEO2 = MEO2 + .5*IPRD + 2.5*XC';
k(:,i) = 2.00e-13;
Gstr{i,1} = 'xIPRD'; Gstr{i,2} = 'MEO2';
fxIPRD(i)=fxIPRD(i)-1; fMEO2(i)=fMEO2(i)-1; fMEO2(i)=fMEO2(i)+1; fIPRD(i)=fIPRD(i)+.5; fXC(i)=fXC(i)+2.5;

i=i+1;
Rnames{i} = 'xIPRD + RO2C = RO2C + .5*IPRD + 2.5*XC';
k(:,i) = 3.50e-14;
Gstr{i,1} = 'xIPRD'; Gstr{i,2} = 'RO2C';
fxIPRD(i)=fxIPRD(i)-1; fRO2C(i)=fRO2C(i)-1; fRO2C(i)=fRO2C(i)+1; fIPRD(i)=fIPRD(i)+.5; fXC(i)=fXC(i)+2.5;

i=i+1;
Rnames{i} = 'xIPRD + RO2XC = RO2XC + .5*IPRD + 2.5*XC';
k(:,i) = 3.50e-14;
Gstr{i,1} = 'xIPRD'; Gstr{i,2} = 'RO2XC';
fxIPRD(i)=fxIPRD(i)-1; fRO2XC(i)=fRO2XC(i)-1; fRO2XC(i)=fRO2XC(i)+1; fIPRD(i)=fIPRD(i)+.5; fXC(i)=fXC(i)+2.5;

i=i+1;
Rnames{i} = 'xIPRD + MECO3 = MECO3 + IPRD';
k(:,i) = 4.40e-13.*(T./300).^0.00.*exp(1069.847./T);
Gstr{i,1} = 'xIPRD'; Gstr{i,2} = 'MECO3';
fxIPRD(i)=fxIPRD(i)-1; fMECO3(i)=fMECO3(i)-1; fMECO3(i)=fMECO3(i)+1; fIPRD(i)=fIPRD(i)+1;

i=i+1;
Rnames{i} = 'xIPRD + RCO3 = RCO3 + IPRD';
k(:,i) = 4.40e-13.*(T./300).^0.00.*exp(1069.847./T);
Gstr{i,1} = 'xIPRD'; Gstr{i,2} = 'RCO3';
fxIPRD(i)=fxIPRD(i)-1; fRCO3(i)=fRCO3(i)-1; fRCO3(i)=fRCO3(i)+1; fIPRD(i)=fIPRD(i)+1;

i=i+1;
Rnames{i} = 'xIPRD + BZCO3 = BZCO3 + IPRD';
k(:,i) = 4.40e-13.*(T./300).^0.00.*exp(1069.847./T);
Gstr{i,1} = 'xIPRD'; Gstr{i,2} = 'BZCO3';
fxIPRD(i)=fxIPRD(i)-1; fBZCO3(i)=fBZCO3(i)-1; fBZCO3(i)=fBZCO3(i)+1; fIPRD(i)=fIPRD(i)+1;

i=i+1;
Rnames{i} = 'xIPRD + MACO3 = MACO3 + IPRD';
k(:,i) = 4.40e-13.*(T./300).^0.00.*exp(1069.847./T);
Gstr{i,1} = 'xIPRD'; Gstr{i,2} = 'MACO3';
fxIPRD(i)=fxIPRD(i)-1; fMACO3(i)=fMACO3(i)-1; fMACO3(i)=fMACO3(i)+1; fIPRD(i)=fIPRD(i)+1;

i=i+1;
Rnames{i} = 'xRNO3 + NO = NO + RNO3';
k(:,i) = 2.60e-12.*(T./300).^0.00.*exp(379.932./T);
Gstr{i,1} = 'xRNO3'; Gstr{i,2} = 'NO';
fxRNO3(i)=fxRNO3(i)-1; fNO(i)=fNO(i)-1; fNO(i)=fNO(i)+1; fRNO3(i)=fRNO3(i)+1;

i=i+1;
Rnames{i} = 'xRNO3 + HO2 = HO2 + 6*XC + XN';
k(:,i) = 3.80e-13.*(T./300).^0.00.*exp(899.758./T);
Gstr{i,1} = 'xRNO3'; Gstr{i,2} = 'HO2';
fxRNO3(i)=fxRNO3(i)-1; fHO2(i)=fHO2(i)-1; fHO2(i)=fHO2(i)+1; fXC(i)=fXC(i)+6; fXN(i)=fXN(i)+1;

i=i+1;
Rnames{i} = 'xRNO3 + NO3 = NO3 + RNO3';
k(:,i) = 2.30e-12;
Gstr{i,1} = 'xRNO3'; Gstr{i,2} = 'NO3';
fxRNO3(i)=fxRNO3(i)-1; fNO3(i)=fNO3(i)-1; fNO3(i)=fNO3(i)+1; fRNO3(i)=fRNO3(i)+1;

i=i+1;
Rnames{i} = 'xRNO3 + MEO2 = MEO2 + .5*RNO3 + .5*XN + 3*XC';
k(:,i) = 2.00e-13;
Gstr{i,1} = 'xRNO3'; Gstr{i,2} = 'MEO2';
fxRNO3(i)=fxRNO3(i)-1; fMEO2(i)=fMEO2(i)-1; fMEO2(i)=fMEO2(i)+1; fRNO3(i)=fRNO3(i)+.5; fXN(i)=fXN(i)+.5; fXC(i)=fXC(i)+3;

i=i+1;
Rnames{i} = 'xRNO3 + RO2C = RO2C + .5*RNO3 + .5*XN + 3*XC';
k(:,i) = 3.50e-14;
Gstr{i,1} = 'xRNO3'; Gstr{i,2} = 'RO2C';
fxRNO3(i)=fxRNO3(i)-1; fRO2C(i)=fRO2C(i)-1; fRO2C(i)=fRO2C(i)+1; fRNO3(i)=fRNO3(i)+.5; fXN(i)=fXN(i)+.5; fXC(i)=fXC(i)+3;

i=i+1;
Rnames{i} = 'xRNO3 + RO2XC = RO2XC + .5*RNO3 + .5*XN + 3*XC';
k(:,i) = 3.50e-14;
Gstr{i,1} = 'xRNO3'; Gstr{i,2} = 'RO2XC';
fxRNO3(i)=fxRNO3(i)-1; fRO2XC(i)=fRO2XC(i)-1; fRO2XC(i)=fRO2XC(i)+1; fRNO3(i)=fRNO3(i)+.5; fXN(i)=fXN(i)+.5; fXC(i)=fXC(i)+3;

i=i+1;
Rnames{i} = 'xRNO3 + MECO3 = MECO3 + RNO3';
k(:,i) = 4.40e-13.*(T./300).^0.00.*exp(1069.847./T);
Gstr{i,1} = 'xRNO3'; Gstr{i,2} = 'MECO3';
fxRNO3(i)=fxRNO3(i)-1; fMECO3(i)=fMECO3(i)-1; fMECO3(i)=fMECO3(i)+1; fRNO3(i)=fRNO3(i)+1;

i=i+1;
Rnames{i} = 'xRNO3 + RCO3 = RCO3 + RNO3';
k(:,i) = 4.40e-13.*(T./300).^0.00.*exp(1069.847./T);
Gstr{i,1} = 'xRNO3'; Gstr{i,2} = 'RCO3';
fxRNO3(i)=fxRNO3(i)-1; fRCO3(i)=fRCO3(i)-1; fRCO3(i)=fRCO3(i)+1; fRNO3(i)=fRNO3(i)+1;

i=i+1;
Rnames{i} = 'xRNO3 + BZCO3 = BZCO3 + RNO3';
k(:,i) = 4.40e-13.*(T./300).^0.00.*exp(1069.847./T);
Gstr{i,1} = 'xRNO3'; Gstr{i,2} = 'BZCO3';
fxRNO3(i)=fxRNO3(i)-1; fBZCO3(i)=fBZCO3(i)-1; fBZCO3(i)=fBZCO3(i)+1; fRNO3(i)=fRNO3(i)+1;

i=i+1;
Rnames{i} = 'xRNO3 + MACO3 = MACO3 + RNO3';
k(:,i) = 4.40e-13.*(T./300).^0.00.*exp(1069.847./T);
Gstr{i,1} = 'xRNO3'; Gstr{i,2} = 'MACO3';
fxRNO3(i)=fxRNO3(i)-1; fMACO3(i)=fMACO3(i)-1; fMACO3(i)=fMACO3(i)+1; fRNO3(i)=fRNO3(i)+1;

i=i+1;
Rnames{i} = 'yROOH + NO = NO';
k(:,i) = 2.60e-12.*(T./300).^0.00.*exp(379.932./T);
Gstr{i,1} = 'yROOH'; Gstr{i,2} = 'NO';
fyROOH(i)=fyROOH(i)-1; fNO(i)=fNO(i)-1; fNO(i)=fNO(i)+1;

i=i+1;
Rnames{i} = 'yROOH + HO2 = HO2 + ROOH - 3*XC';
k(:,i) = 3.80e-13.*(T./300).^0.00.*exp(899.758./T);
Gstr{i,1} = 'yROOH'; Gstr{i,2} = 'HO2';
fyROOH(i)=fyROOH(i)-1; fHO2(i)=fHO2(i)-1; fHO2(i)=fHO2(i)+1; fROOH(i)=fROOH(i)+1; fXC(i)=fXC(i)-3;

i=i+1;
Rnames{i} = 'yROOH + NO3 = NO3';
k(:,i) = 2.30e-12;
Gstr{i,1} = 'yROOH'; Gstr{i,2} = 'NO3';
fyROOH(i)=fyROOH(i)-1; fNO3(i)=fNO3(i)-1; fNO3(i)=fNO3(i)+1;

i=i+1;
Rnames{i} = 'yROOH + MEO2 = MEO2 + .5*MEK - 2*XC';
k(:,i) = 2.00e-13;
Gstr{i,1} = 'yROOH'; Gstr{i,2} = 'MEO2';
fyROOH(i)=fyROOH(i)-1; fMEO2(i)=fMEO2(i)-1; fMEO2(i)=fMEO2(i)+1; fMEK(i)=fMEK(i)+.5; fXC(i)=fXC(i)-2;

i=i+1;
Rnames{i} = 'yROOH + RO2C = RO2C + .5*MEK - 2*XC';
k(:,i) = 3.50e-14;
Gstr{i,1} = 'yROOH'; Gstr{i,2} = 'RO2C';
fyROOH(i)=fyROOH(i)-1; fRO2C(i)=fRO2C(i)-1; fRO2C(i)=fRO2C(i)+1; fMEK(i)=fMEK(i)+.5; fXC(i)=fXC(i)-2;

i=i+1;
Rnames{i} = 'yROOH + RO2XC = RO2XC + .5*MEK - 2*XC';
k(:,i) = 3.50e-14;
Gstr{i,1} = 'yROOH'; Gstr{i,2} = 'RO2XC';
fyROOH(i)=fyROOH(i)-1; fRO2XC(i)=fRO2XC(i)-1; fRO2XC(i)=fRO2XC(i)+1; fMEK(i)=fMEK(i)+.5; fXC(i)=fXC(i)-2;

i=i+1;
Rnames{i} = 'yROOH + MECO3 = MECO3';
k(:,i) = 4.40e-13.*(T./300).^0.00.*exp(1069.847./T);
Gstr{i,1} = 'yROOH'; Gstr{i,2} = 'MECO3';
fyROOH(i)=fyROOH(i)-1; fMECO3(i)=fMECO3(i)-1; fMECO3(i)=fMECO3(i)+1;

i=i+1;
Rnames{i} = 'yROOH + RCO3 = RCO3';
k(:,i) = 4.40e-13.*(T./300).^0.00.*exp(1069.847./T);
Gstr{i,1} = 'yROOH'; Gstr{i,2} = 'RCO3';
fyROOH(i)=fyROOH(i)-1; fRCO3(i)=fRCO3(i)-1; fRCO3(i)=fRCO3(i)+1;

i=i+1;
Rnames{i} = 'yROOH + BZCO3 = BZCO3';
k(:,i) = 4.40e-13.*(T./300).^0.00.*exp(1069.847./T);
Gstr{i,1} = 'yROOH'; Gstr{i,2} = 'BZCO3';
fyROOH(i)=fyROOH(i)-1; fBZCO3(i)=fBZCO3(i)-1; fBZCO3(i)=fBZCO3(i)+1;

i=i+1;
Rnames{i} = 'yROOH + MACO3 = MACO3';
k(:,i) = 4.40e-13.*(T./300).^0.00.*exp(1069.847./T);
Gstr{i,1} = 'yROOH'; Gstr{i,2} = 'MACO3';
fyROOH(i)=fyROOH(i)-1; fMACO3(i)=fMACO3(i)-1; fMACO3(i)=fMACO3(i)+1;

i=i+1;
Rnames{i} = 'yR6OOH + NO = NO';
k(:,i) = 2.60e-12.*(T./300).^0.00.*exp(379.932./T);
Gstr{i,1} = 'yR6OOH'; Gstr{i,2} = 'NO';
fyR6OOH(i)=fyR6OOH(i)-1; fNO(i)=fNO(i)-1; fNO(i)=fNO(i)+1;

i=i+1;
Rnames{i} = 'yR6OOH + HO2 = HO2 + R6OOH - 6*XC';
k(:,i) = 3.80e-13.*(T./300).^0.00.*exp(899.758./T);
Gstr{i,1} = 'yR6OOH'; Gstr{i,2} = 'HO2';
fyR6OOH(i)=fyR6OOH(i)-1; fHO2(i)=fHO2(i)-1; fHO2(i)=fHO2(i)+1; fR6OOH(i)=fR6OOH(i)+1; fXC(i)=fXC(i)-6;

i=i+1;
Rnames{i} = 'yR6OOH + NO3 = NO3';
k(:,i) = 2.30e-12;
Gstr{i,1} = 'yR6OOH'; Gstr{i,2} = 'NO3';
fyR6OOH(i)=fyR6OOH(i)-1; fNO3(i)=fNO3(i)-1; fNO3(i)=fNO3(i)+1;

i=i+1;
Rnames{i} = 'yR6OOH + MEO2 = MEO2 + .5*PROD2 - 3*XC';
k(:,i) = 2.00e-13;
Gstr{i,1} = 'yR6OOH'; Gstr{i,2} = 'MEO2';
fyR6OOH(i)=fyR6OOH(i)-1; fMEO2(i)=fMEO2(i)-1; fMEO2(i)=fMEO2(i)+1; fPROD2(i)=fPROD2(i)+.5; fXC(i)=fXC(i)-3;

i=i+1;
Rnames{i} = 'yR6OOH + RO2C = RO2C + .5*PROD2 - 3*XC';
k(:,i) = 3.50e-14;
Gstr{i,1} = 'yR6OOH'; Gstr{i,2} = 'RO2C';
fyR6OOH(i)=fyR6OOH(i)-1; fRO2C(i)=fRO2C(i)-1; fRO2C(i)=fRO2C(i)+1; fPROD2(i)=fPROD2(i)+.5; fXC(i)=fXC(i)-3;

i=i+1;
Rnames{i} = 'yR6OOH + RO2XC = RO2XC + .5*PROD2 - 3*XC';
k(:,i) = 3.50e-14;
Gstr{i,1} = 'yR6OOH'; Gstr{i,2} = 'RO2XC';
fyR6OOH(i)=fyR6OOH(i)-1; fRO2XC(i)=fRO2XC(i)-1; fRO2XC(i)=fRO2XC(i)+1; fPROD2(i)=fPROD2(i)+.5; fXC(i)=fXC(i)-3;

i=i+1;
Rnames{i} = 'yR6OOH + MECO3 = MECO3';
k(:,i) = 4.40e-13.*(T./300).^0.00.*exp(1069.847./T);
Gstr{i,1} = 'yR6OOH'; Gstr{i,2} = 'MECO3';
fyR6OOH(i)=fyR6OOH(i)-1; fMECO3(i)=fMECO3(i)-1; fMECO3(i)=fMECO3(i)+1;

i=i+1;
Rnames{i} = 'yR6OOH + RCO3 = RCO3';
k(:,i) = 4.40e-13.*(T./300).^0.00.*exp(1069.847./T);
Gstr{i,1} = 'yR6OOH'; Gstr{i,2} = 'RCO3';
fyR6OOH(i)=fyR6OOH(i)-1; fRCO3(i)=fRCO3(i)-1; fRCO3(i)=fRCO3(i)+1;

i=i+1;
Rnames{i} = 'yR6OOH + BZCO3 = BZCO3';
k(:,i) = 4.40e-13.*(T./300).^0.00.*exp(1069.847./T);
Gstr{i,1} = 'yR6OOH'; Gstr{i,2} = 'BZCO3';
fyR6OOH(i)=fyR6OOH(i)-1; fBZCO3(i)=fBZCO3(i)-1; fBZCO3(i)=fBZCO3(i)+1;

i=i+1;
Rnames{i} = 'yR6OOH + MACO3 = MACO3';
k(:,i) = 4.40e-13.*(T./300).^0.00.*exp(1069.847./T);
Gstr{i,1} = 'yR6OOH'; Gstr{i,2} = 'MACO3';
fyR6OOH(i)=fyR6OOH(i)-1; fMACO3(i)=fMACO3(i)-1; fMACO3(i)=fMACO3(i)+1;

i=i+1;
Rnames{i} = 'yRAOOH + NO = NO';
k(:,i) = 2.60e-12.*(T./300).^0.00.*exp(379.932./T);
Gstr{i,1} = 'yRAOOH'; Gstr{i,2} = 'NO';
fyRAOOH(i)=fyRAOOH(i)-1; fNO(i)=fNO(i)-1; fNO(i)=fNO(i)+1;

i=i+1;
Rnames{i} = 'yRAOOH + HO2 = HO2 + RAOOH - 8*XC';
k(:,i) = 3.80e-13.*(T./300).^0.00.*exp(899.758./T);
Gstr{i,1} = 'yRAOOH'; Gstr{i,2} = 'HO2';
fyRAOOH(i)=fyRAOOH(i)-1; fHO2(i)=fHO2(i)-1; fHO2(i)=fHO2(i)+1; fRAOOH(i)=fRAOOH(i)+1; fXC(i)=fXC(i)-8;

i=i+1;
Rnames{i} = 'yRAOOH + NO3 = NO3';
k(:,i) = 2.30e-12;
Gstr{i,1} = 'yRAOOH'; Gstr{i,2} = 'NO3';
fyRAOOH(i)=fyRAOOH(i)-1; fNO3(i)=fNO3(i)-1; fNO3(i)=fNO3(i)+1;

i=i+1;
Rnames{i} = 'yRAOOH + MEO2 = MEO2 + .5*PROD2 - 3*XC';
k(:,i) = 2.00e-13;
Gstr{i,1} = 'yRAOOH'; Gstr{i,2} = 'MEO2';
fyRAOOH(i)=fyRAOOH(i)-1; fMEO2(i)=fMEO2(i)-1; fMEO2(i)=fMEO2(i)+1; fPROD2(i)=fPROD2(i)+.5; fXC(i)=fXC(i)-3;

i=i+1;
Rnames{i} = 'yRAOOH + RO2C = RO2C + .5*PROD2 - 3*XC';
k(:,i) = 3.50e-14;
Gstr{i,1} = 'yRAOOH'; Gstr{i,2} = 'RO2C';
fyRAOOH(i)=fyRAOOH(i)-1; fRO2C(i)=fRO2C(i)-1; fRO2C(i)=fRO2C(i)+1; fPROD2(i)=fPROD2(i)+.5; fXC(i)=fXC(i)-3;

i=i+1;
Rnames{i} = 'yRAOOH + RO2XC = RO2XC + .5*PROD2 - 3*XC';
k(:,i) = 3.50e-14;
Gstr{i,1} = 'yRAOOH'; Gstr{i,2} = 'RO2XC';
fyRAOOH(i)=fyRAOOH(i)-1; fRO2XC(i)=fRO2XC(i)-1; fRO2XC(i)=fRO2XC(i)+1; fPROD2(i)=fPROD2(i)+.5; fXC(i)=fXC(i)-3;

i=i+1;
Rnames{i} = 'yRAOOH + MECO3 = MECO3';
k(:,i) = 4.40e-13.*(T./300).^0.00.*exp(1069.847./T);
Gstr{i,1} = 'yRAOOH'; Gstr{i,2} = 'MECO3';
fyRAOOH(i)=fyRAOOH(i)-1; fMECO3(i)=fMECO3(i)-1; fMECO3(i)=fMECO3(i)+1;

i=i+1;
Rnames{i} = 'yRAOOH + RCO3 = RCO3';
k(:,i) = 4.40e-13.*(T./300).^0.00.*exp(1069.847./T);
Gstr{i,1} = 'yRAOOH'; Gstr{i,2} = 'RCO3';
fyRAOOH(i)=fyRAOOH(i)-1; fRCO3(i)=fRCO3(i)-1; fRCO3(i)=fRCO3(i)+1;

i=i+1;
Rnames{i} = 'yRAOOH + BZCO3 = BZCO3';
k(:,i) = 4.40e-13.*(T./300).^0.00.*exp(1069.847./T);
Gstr{i,1} = 'yRAOOH'; Gstr{i,2} = 'BZCO3';
fyRAOOH(i)=fyRAOOH(i)-1; fBZCO3(i)=fBZCO3(i)-1; fBZCO3(i)=fBZCO3(i)+1;

i=i+1;
Rnames{i} = 'yRAOOH + MACO3 = MACO3';
k(:,i) = 4.40e-13.*(T./300).^0.00.*exp(1069.847./T);
Gstr{i,1} = 'yRAOOH'; Gstr{i,2} = 'MACO3';
fyRAOOH(i)=fyRAOOH(i)-1; fMACO3(i)=fMACO3(i)-1; fMACO3(i)=fMACO3(i)+1;

i=i+1;
Rnames{i} = 'zRNO3 + NO = NO + RNO3 - 1*XN';
k(:,i) = 2.60e-12.*(T./300).^0.00.*exp(379.932./T);
Gstr{i,1} = 'zRNO3'; Gstr{i,2} = 'NO';
fzRNO3(i)=fzRNO3(i)-1; fNO(i)=fNO(i)-1; fNO(i)=fNO(i)+1; fRNO3(i)=fRNO3(i)+1; fXN(i)=fXN(i)-1;

i=i+1;
Rnames{i} = 'zRNO3 + HO2 = HO2 + 6*XC';
k(:,i) = 3.80e-13.*(T./300).^0.00.*exp(899.758./T);
Gstr{i,1} = 'zRNO3'; Gstr{i,2} = 'HO2';
fzRNO3(i)=fzRNO3(i)-1; fHO2(i)=fHO2(i)-1; fHO2(i)=fHO2(i)+1; fXC(i)=fXC(i)+6;

i=i+1;
Rnames{i} = 'zRNO3 + NO3 = NO3 + PROD2 + HO2';
k(:,i) = 2.30e-12;
Gstr{i,1} = 'zRNO3'; Gstr{i,2} = 'NO3';
fzRNO3(i)=fzRNO3(i)-1; fNO3(i)=fNO3(i)-1; fNO3(i)=fNO3(i)+1; fPROD2(i)=fPROD2(i)+1; fHO2(i)=fHO2(i)+1;

i=i+1;
Rnames{i} = 'zRNO3 + MEO2 = MEO2 + .5*PROD2 + .5*HO2 + 3*XC';
k(:,i) = 2.00e-13;
Gstr{i,1} = 'zRNO3'; Gstr{i,2} = 'MEO2';
fzRNO3(i)=fzRNO3(i)-1; fMEO2(i)=fMEO2(i)-1; fMEO2(i)=fMEO2(i)+1; fPROD2(i)=fPROD2(i)+.5; fHO2(i)=fHO2(i)+.5; fXC(i)=fXC(i)+3;

i=i+1;
Rnames{i} = 'zRNO3 + RO2C = RO2C + .5*PROD2 + .5*HO2 + 3*XC';
k(:,i) = 3.50e-14;
Gstr{i,1} = 'zRNO3'; Gstr{i,2} = 'RO2C';
fzRNO3(i)=fzRNO3(i)-1; fRO2C(i)=fRO2C(i)-1; fRO2C(i)=fRO2C(i)+1; fPROD2(i)=fPROD2(i)+.5; fHO2(i)=fHO2(i)+.5; fXC(i)=fXC(i)+3;

i=i+1;
Rnames{i} = 'zRNO3 + RO2XC = RO2XC + .5*PROD2 + .5*HO2 + 3*XC';
k(:,i) = 3.50e-14;
Gstr{i,1} = 'zRNO3'; Gstr{i,2} = 'RO2XC';
fzRNO3(i)=fzRNO3(i)-1; fRO2XC(i)=fRO2XC(i)-1; fRO2XC(i)=fRO2XC(i)+1; fPROD2(i)=fPROD2(i)+.5; fHO2(i)=fHO2(i)+.5; fXC(i)=fXC(i)+3;

i=i+1;
Rnames{i} = 'zRNO3 + MECO3 = MECO3 + PROD2 + HO2';
k(:,i) = 4.40e-13.*(T./300).^0.00.*exp(1069.847./T);
Gstr{i,1} = 'zRNO3'; Gstr{i,2} = 'MECO3';
fzRNO3(i)=fzRNO3(i)-1; fMECO3(i)=fMECO3(i)-1; fMECO3(i)=fMECO3(i)+1; fPROD2(i)=fPROD2(i)+1; fHO2(i)=fHO2(i)+1;

i=i+1;
Rnames{i} = 'zRNO3 + RCO3 = RCO3 + PROD2 + HO2';
k(:,i) = 4.40e-13.*(T./300).^0.00.*exp(1069.847./T);
Gstr{i,1} = 'zRNO3'; Gstr{i,2} = 'RCO3';
fzRNO3(i)=fzRNO3(i)-1; fRCO3(i)=fRCO3(i)-1; fRCO3(i)=fRCO3(i)+1; fPROD2(i)=fPROD2(i)+1; fHO2(i)=fHO2(i)+1;

i=i+1;
Rnames{i} = 'zRNO3 + BZCO3 = BZCO3 + PROD2 + HO2';
k(:,i) = 4.40e-13.*(T./300).^0.00.*exp(1069.847./T);
Gstr{i,1} = 'zRNO3'; Gstr{i,2} = 'BZCO3';
fzRNO3(i)=fzRNO3(i)-1; fBZCO3(i)=fBZCO3(i)-1; fBZCO3(i)=fBZCO3(i)+1; fPROD2(i)=fPROD2(i)+1; fHO2(i)=fHO2(i)+1;

i=i+1;
Rnames{i} = 'zRNO3 + MACO3 = MACO3 + PROD2 + HO2';
k(:,i) = 4.40e-13.*(T./300).^0.00.*exp(1069.847./T);
Gstr{i,1} = 'zRNO3'; Gstr{i,2} = 'MACO3';
fzRNO3(i)=fzRNO3(i)-1; fMACO3(i)=fMACO3(i)-1; fMACO3(i)=fMACO3(i)+1; fPROD2(i)=fPROD2(i)+1; fHO2(i)=fHO2(i)+1;

i=i+1;
Rnames{i} = 'xHOCCHO + NO = NO + HOCCHO';
k(:,i) = 2.60e-12.*(T./300).^0.00.*exp(379.932./T);
Gstr{i,1} = 'xHOCCHO'; Gstr{i,2} = 'NO';
fxHOCCHO(i)=fxHOCCHO(i)-1; fNO(i)=fNO(i)-1; fNO(i)=fNO(i)+1; fHOCCHO(i)=fHOCCHO(i)+1;

i=i+1;
Rnames{i} = 'xHOCCHO + HO2 = HO2 + 2*XC';
k(:,i) = 3.80e-13.*(T./300).^0.00.*exp(899.758./T);
Gstr{i,1} = 'xHOCCHO'; Gstr{i,2} = 'HO2';
fxHOCCHO(i)=fxHOCCHO(i)-1; fHO2(i)=fHO2(i)-1; fHO2(i)=fHO2(i)+1; fXC(i)=fXC(i)+2;

i=i+1;
Rnames{i} = 'xHOCCHO + NO3 = NO3 + HOCCHO';
k(:,i) = 2.30e-12;
Gstr{i,1} = 'xHOCCHO'; Gstr{i,2} = 'NO3';
fxHOCCHO(i)=fxHOCCHO(i)-1; fNO3(i)=fNO3(i)-1; fNO3(i)=fNO3(i)+1; fHOCCHO(i)=fHOCCHO(i)+1;

i=i+1;
Rnames{i} = 'xHOCCHO + MEO2 = MEO2 + .5*HOCCHO + XC';
k(:,i) = 2.00e-13;
Gstr{i,1} = 'xHOCCHO'; Gstr{i,2} = 'MEO2';
fxHOCCHO(i)=fxHOCCHO(i)-1; fMEO2(i)=fMEO2(i)-1; fMEO2(i)=fMEO2(i)+1; fHOCCHO(i)=fHOCCHO(i)+.5; fXC(i)=fXC(i)+1;

i=i+1;
Rnames{i} = 'xHOCCHO + RO2C = RO2C + .5*HOCCHO + XC';
k(:,i) = 3.50e-14;
Gstr{i,1} = 'xHOCCHO'; Gstr{i,2} = 'RO2C';
fxHOCCHO(i)=fxHOCCHO(i)-1; fRO2C(i)=fRO2C(i)-1; fRO2C(i)=fRO2C(i)+1; fHOCCHO(i)=fHOCCHO(i)+.5; fXC(i)=fXC(i)+1;

i=i+1;
Rnames{i} = 'xHOCCHO + RO2XC = RO2XC + .5*HOCCHO + XC';
k(:,i) = 3.50e-14;
Gstr{i,1} = 'xHOCCHO'; Gstr{i,2} = 'RO2XC';
fxHOCCHO(i)=fxHOCCHO(i)-1; fRO2XC(i)=fRO2XC(i)-1; fRO2XC(i)=fRO2XC(i)+1; fHOCCHO(i)=fHOCCHO(i)+.5; fXC(i)=fXC(i)+1;

i=i+1;
Rnames{i} = 'xHOCCHO + MECO3 = MECO3 + HOCCHO';
k(:,i) = 4.40e-13.*(T./300).^0.00.*exp(1069.847./T);
Gstr{i,1} = 'xHOCCHO'; Gstr{i,2} = 'MECO3';
fxHOCCHO(i)=fxHOCCHO(i)-1; fMECO3(i)=fMECO3(i)-1; fMECO3(i)=fMECO3(i)+1; fHOCCHO(i)=fHOCCHO(i)+1;

i=i+1;
Rnames{i} = 'xHOCCHO + RCO3 = RCO3 + HOCCHO';
k(:,i) = 4.40e-13.*(T./300).^0.00.*exp(1069.847./T);
Gstr{i,1} = 'xHOCCHO'; Gstr{i,2} = 'RCO3';
fxHOCCHO(i)=fxHOCCHO(i)-1; fRCO3(i)=fRCO3(i)-1; fRCO3(i)=fRCO3(i)+1; fHOCCHO(i)=fHOCCHO(i)+1;

i=i+1;
Rnames{i} = 'xHOCCHO + BZCO3 = BZCO3 + HOCCHO';
k(:,i) = 4.40e-13.*(T./300).^0.00.*exp(1069.847./T);
Gstr{i,1} = 'xHOCCHO'; Gstr{i,2} = 'BZCO3';
fxHOCCHO(i)=fxHOCCHO(i)-1; fBZCO3(i)=fBZCO3(i)-1; fBZCO3(i)=fBZCO3(i)+1; fHOCCHO(i)=fHOCCHO(i)+1;

i=i+1;
Rnames{i} = 'xHOCCHO + MACO3 = MACO3 + HOCCHO';
k(:,i) = 4.40e-13.*(T./300).^0.00.*exp(1069.847./T);
Gstr{i,1} = 'xHOCCHO'; Gstr{i,2} = 'MACO3';
fxHOCCHO(i)=fxHOCCHO(i)-1; fMACO3(i)=fMACO3(i)-1; fMACO3(i)=fMACO3(i)+1; fHOCCHO(i)=fHOCCHO(i)+1;

i=i+1;
Rnames{i} = 'xACRO + NO = NO + ACRO';
k(:,i) = 2.60e-12.*(T./300).^0.00.*exp(379.932./T);
Gstr{i,1} = 'xACRO'; Gstr{i,2} = 'NO';
fxACRO(i)=fxACRO(i)-1; fNO(i)=fNO(i)-1; fNO(i)=fNO(i)+1; fACRO(i)=fACRO(i)+1;

i=i+1;
Rnames{i} = 'xACRO + HO2 = HO2 + 3*XC';
k(:,i) = 3.80e-13.*(T./300).^0.00.*exp(899.758./T);
Gstr{i,1} = 'xACRO'; Gstr{i,2} = 'HO2';
fxACRO(i)=fxACRO(i)-1; fHO2(i)=fHO2(i)-1; fHO2(i)=fHO2(i)+1; fXC(i)=fXC(i)+3;

i=i+1;
Rnames{i} = 'xACRO + NO3 = NO3 + ACRO';
k(:,i) = 2.30e-12;
Gstr{i,1} = 'xACRO'; Gstr{i,2} = 'NO3';
fxACRO(i)=fxACRO(i)-1; fNO3(i)=fNO3(i)-1; fNO3(i)=fNO3(i)+1; fACRO(i)=fACRO(i)+1;

i=i+1;
Rnames{i} = 'xACRO + MEO2 = MEO2 + .5*ACRO + 1.5*XC';
k(:,i) = 2.00e-13;
Gstr{i,1} = 'xACRO'; Gstr{i,2} = 'MEO2';
fxACRO(i)=fxACRO(i)-1; fMEO2(i)=fMEO2(i)-1; fMEO2(i)=fMEO2(i)+1; fACRO(i)=fACRO(i)+.5; fXC(i)=fXC(i)+1.5;

i=i+1;
Rnames{i} = 'xACRO + RO2C = RO2C + .5*ACRO + 1.5*XC';
k(:,i) = 3.50e-14;
Gstr{i,1} = 'xACRO'; Gstr{i,2} = 'RO2C';
fxACRO(i)=fxACRO(i)-1; fRO2C(i)=fRO2C(i)-1; fRO2C(i)=fRO2C(i)+1; fACRO(i)=fACRO(i)+.5; fXC(i)=fXC(i)+1.5;

i=i+1;
Rnames{i} = 'xACRO + RO2XC = RO2XC + .5*ACRO + 1.5*XC';
k(:,i) = 3.50e-14;
Gstr{i,1} = 'xACRO'; Gstr{i,2} = 'RO2XC';
fxACRO(i)=fxACRO(i)-1; fRO2XC(i)=fRO2XC(i)-1; fRO2XC(i)=fRO2XC(i)+1; fACRO(i)=fACRO(i)+.5; fXC(i)=fXC(i)+1.5;

i=i+1;
Rnames{i} = 'xACRO + MECO3 = MECO3 + ACRO';
k(:,i) = 4.40e-13.*(T./300).^0.00.*exp(1069.847./T);
Gstr{i,1} = 'xACRO'; Gstr{i,2} = 'MECO3';
fxACRO(i)=fxACRO(i)-1; fMECO3(i)=fMECO3(i)-1; fMECO3(i)=fMECO3(i)+1; fACRO(i)=fACRO(i)+1;

i=i+1;
Rnames{i} = 'xACRO + RCO3 = RCO3 + ACRO';
k(:,i) = 4.40e-13.*(T./300).^0.00.*exp(1069.847./T);
Gstr{i,1} = 'xACRO'; Gstr{i,2} = 'RCO3';
fxACRO(i)=fxACRO(i)-1; fRCO3(i)=fRCO3(i)-1; fRCO3(i)=fRCO3(i)+1; fACRO(i)=fACRO(i)+1;

i=i+1;
Rnames{i} = 'xACRO + BZCO3 = BZCO3 + ACRO';
k(:,i) = 4.40e-13.*(T./300).^0.00.*exp(1069.847./T);
Gstr{i,1} = 'xACRO'; Gstr{i,2} = 'BZCO3';
fxACRO(i)=fxACRO(i)-1; fBZCO3(i)=fBZCO3(i)-1; fBZCO3(i)=fBZCO3(i)+1; fACRO(i)=fACRO(i)+1;

i=i+1;
Rnames{i} = 'xACRO + MACO3 = MACO3 + ACRO';
k(:,i) = 4.40e-13.*(T./300).^0.00.*exp(1069.847./T);
Gstr{i,1} = 'xACRO'; Gstr{i,2} = 'MACO3';
fxACRO(i)=fxACRO(i)-1; fMACO3(i)=fMACO3(i)-1; fMACO3(i)=fMACO3(i)+1; fACRO(i)=fACRO(i)+1;

i=i+1;
Rnames{i} = 'CH4 + OH = MEO2';
k(:,i) = 1.85e-12.*(T./300).^0.00.*exp(-1689.815./T);
Gstr{i,1} = 'CH4'; Gstr{i,2} = 'OH';
fCH4(i)=fCH4(i)-1; fOH(i)=fOH(i)-1; fMEO2(i)=fMEO2(i)+1;

i=i+1;
Rnames{i} = 'ETHENE + OH = xHO2 + RO2C + 1.61*xHCHO + .195*xHOCCHO + yROOH';
k(:,i) = K_ETHE_OH;
Gstr{i,1} = 'ETHENE'; Gstr{i,2} = 'OH';
fETHENE(i)=fETHENE(i)-1; fOH(i)=fOH(i)-1; fxHO2(i)=fxHO2(i)+1; fRO2C(i)=fRO2C(i)+1; fxHCHO(i)=fxHCHO(i)+1.61; fxHOCCHO(i)=fxHOCCHO(i)+.195; fyROOH(i)=fyROOH(i)+1;

i=i+1;
Rnames{i} = 'ETHENE + O3 = .16*HO2 + .16*OH + .51*CO + .12*CO2 + HCHO + .37*HCOOH';
k(:,i) = 9.14e-15.*(T./300).^0.00.*exp(-2580.012./T);
Gstr{i,1} = 'ETHENE'; Gstr{i,2} = 'O3';
fETHENE(i)=fETHENE(i)-1; fO3(i)=fO3(i)-1; fHO2(i)=fHO2(i)+.16; fOH(i)=fOH(i)+.16; fCO(i)=fCO(i)+.51; fCO2(i)=fCO2(i)+.12; fHCHO(i)=fHCHO(i)+1; fHCOOH(i)=fHCOOH(i)+.37;

i=i+1;
Rnames{i} = 'ETHENE + NO3 = xHO2 + RO2C + xRCHO + yROOH + XN - 1*XC';
k(:,i) = 3.30e-12.*(T./300).^2.00.*exp(-2879.932./T);
Gstr{i,1} = 'ETHENE'; Gstr{i,2} = 'NO3';
fETHENE(i)=fETHENE(i)-1; fNO3(i)=fNO3(i)-1; fxHO2(i)=fxHO2(i)+1; fRO2C(i)=fRO2C(i)+1; fxRCHO(i)=fxRCHO(i)+1; fyROOH(i)=fyROOH(i)+1; fXN(i)=fXN(i)+1; fXC(i)=fXC(i)-1;

i=i+1;
Rnames{i} = 'ETHENE + O3P = .8*HO2 + .29*xHO2 + .51*MEO2 + .29*RO2C + .51*CO + .278*xCO + .278*xHCHO + .1*CCHO + .012*xGLY + .29*yROOH + .2*XC';
k(:,i) = 1.07e-11.*(T./300).^0.00.*exp(-800.121./T);
Gstr{i,1} = 'ETHENE'; Gstr{i,2} = 'O3P';
fETHENE(i)=fETHENE(i)-1; fO3P(i)=fO3P(i)-1; fHO2(i)=fHO2(i)+.8; fxHO2(i)=fxHO2(i)+.29; fMEO2(i)=fMEO2(i)+.51; fRO2C(i)=fRO2C(i)+.29; fCO(i)=fCO(i)+.51; fxCO(i)=fxCO(i)+.278; fxHCHO(i)=fxHCHO(i)+.278; fCCHO(i)=fCCHO(i)+.1; fxGLY(i)=fxGLY(i)+.012; fyROOH(i)=fyROOH(i)+.29; fXC(i)=fXC(i)+.2;

i=i+1;
Rnames{i} = 'PROPENE + OH = .984*xHO2 + .984*RO2C + .016*RO2XC + .016*zRNO3 + .984*xHCHO + .984*xCCHO + yROOH - .048*XC';
k(:,i) = 4.85e-12.*exp(504.227./T);
Gstr{i,1} = 'PROPENE'; Gstr{i,2} = 'OH';
fPROPENE(i)=fPROPENE(i)-1; fOH(i)=fOH(i)-1; fxHO2(i)=fxHO2(i)+.984; fRO2C(i)=fRO2C(i)+.984; fRO2XC(i)=fRO2XC(i)+.016; fzRNO3(i)=fzRNO3(i)+.016; fxHCHO(i)=fxHCHO(i)+.984; fxCCHO(i)=fxCCHO(i)+.984; fyROOH(i)=fyROOH(i)+1; fXC(i)=fXC(i)-.048;

i=i+1;
Rnames{i} = 'PROPENE + O3 = .165*HO2 + .35*OH + .355*MEO2 + .525*CO + .215*CO2 + .5*HCHO + .5*CCHO + .185*HCOOH + .075*CCOOH + .07*XC';
k(:,i) = 5.51e-15.*exp(-1878.019./T);
Gstr{i,1} = 'PROPENE'; Gstr{i,2} = 'O3';
fPROPENE(i)=fPROPENE(i)-1; fO3(i)=fO3(i)-1; fHO2(i)=fHO2(i)+.165; fOH(i)=fOH(i)+.35; fMEO2(i)=fMEO2(i)+.355; fCO(i)=fCO(i)+.525; fCO2(i)=fCO2(i)+.215; fHCHO(i)=fHCHO(i)+.5; fCCHO(i)=fCCHO(i)+.5; fHCOOH(i)=fHCOOH(i)+.185; fCCOOH(i)=fCCOOH(i)+.075; fXC(i)=fXC(i)+.07;

i=i+1;
Rnames{i} = 'PROPENE + NO3 = .949*xHO2 + .949*RO2C + .051*RO2XC + .051*zRNO3 + yROOH + XN + 2.694*XC';
k(:,i) = 4.59e-13.*exp(-1155.898./T);
Gstr{i,1} = 'PROPENE'; Gstr{i,2} = 'NO3';
fPROPENE(i)=fPROPENE(i)-1; fNO3(i)=fNO3(i)-1; fxHO2(i)=fxHO2(i)+.949; fRO2C(i)=fRO2C(i)+.949; fRO2XC(i)=fRO2XC(i)+.051; fzRNO3(i)=fzRNO3(i)+.051; fyROOH(i)=fyROOH(i)+1; fXN(i)=fXN(i)+1; fXC(i)=fXC(i)+2.694;

i=i+1;
Rnames{i} = 'PROPENE + O3P = .45*RCHO + .55*MEK - .55*XC';
k(:,i) = 1.02e-11.*exp(-279.791./T);
Gstr{i,1} = 'PROPENE'; Gstr{i,2} = 'O3P';
fPROPENE(i)=fPROPENE(i)-1; fO3P(i)=fO3P(i)-1; fRCHO(i)=fRCHO(i)+.45; fMEK(i)=fMEK(i)+.55; fXC(i)=fXC(i)-.55;

i=i+1;
Rnames{i} = 'BUTDE13E + OH = .951*xHO2 + 1.189*RO2C + .049*RO2XC + .049*zRNO3 + .708*xHCHO + .48*xACRO + .471*xIPRD + yROOH - .797*XC';
k(:,i) = 1.48e-11.*exp(447.866./T);
Gstr{i,1} = 'BUTDE13E'; Gstr{i,2} = 'OH';
fBUTDE13E(i)=fBUTDE13E(i)-1; fOH(i)=fOH(i)-1; fxHO2(i)=fxHO2(i)+.951; fRO2C(i)=fRO2C(i)+1.189; fRO2XC(i)=fRO2XC(i)+.049; fzRNO3(i)=fzRNO3(i)+.049; fxHCHO(i)=fxHCHO(i)+.708; fxACRO(i)=fxACRO(i)+.48; fxIPRD(i)=fxIPRD(i)+.471; fyROOH(i)=fyROOH(i)+1; fXC(i)=fXC(i)-.797;

i=i+1;
Rnames{i} = 'BUTDE13E + O3 = .08*HO2 + .08*OH + .255*CO + .185*CO2 + .5*HCHO + .185*HCOOH + .5*ACRO + .375*MVK + .125*PROD2 - .875*XC';
k(:,i) = 1.34e-14.*exp(-2283.112./T);
Gstr{i,1} = 'BUTDE13E'; Gstr{i,2} = 'O3';
fBUTDE13E(i)=fBUTDE13E(i)-1; fO3(i)=fO3(i)-1; fHO2(i)=fHO2(i)+.08; fOH(i)=fOH(i)+.08; fCO(i)=fCO(i)+.255; fCO2(i)=fCO2(i)+.185; fHCHO(i)=fHCHO(i)+.5; fHCOOH(i)=fHCOOH(i)+.185; fACRO(i)=fACRO(i)+.5; fMVK(i)=fMVK(i)+.375; fPROD2(i)=fPROD2(i)+.125; fXC(i)=fXC(i)-.875;

i=i+1;
Rnames{i} = 'BUTDE13E + NO3 = .815*xHO2 + .12*xNO2 + 1.055*RO2C + .065*RO2XC + .065*zRNO3 + .115*xHCHO + .46*xMVK + .12*xIPRD + .355*xRNO3 + yROOH + .525*XN - 1.075*XC';
k(:,i) = 1.00e-13;
Gstr{i,1} = 'BUTDE13E'; Gstr{i,2} = 'NO3';
fBUTDE13E(i)=fBUTDE13E(i)-1; fNO3(i)=fNO3(i)-1; fxHO2(i)=fxHO2(i)+.815; fxNO2(i)=fxNO2(i)+.12; fRO2C(i)=fRO2C(i)+1.055; fRO2XC(i)=fRO2XC(i)+.065; fzRNO3(i)=fzRNO3(i)+.065; fxHCHO(i)=fxHCHO(i)+.115; fxMVK(i)=fxMVK(i)+.46; fxIPRD(i)=fxIPRD(i)+.12; fxRNO3(i)=fxRNO3(i)+.355; fyROOH(i)=fyROOH(i)+1; fXN(i)=fXN(i)+.525; fXC(i)=fXC(i)-1.075;

i=i+1;
Rnames{i} = 'BUTDE13E + O3P = .25*HO2 + .117*xHO2 + .118*xMACO3 + .235*RO2C + .015*RO2XC + .015*zRNO3 + .115*xCO + .115*xACRO + .001*xAFG1 + .001*xAFG2 + .75*PROD2 + .25*yROOH - 1.532*XC';
k(:,i) = 2.26e-11.*exp(-39.754./T);
Gstr{i,1} = 'BUTDE13E'; Gstr{i,2} = 'O3P';
fBUTDE13E(i)=fBUTDE13E(i)-1; fO3P(i)=fO3P(i)-1; fHO2(i)=fHO2(i)+.25; fxHO2(i)=fxHO2(i)+.117; fxMACO3(i)=fxMACO3(i)+.118; fRO2C(i)=fRO2C(i)+.235; fRO2XC(i)=fRO2XC(i)+.015; fzRNO3(i)=fzRNO3(i)+.015; fxCO(i)=fxCO(i)+.115; fxACRO(i)=fxACRO(i)+.115; fxAFG1(i)=fxAFG1(i)+.001; fxAFG2(i)=fxAFG2(i)+.001; fPROD2(i)=fPROD2(i)+.75; fyROOH(i)=fyROOH(i)+.25; fXC(i)=fXC(i)-1.532;

i=i+1;
Rnames{i} = 'ISOPRENE + OH = .907*xHO2 + .986*RO2C + .093*RO2XC + .093*zRNO3 + .624*xHCHO + .23*xMACR + .32*xMVK + .357*xIPRD + yR6OOH - .167*XC';
k(:,i) = 2.54e-11.*(T./300).^0.00.*exp(410.125./T);
Gstr{i,1} = 'ISOPRENE'; Gstr{i,2} = 'OH';
fISOPRENE(i)=fISOPRENE(i)-1; fOH(i)=fOH(i)-1; fxHO2(i)=fxHO2(i)+.907; fRO2C(i)=fRO2C(i)+.986; fRO2XC(i)=fRO2XC(i)+.093; fzRNO3(i)=fzRNO3(i)+.093; fxHCHO(i)=fxHCHO(i)+.624; fxMACR(i)=fxMACR(i)+.23; fxMVK(i)=fxMVK(i)+.32; fxIPRD(i)=fxIPRD(i)+.357; fyR6OOH(i)=fyR6OOH(i)+1; fXC(i)=fXC(i)-.167;

i=i+1;
Rnames{i} = 'ISOPRENE + O3 = .066*HO2 + .266*OH + .192*xMACO3 + .192*RO2C + .008*RO2XC + .008*zRNO3 + .275*CO + .122*CO2 + .4*HCHO + .192*xHCHO + .204*HCOOH + .39*MACR + .16*MVK + .15*IPRD + .1*PROD2 + .2*yR6OOH - .559*XC';
k(:,i) = 7.86e-15.*(T./300).^0.00.*exp(-1912.238./T);
Gstr{i,1} = 'ISOPRENE'; Gstr{i,2} = 'O3';
fISOPRENE(i)=fISOPRENE(i)-1; fO3(i)=fO3(i)-1; fHO2(i)=fHO2(i)+.066; fOH(i)=fOH(i)+.266; fxMACO3(i)=fxMACO3(i)+.192; fRO2C(i)=fRO2C(i)+.192; fRO2XC(i)=fRO2XC(i)+.008; fzRNO3(i)=fzRNO3(i)+.008; fCO(i)=fCO(i)+.275; fCO2(i)=fCO2(i)+.122; fHCHO(i)=fHCHO(i)+.4; fxHCHO(i)=fxHCHO(i)+.192; fHCOOH(i)=fHCOOH(i)+.204; fMACR(i)=fMACR(i)+.39; fMVK(i)=fMVK(i)+.16; fIPRD(i)=fIPRD(i)+.15; fPROD2(i)=fPROD2(i)+.1; fyR6OOH(i)=fyR6OOH(i)+.2; fXC(i)=fXC(i)-.559;

i=i+1;
Rnames{i} = 'ISOPRENE + NO3 = .749*xHO2 + .187*xNO2 + .936*RO2C + .064*RO2XC + .064*zRNO3 + .936*xIPRD + yR6OOH + .813*XN - .064*XC';
k(:,i) = 3.03e-12.*(T./300).^0.00.*exp(-447.866./T);
Gstr{i,1} = 'ISOPRENE'; Gstr{i,2} = 'NO3';
fISOPRENE(i)=fISOPRENE(i)-1; fNO3(i)=fNO3(i)-1; fxHO2(i)=fxHO2(i)+.749; fxNO2(i)=fxNO2(i)+.187; fRO2C(i)=fRO2C(i)+.936; fRO2XC(i)=fRO2XC(i)+.064; fzRNO3(i)=fzRNO3(i)+.064; fxIPRD(i)=fxIPRD(i)+.936; fyR6OOH(i)=fyR6OOH(i)+1; fXN(i)=fXN(i)+.813; fXC(i)=fXC(i)-.064;

i=i+1;
Rnames{i} = 'ISOPRENE + O3P = .25*MEO2 + .24*xMACO3 + .24*RO2C + .01*RO2XC + .01*zRNO3 + .24*xHCHO + .75*PROD2 + .25*yR6OOH - 1.01*XC';
k(:,i) = 3.50e-11;
Gstr{i,1} = 'ISOPRENE'; Gstr{i,2} = 'O3P';
fISOPRENE(i)=fISOPRENE(i)-1; fO3P(i)=fO3P(i)-1; fMEO2(i)=fMEO2(i)+.25; fxMACO3(i)=fxMACO3(i)+.24; fRO2C(i)=fRO2C(i)+.24; fRO2XC(i)=fRO2XC(i)+.01; fzRNO3(i)=fzRNO3(i)+.01; fxHCHO(i)=fxHCHO(i)+.24; fPROD2(i)=fPROD2(i)+.75; fyR6OOH(i)=fyR6OOH(i)+.25; fXC(i)=fXC(i)-1.01;

i=i+1;
Rnames{i} = 'APINENE + OH = .799*xHO2 + .004*xRCO3 + 1.042*RO2C + .197*RO2XC + .197*zRNO3 + .002*xCO + .022*xHCHO + .776*xRCHO + .034*xACET + .02*xMGLY + .023*xBACL + yR6OOH + 6.2*XC';
k(:,i) = 1.21e-11.*exp(435.789./T);
Gstr{i,1} = 'APINENE'; Gstr{i,2} = 'OH';
fAPINENE(i)=fAPINENE(i)-1; fOH(i)=fOH(i)-1; fxHO2(i)=fxHO2(i)+.799; fxRCO3(i)=fxRCO3(i)+.004; fRO2C(i)=fRO2C(i)+1.042; fRO2XC(i)=fRO2XC(i)+.197; fzRNO3(i)=fzRNO3(i)+.197; fxCO(i)=fxCO(i)+.002; fxHCHO(i)=fxHCHO(i)+.022; fxRCHO(i)=fxRCHO(i)+.776; fxACET(i)=fxACET(i)+.034; fxMGLY(i)=fxMGLY(i)+.02; fxBACL(i)=fxBACL(i)+.023; fyR6OOH(i)=fyR6OOH(i)+1; fXC(i)=fXC(i)+6.2;

i=i+1;
Rnames{i} = 'APINENE + O3 = .009*HO2 + .102*xHO2 + .728*OH + .001*xMECO3 + .297*xRCO3 + 1.511*RO2C + .337*RO2XC + .337*zRNO3 + .029*CO + .051*xCO + .017*CO2 + .344*xHCHO + .24*xRCHO + .345*xACET + .008*MEK + .002*xGLY + .081*xBACL + .255*PROD2 + .737*yR6OOH + 2.999*XC';
k(:,i) = 5.00e-16.*exp(-529.891./T);
Gstr{i,1} = 'APINENE'; Gstr{i,2} = 'O3';
fAPINENE(i)=fAPINENE(i)-1; fO3(i)=fO3(i)-1; fHO2(i)=fHO2(i)+.009; fxHO2(i)=fxHO2(i)+.102; fOH(i)=fOH(i)+.728; fxMECO3(i)=fxMECO3(i)+.001; fxRCO3(i)=fxRCO3(i)+.297; fRO2C(i)=fRO2C(i)+1.511; fRO2XC(i)=fRO2XC(i)+.337; fzRNO3(i)=fzRNO3(i)+.337; fCO(i)=fCO(i)+.029; fxCO(i)=fxCO(i)+.051; fCO2(i)=fCO2(i)+.017; fxHCHO(i)=fxHCHO(i)+.344; fxRCHO(i)=fxRCHO(i)+.24; fxACET(i)=fxACET(i)+.345; fMEK(i)=fMEK(i)+.008; fxGLY(i)=fxGLY(i)+.002; fxBACL(i)=fxBACL(i)+.081; fPROD2(i)=fPROD2(i)+.255; fyR6OOH(i)=fyR6OOH(i)+.737; fXC(i)=fXC(i)+2.999;

i=i+1;
Rnames{i} = 'APINENE + NO3 = .056*xHO2 + .643*xNO2 + .007*xRCO3 + 1.05*RO2C + .293*RO2XC + .293*zRNO3 + .005*xCO + .007*xHCHO + .684*xRCHO + .069*xACET + .002*xMGLY + .056*xRNO3 + yR6OOH + .301*XN + 5.608*XC';
k(:,i) = 1.19e-12.*exp(490.137./T);
Gstr{i,1} = 'APINENE'; Gstr{i,2} = 'NO3';
fAPINENE(i)=fAPINENE(i)-1; fNO3(i)=fNO3(i)-1; fxHO2(i)=fxHO2(i)+.056; fxNO2(i)=fxNO2(i)+.643; fxRCO3(i)=fxRCO3(i)+.007; fRO2C(i)=fRO2C(i)+1.05; fRO2XC(i)=fRO2XC(i)+.293; fzRNO3(i)=fzRNO3(i)+.293; fxCO(i)=fxCO(i)+.005; fxHCHO(i)=fxHCHO(i)+.007; fxRCHO(i)=fxRCHO(i)+.684; fxACET(i)=fxACET(i)+.069; fxMGLY(i)=fxMGLY(i)+.002; fxRNO3(i)=fxRNO3(i)+.056; fyR6OOH(i)=fyR6OOH(i)+1; fXN(i)=fXN(i)+.301; fXC(i)=fXC(i)+5.608;

i=i+1;
Rnames{i} = 'APINENE + O3P = PROD2 + 4*XC';
k(:,i) = 3.20e-11;
Gstr{i,1} = 'APINENE'; Gstr{i,2} = 'O3P';
fAPINENE(i)=fAPINENE(i)-1; fO3P(i)=fO3P(i)-1; fPROD2(i)=fPROD2(i)+1; fXC(i)=fXC(i)+4;

i=i+1;
Rnames{i} = 'ACETYLEN + OH = .3*HO2 + .7*OH + .3*CO + .3*HCOOH + .7*GLY';
k(:,i) = K_ACYE_OH;
Gstr{i,1} = 'ACETYLEN'; Gstr{i,2} = 'OH';
fACETYLEN(i)=fACETYLEN(i)-1; fOH(i)=fOH(i)-1; fHO2(i)=fHO2(i)+.3; fOH(i)=fOH(i)+.7; fCO(i)=fCO(i)+.3; fHCOOH(i)=fHCOOH(i)+.3; fGLY(i)=fGLY(i)+.7;

i=i+1;
Rnames{i} = 'ACETYLEN + O3 = 1.5*HO2 + .5*OH + 1.5*CO + .5*CO2';
k(:,i) = 1.00e-14.*exp(-4100.242./T);
Gstr{i,1} = 'ACETYLEN'; Gstr{i,2} = 'O3';
fACETYLEN(i)=fACETYLEN(i)-1; fO3(i)=fO3(i)-1; fHO2(i)=fHO2(i)+1.5; fOH(i)=fOH(i)+.5; fCO(i)=fCO(i)+1.5; fCO2(i)=fCO2(i)+.5;

i=i+1;
Rnames{i} = 'BENZENE + OH = .57*HO2 + .29*xHO2 + .116*OH + .29*RO2C + .024*RO2XC + .024*zRNO3 + .29*xGLY + .57*CRES + .029*xAFG1 + .261*xAFG2 + .116*AFG3 + .314*yRAOOH - .976*XC';
k(:,i) = 2.33e-12.*exp(-193.237./T);
Gstr{i,1} = 'BENZENE'; Gstr{i,2} = 'OH';
fBENZENE(i)=fBENZENE(i)-1; fOH(i)=fOH(i)-1; fHO2(i)=fHO2(i)+.57; fxHO2(i)=fxHO2(i)+.29; fOH(i)=fOH(i)+.116; fRO2C(i)=fRO2C(i)+.29; fRO2XC(i)=fRO2XC(i)+.024; fzRNO3(i)=fzRNO3(i)+.024; fxGLY(i)=fxGLY(i)+.29; fCRES(i)=fCRES(i)+.57; fxAFG1(i)=fxAFG1(i)+.029; fxAFG2(i)=fxAFG2(i)+.261; fAFG3(i)=fAFG3(i)+.116; fyRAOOH(i)=fyRAOOH(i)+.314; fXC(i)=fXC(i)-.976;

i=i+1;
Rnames{i} = 'TOLUENE + OH = .181*HO2 + .454*xHO2 + .312*OH + .454*RO2C + .054*RO2XC + .054*zRNO3 + .238*xGLY + .151*xMGLY + .181*CRES + .065*xBALD + .195*xAFG1 + .195*xAFG2 + .312*AFG3 + .073*yR6OOH + .435*yRAOOH - .109*XC';
k(:,i) = 1.81e-12.*exp(338.164./T);
Gstr{i,1} = 'TOLUENE'; Gstr{i,2} = 'OH';
fTOLUENE(i)=fTOLUENE(i)-1; fOH(i)=fOH(i)-1; fHO2(i)=fHO2(i)+.181; fxHO2(i)=fxHO2(i)+.454; fOH(i)=fOH(i)+.312; fRO2C(i)=fRO2C(i)+.454; fRO2XC(i)=fRO2XC(i)+.054; fzRNO3(i)=fzRNO3(i)+.054; fxGLY(i)=fxGLY(i)+.238; fxMGLY(i)=fxMGLY(i)+.151; fCRES(i)=fCRES(i)+.181; fxBALD(i)=fxBALD(i)+.065; fxAFG1(i)=fxAFG1(i)+.195; fxAFG2(i)=fxAFG2(i)+.195; fAFG3(i)=fAFG3(i)+.312; fyR6OOH(i)=fyR6OOH(i)+.073; fyRAOOH(i)=fyRAOOH(i)+.435; fXC(i)=fXC(i)-.109;

i=i+1;
Rnames{i} = 'MXYLENE + OH = .159*HO2 + .52*xHO2 + .239*OH + .52*RO2C + .082*RO2XC + .082*zRNO3 + .1*xGLY + .38*xMGLY + .159*CRES + .041*xBALD + .336*xAFG1 + .144*xAFG2 + .239*AFG3 + .047*yR6OOH + .555*yRAOOH + .695*XC + XYLRO2';
k(:,i) = 2.31e-11;
Gstr{i,1} = 'MXYLENE'; Gstr{i,2} = 'OH';
fMXYLENE(i)=fMXYLENE(i)-1; fOH(i)=fOH(i)-1; fHO2(i)=fHO2(i)+.159; fxHO2(i)=fxHO2(i)+.52; fOH(i)=fOH(i)+.239; fRO2C(i)=fRO2C(i)+.52; fRO2XC(i)=fRO2XC(i)+.082; fzRNO3(i)=fzRNO3(i)+.082; fxGLY(i)=fxGLY(i)+.1; fxMGLY(i)=fxMGLY(i)+.38; fCRES(i)=fCRES(i)+.159; fxBALD(i)=fxBALD(i)+.041; fxAFG1(i)=fxAFG1(i)+.336; fxAFG2(i)=fxAFG2(i)+.144; fAFG3(i)=fAFG3(i)+.239; fyR6OOH(i)=fyR6OOH(i)+.047; fyRAOOH(i)=fyRAOOH(i)+.555; fXC(i)=fXC(i)+.695; fXYLRO2(i)=fXYLRO2(i)+1;

i=i+1;
Rnames{i} = 'OXYLENE + OH = .161*HO2 + .554*xHO2 + .198*OH + .554*RO2C + .087*RO2XC + .087*zRNO3 + .084*xGLY + .238*xMGLY + .185*xBACL + .161*CRES + .047*xBALD + .253*xAFG1 + .253*xAFG2 + .198*AFG3 + .055*yR6OOH + .586*yRAOOH + .484*XC';
k(:,i) = 1.36e-11;
Gstr{i,1} = 'OXYLENE'; Gstr{i,2} = 'OH';
fOXYLENE(i)=fOXYLENE(i)-1; fOH(i)=fOH(i)-1; fHO2(i)=fHO2(i)+.161; fxHO2(i)=fxHO2(i)+.554; fOH(i)=fOH(i)+.198; fRO2C(i)=fRO2C(i)+.554; fRO2XC(i)=fRO2XC(i)+.087; fzRNO3(i)=fzRNO3(i)+.087; fxGLY(i)=fxGLY(i)+.084; fxMGLY(i)=fxMGLY(i)+.238; fxBACL(i)=fxBACL(i)+.185; fCRES(i)=fCRES(i)+.161; fxBALD(i)=fxBALD(i)+.047; fxAFG1(i)=fxAFG1(i)+.253; fxAFG2(i)=fxAFG2(i)+.253; fAFG3(i)=fAFG3(i)+.198; fyR6OOH(i)=fyR6OOH(i)+.055; fyRAOOH(i)=fyRAOOH(i)+.586; fXC(i)=fXC(i)+.484;

i=i+1;
Rnames{i} = 'PXYLENE + OH = .159*HO2 + .487*xHO2 + .278*OH + .487*RO2C + .076*RO2XC + .076*zRNO3 + .286*xGLY + .112*xMGLY + .159*CRES + .088*xBALD + .045*xAFG1 + .067*xAFG2 + .278*AFG3 + .286*xAFG3 + .102*yR6OOH + .461*yRAOOH + .399*XC';
k(:,i) = 1.43e-11;
Gstr{i,1} = 'PXYLENE'; Gstr{i,2} = 'OH';
fPXYLENE(i)=fPXYLENE(i)-1; fOH(i)=fOH(i)-1; fHO2(i)=fHO2(i)+.159; fxHO2(i)=fxHO2(i)+.487; fOH(i)=fOH(i)+.278; fRO2C(i)=fRO2C(i)+.487; fRO2XC(i)=fRO2XC(i)+.076; fzRNO3(i)=fzRNO3(i)+.076; fxGLY(i)=fxGLY(i)+.286; fxMGLY(i)=fxMGLY(i)+.112; fCRES(i)=fCRES(i)+.159; fxBALD(i)=fxBALD(i)+.088; fxAFG1(i)=fxAFG1(i)+.045; fxAFG2(i)=fxAFG2(i)+.067; fAFG3(i)=fAFG3(i)+.278; fxAFG3(i)=fxAFG3(i)+.286; fyR6OOH(i)=fyR6OOH(i)+.102; fyRAOOH(i)=fyRAOOH(i)+.461; fXC(i)=fXC(i)+.399;

i=i+1;
Rnames{i} = 'TMB124 + OH = .022*HO2 + .627*xHO2 + .23*OH + .627*RO2C + .121*RO2XC + .121*zRNO3 + .074*xGLY + .405*xMGLY + .112*xBACL + .022*CRES + .036*xBALD + .088*xAFG1 + .352*xAFG2 + .23*AFG3 + .151*xAFG3 + .043*yR6OOH + .705*yRAOOH + 1.19*XC';
k(:,i) = 3.25e-11;
Gstr{i,1} = 'TMB124'; Gstr{i,2} = 'OH';
fTMB124(i)=fTMB124(i)-1; fOH(i)=fOH(i)-1; fHO2(i)=fHO2(i)+.022; fxHO2(i)=fxHO2(i)+.627; fOH(i)=fOH(i)+.23; fRO2C(i)=fRO2C(i)+.627; fRO2XC(i)=fRO2XC(i)+.121; fzRNO3(i)=fzRNO3(i)+.121; fxGLY(i)=fxGLY(i)+.074; fxMGLY(i)=fxMGLY(i)+.405; fxBACL(i)=fxBACL(i)+.112; fCRES(i)=fCRES(i)+.022; fxBALD(i)=fxBALD(i)+.036; fxAFG1(i)=fxAFG1(i)+.088; fxAFG2(i)=fxAFG2(i)+.352; fAFG3(i)=fAFG3(i)+.23; fxAFG3(i)=fxAFG3(i)+.151; fyR6OOH(i)=fyR6OOH(i)+.043; fyRAOOH(i)=fyRAOOH(i)+.705; fXC(i)=fXC(i)+1.19;

i=i+1;
Rnames{i} = 'ETOH + OH = .95*HO2 + .05*xHO2 + .05*RO2C + .081*xHCHO + .95*CCHO + .01*xHOCCHO + .05*yROOH - .001*XC';
k(:,i) = 5.49e-13.*(T./300).^2.00.*exp(529.891./T);
Gstr{i,1} = 'ETOH'; Gstr{i,2} = 'OH';
fETOH(i)=fETOH(i)-1; fOH(i)=fOH(i)-1; fHO2(i)=fHO2(i)+.95; fxHO2(i)=fxHO2(i)+.05; fRO2C(i)=fRO2C(i)+.05; fxHCHO(i)=fxHCHO(i)+.081; fCCHO(i)=fCCHO(i)+.95; fxHOCCHO(i)=fxHOCCHO(i)+.01; fyROOH(i)=fyROOH(i)+.05; fXC(i)=fXC(i)-.001;

i=i+1;
Rnames{i} = 'ALK1 + OH = xHO2 + RO2C + xCCHO + yROOH';
k(:,i) = 1.34e-12.*(T./300).^2.00.*exp(-499.195./T);
Gstr{i,1} = 'ALK1'; Gstr{i,2} = 'OH';
fALK1(i)=fALK1(i)-1; fOH(i)=fOH(i)-1; fxHO2(i)=fxHO2(i)+1; fRO2C(i)=fRO2C(i)+1; fxCCHO(i)=fxCCHO(i)+1; fyROOH(i)=fyROOH(i)+1;

i=i+1;
Rnames{i} = 'ALK2 + OH = .965*xHO2 + .965*RO2C + .035*RO2XC + .035*zRNO3 + .261*xRCHO + .704*xACET + yROOH - .105*XC';
k(:,i) = 1.49e-12.*(T./300).^2.00.*exp(-87.057./T);
Gstr{i,1} = 'ALK2'; Gstr{i,2} = 'OH';
fALK2(i)=fALK2(i)-1; fOH(i)=fOH(i)-1; fxHO2(i)=fxHO2(i)+.965; fRO2C(i)=fRO2C(i)+.965; fRO2XC(i)=fRO2XC(i)+.035; fzRNO3(i)=fzRNO3(i)+.035; fxRCHO(i)=fxRCHO(i)+.261; fxACET(i)=fxACET(i)+.704; fyROOH(i)=fyROOH(i)+1; fXC(i)=fXC(i)-.105;

i=i+1;
Rnames{i} = 'ALK3 + OH = .695*xHO2 + .236*xTBUO + 1.253*RO2C + .07*RO2XC + .07*zRNO3 + .026*xHCHO + .445*xCCHO + .122*xRCHO + .024*xACET + .332*xMEK + .983*yROOH + .017*yR6OOH - .046*XC';
k(:,i) = 1.51e-12.*exp(126.308./T);
Gstr{i,1} = 'ALK3'; Gstr{i,2} = 'OH';
fALK3(i)=fALK3(i)-1; fOH(i)=fOH(i)-1; fxHO2(i)=fxHO2(i)+.695; fxTBUO(i)=fxTBUO(i)+.236; fRO2C(i)=fRO2C(i)+1.253; fRO2XC(i)=fRO2XC(i)+.07; fzRNO3(i)=fzRNO3(i)+.07; fxHCHO(i)=fxHCHO(i)+.026; fxCCHO(i)=fxCCHO(i)+.445; fxRCHO(i)=fxRCHO(i)+.122; fxACET(i)=fxACET(i)+.024; fxMEK(i)=fxMEK(i)+.332; fyROOH(i)=fyROOH(i)+.983; fyR6OOH(i)=fyR6OOH(i)+.017; fXC(i)=fXC(i)-.046;

i=i+1;
Rnames{i} = 'ALK4 + OH = .83*xHO2 + .01*xMEO2 + .011*xMECO3 + 1.763*RO2C + .149*RO2XC + .149*zRNO3 + .002*xCO + .029*xHCHO + .438*xCCHO + .236*xRCHO + .426*xACET + .106*xMEK + .146*xPROD2 + yR6OOH - .119*XC';
k(:,i) = 3.75e-12.*exp(44.283./T);
Gstr{i,1} = 'ALK4'; Gstr{i,2} = 'OH';
fALK4(i)=fALK4(i)-1; fOH(i)=fOH(i)-1; fxHO2(i)=fxHO2(i)+.83; fxMEO2(i)=fxMEO2(i)+.01; fxMECO3(i)=fxMECO3(i)+.011; fRO2C(i)=fRO2C(i)+1.763; fRO2XC(i)=fRO2XC(i)+.149; fzRNO3(i)=fzRNO3(i)+.149; fxCO(i)=fxCO(i)+.002; fxHCHO(i)=fxHCHO(i)+.029; fxCCHO(i)=fxCCHO(i)+.438; fxRCHO(i)=fxRCHO(i)+.236; fxACET(i)=fxACET(i)+.426; fxMEK(i)=fxMEK(i)+.106; fxPROD2(i)=fxPROD2(i)+.146; fyR6OOH(i)=fyR6OOH(i)+1; fXC(i)=fXC(i)-.119;

i=i+1;
Rnames{i} = 'ALK5 + OH = .647*xHO2 + 1.605*RO2C + .353*RO2XC + .353*zRNO3 + .04*xHCHO + .106*xCCHO + .209*xRCHO + .071*xACET + .086*xMEK + .407*xPROD2 + yR6OOH + 2.004*XC';
k(:,i) = 2.70e-12.*exp(374.396./T);
Gstr{i,1} = 'ALK5'; Gstr{i,2} = 'OH';
fALK5(i)=fALK5(i)-1; fOH(i)=fOH(i)-1; fxHO2(i)=fxHO2(i)+.647; fRO2C(i)=fRO2C(i)+1.605; fRO2XC(i)=fRO2XC(i)+.353; fzRNO3(i)=fzRNO3(i)+.353; fxHCHO(i)=fxHCHO(i)+.04; fxCCHO(i)=fxCCHO(i)+.106; fxRCHO(i)=fxRCHO(i)+.209; fxACET(i)=fxACET(i)+.071; fxMEK(i)=fxMEK(i)+.086; fxPROD2(i)=fxPROD2(i)+.407; fyR6OOH(i)=fyR6OOH(i)+1; fXC(i)=fXC(i)+2.004;

i=i+1;
Rnames{i} = 'OLE1+ OH = .871*xHO2 + .001*xMEO2 + 1.202*RO2C + .128*RO2XC + .128*zRNO3 + .582*xHCHO + .01*xCCHO + .007*xHOCCHO + .666*xRCHO + .007*xACET + 0.036*xACRO + .001*xMACR + .012*xMVK + .009*xIPRD + .168*xPROD2 + .169*yROOH + .831*yR6OOH + .383*XC';
k(:,i) = 6.72e-12.*exp(501.208./T);
Gstr{i,1} = 'OLE1'; Gstr{i,2} = 'OH';
fOLE1(i)=fOLE1(i)-1; fOH(i)=fOH(i)-1; fxHO2(i)=fxHO2(i)+.871; fxMEO2(i)=fxMEO2(i)+.001; fRO2C(i)=fRO2C(i)+1.202; fRO2XC(i)=fRO2XC(i)+.128; fzRNO3(i)=fzRNO3(i)+.128; fxHCHO(i)=fxHCHO(i)+.582; fxCCHO(i)=fxCCHO(i)+.01; fxHOCCHO(i)=fxHOCCHO(i)+.007; fxRCHO(i)=fxRCHO(i)+.666; fxACET(i)=fxACET(i)+.007; fxACRO(i)=fxACRO(i)+0.036; fxMACR(i)=fxMACR(i)+.001; fxMVK(i)=fxMVK(i)+.012; fxIPRD(i)=fxIPRD(i)+.009; fxPROD2(i)=fxPROD2(i)+.168; fyROOH(i)=fyROOH(i)+.169; fyR6OOH(i)=fyR6OOH(i)+.831; fXC(i)=fXC(i)+.383;

i=i+1;
Rnames{i} = 'OLE1+ O3 = .095*HO2 + .057*xHO2 + .128*OH + .09*RO2C + .005*RO2XC + .005*zRNO3 + .303*CO + .088*CO2 + .5*HCHO + .011*xCCHO + .5*RCHO + .044*xRCHO + .003*xACET + .009*MEK + .185*HCOOH + .159*RCOOH + .268*PROD2 + .011*yROOH + .052*yR6OOH + .11*XC';
k(:,i) = 3.19e-15.*exp(-1700.382./T);
Gstr{i,1} = 'OLE1'; Gstr{i,2} = 'O3';
fOLE1(i)=fOLE1(i)-1; fO3(i)=fO3(i)-1; fHO2(i)=fHO2(i)+.095; fxHO2(i)=fxHO2(i)+.057; fOH(i)=fOH(i)+.128; fRO2C(i)=fRO2C(i)+.09; fRO2XC(i)=fRO2XC(i)+.005; fzRNO3(i)=fzRNO3(i)+.005; fCO(i)=fCO(i)+.303; fCO2(i)=fCO2(i)+.088; fHCHO(i)=fHCHO(i)+.5; fxCCHO(i)=fxCCHO(i)+.011; fRCHO(i)=fRCHO(i)+.5; fxRCHO(i)=fxRCHO(i)+.044; fxACET(i)=fxACET(i)+.003; fMEK(i)=fMEK(i)+.009; fHCOOH(i)=fHCOOH(i)+.185; fRCOOH(i)=fRCOOH(i)+.159; fPROD2(i)=fPROD2(i)+.268; fyROOH(i)=fyROOH(i)+.011; fyR6OOH(i)=fyR6OOH(i)+.052; fXC(i)=fXC(i)+.11;

i=i+1;
Rnames{i} = 'OLE1+ NO3 = .772*xHO2 + 1.463*RO2C + .228*RO2XC + .228*zRNO3 + .013*xCCHO + .003*xRCHO + .034*xACET + .774*xRNO3 + .169*yROOH + .831*yR6OOH + .226*XN - 1.149*XC';
k(:,i) = 5.37e-13.*exp(-1047.202./T);
Gstr{i,1} = 'OLE1'; Gstr{i,2} = 'NO3';
fOLE1(i)=fOLE1(i)-1; fNO3(i)=fNO3(i)-1; fxHO2(i)=fxHO2(i)+.772; fRO2C(i)=fRO2C(i)+1.463; fRO2XC(i)=fRO2XC(i)+.228; fzRNO3(i)=fzRNO3(i)+.228; fxCCHO(i)=fxCCHO(i)+.013; fxRCHO(i)=fxRCHO(i)+.003; fxACET(i)=fxACET(i)+.034; fxRNO3(i)=fxRNO3(i)+.774; fyROOH(i)=fyROOH(i)+.169; fyR6OOH(i)=fyR6OOH(i)+.831; fXN(i)=fXN(i)+.226; fXC(i)=fXC(i)-1.149;

i=i+1;
Rnames{i} = 'OLE1+ O3P = .45*RCHO + .39*MEK + .16*PROD2 + 1.13*XC';
k(:,i) = 1.61e-11.*exp(-326.087./T);
Gstr{i,1} = 'OLE1'; Gstr{i,2} = 'O3P';
fOLE1(i)=fOLE1(i)-1; fO3P(i)=fO3P(i)-1; fRCHO(i)=fRCHO(i)+.45; fMEK(i)=fMEK(i)+.39; fPROD2(i)=fPROD2(i)+.16; fXC(i)=fXC(i)+1.13;

i=i+1;
Rnames{i} = 'OLE2+ OH = .912*xHO2 + .953*RO2C + .088*RO2XC + .088*zRNO3 + .179*xHCHO + .835*xCCHO + .51*xRCHO + .144*xACET + .08*xMEK + .002*xMVK + .012*xIPRD + .023*xPROD2 + .319*yROOH + .681*yR6OOH + .135*XC';
k(:,i) = 1.26e-11.*exp(487.621./T);
Gstr{i,1} = 'OLE2'; Gstr{i,2} = 'OH';
fOLE2(i)=fOLE2(i)-1; fOH(i)=fOH(i)-1; fxHO2(i)=fxHO2(i)+.912; fRO2C(i)=fRO2C(i)+.953; fRO2XC(i)=fRO2XC(i)+.088; fzRNO3(i)=fzRNO3(i)+.088; fxHCHO(i)=fxHCHO(i)+.179; fxCCHO(i)=fxCCHO(i)+.835; fxRCHO(i)=fxRCHO(i)+.51; fxACET(i)=fxACET(i)+.144; fxMEK(i)=fxMEK(i)+.08; fxMVK(i)=fxMVK(i)+.002; fxIPRD(i)=fxIPRD(i)+.012; fxPROD2(i)=fxPROD2(i)+.023; fyROOH(i)=fyROOH(i)+.319; fyR6OOH(i)=fyR6OOH(i)+.681; fXC(i)=fXC(i)+.135;

i=i+1;
Rnames{i} = 'OLE2+ O3 = .094*HO2 + .041*xHO2 + .443*OH + .307*MEO2 + .156*xMECO3 + .008*xRCO3 + .212*RO2C + .003*RO2XC + .003*zRNO3 + .299*CO + .161*CO2 + .131*HCHO + .114*xHCHO + .453*CCHO + .071*xCCHO + .333*RCHO + .019*xRCHO + .051*ACET + .033*MEK + .001*xMEK + .024*HCOOH + .065*CCOOH + .235*RCOOH + .037*PROD2 + .073*yROOH + .136*yR6OOH + .16*XC';
k(:,i) = 8.59e-15.*exp(-1255.032./T);
Gstr{i,1} = 'OLE2'; Gstr{i,2} = 'O3';
fOLE2(i)=fOLE2(i)-1; fO3(i)=fO3(i)-1; fHO2(i)=fHO2(i)+.094; fxHO2(i)=fxHO2(i)+.041; fOH(i)=fOH(i)+.443; fMEO2(i)=fMEO2(i)+.307; fxMECO3(i)=fxMECO3(i)+.156; fxRCO3(i)=fxRCO3(i)+.008; fRO2C(i)=fRO2C(i)+.212; fRO2XC(i)=fRO2XC(i)+.003; fzRNO3(i)=fzRNO3(i)+.003; fCO(i)=fCO(i)+.299; fCO2(i)=fCO2(i)+.161; fHCHO(i)=fHCHO(i)+.131; fxHCHO(i)=fxHCHO(i)+.114; fCCHO(i)=fCCHO(i)+.453; fxCCHO(i)=fxCCHO(i)+.071; fRCHO(i)=fRCHO(i)+.333; fxRCHO(i)=fxRCHO(i)+.019; fACET(i)=fACET(i)+.051; fMEK(i)=fMEK(i)+.033; fxMEK(i)=fxMEK(i)+.001; fHCOOH(i)=fHCOOH(i)+.024; fCCOOH(i)=fCCOOH(i)+.065; fRCOOH(i)=fRCOOH(i)+.235; fPROD2(i)=fPROD2(i)+.037; fyROOH(i)=fyROOH(i)+.073; fyR6OOH(i)=fyR6OOH(i)+.136; fXC(i)=fXC(i)+.16;

i=i+1;
Rnames{i} = 'OLE2+ NO3 = .4*xHO2 + .426*xNO2 + .035*xMEO2 + 1.193*RO2C + .14*RO2XC + .14*zRNO3 + .072*xHCHO + .579*xCCHO + .163*xRCHO + .116*xACET + .002*xMEK + .32*xRNO3 + .319*yROOH + .681*yR6OOH + .254*XN + .13*XC';
k(:,i) = 2.31e-13.*exp(381.944./T);
Gstr{i,1} = 'OLE2'; Gstr{i,2} = 'NO3';
fOLE2(i)=fOLE2(i)-1; fNO3(i)=fNO3(i)-1; fxHO2(i)=fxHO2(i)+.4; fxNO2(i)=fxNO2(i)+.426; fxMEO2(i)=fxMEO2(i)+.035; fRO2C(i)=fRO2C(i)+1.193; fRO2XC(i)=fRO2XC(i)+.14; fzRNO3(i)=fzRNO3(i)+.14; fxHCHO(i)=fxHCHO(i)+.072; fxCCHO(i)=fxCCHO(i)+.579; fxRCHO(i)=fxRCHO(i)+.163; fxACET(i)=fxACET(i)+.116; fxMEK(i)=fxMEK(i)+.002; fxRNO3(i)=fxRNO3(i)+.32; fyROOH(i)=fyROOH(i)+.319; fyR6OOH(i)=fyR6OOH(i)+.681; fXN(i)=fXN(i)+.254; fXC(i)=fXC(i)+.13;

i=i+1;
Rnames{i} = 'OLE2+ O3P = .079*RCHO + .751*MEK + .17*PROD2 + .739*XC';
k(:,i) = 1.43e-11.*exp(110.709./T);
Gstr{i,1} = 'OLE2'; Gstr{i,2} = 'O3P';
fOLE2(i)=fOLE2(i)-1; fO3P(i)=fO3P(i)-1; fRCHO(i)=fRCHO(i)+.079; fMEK(i)=fMEK(i)+.751; fPROD2(i)=fPROD2(i)+.17; fXC(i)=fXC(i)+.739;

i=i+1;
Rnames{i} = 'ARO1+ OH = .123*HO2 + .566*xHO2 + .202*OH + .566*RO2C + .11*RO2XC + .11*zRNO3 + .158*xGLY + .1*xMGLY + .123*CRES + .072*xAFG1 + .185*xAFG2 + .202*AFG3 + .309*xPROD2 + .369*yR6OOH + .31*XC';
k(:,i) = 7.84e-12;
Gstr{i,1} = 'ARO1'; Gstr{i,2} = 'OH';
fARO1(i)=fARO1(i)-1; fOH(i)=fOH(i)-1; fHO2(i)=fHO2(i)+.123; fxHO2(i)=fxHO2(i)+.566; fOH(i)=fOH(i)+.202; fRO2C(i)=fRO2C(i)+.566; fRO2XC(i)=fRO2XC(i)+.11; fzRNO3(i)=fzRNO3(i)+.11; fxGLY(i)=fxGLY(i)+.158; fxMGLY(i)=fxMGLY(i)+.1; fCRES(i)=fCRES(i)+.123; fxAFG1(i)=fxAFG1(i)+.072; fxAFG2(i)=fxAFG2(i)+.185; fAFG3(i)=fAFG3(i)+.202; fxPROD2(i)=fxPROD2(i)+.309; fyR6OOH(i)=fyR6OOH(i)+.369; fXC(i)=fXC(i)+.31;

i=i+1;
Rnames{i} = 'ARO2+ OH = .077*HO2 + .617*xHO2 + .178*OH + .617*RO2C + .128*RO2XC + .128*zRNO3 + .088*xGLY + .312*xMGLY + .134*xBACL + .077*CRES + .026*xBALD + .221*xAFG1 + .247*xAFG2 + .178*AFG3 + .068*xAFG3 + .057*xPROD2 + .101*yR6OOH + 1.459*XC';
k(:,i) = 3.09e-11;
Gstr{i,1} = 'ARO2'; Gstr{i,2} = 'OH';
fARO2(i)=fARO2(i)-1; fOH(i)=fOH(i)-1; fHO2(i)=fHO2(i)+.077; fxHO2(i)=fxHO2(i)+.617; fOH(i)=fOH(i)+.178; fRO2C(i)=fRO2C(i)+.617; fRO2XC(i)=fRO2XC(i)+.128; fzRNO3(i)=fzRNO3(i)+.128; fxGLY(i)=fxGLY(i)+.088; fxMGLY(i)=fxMGLY(i)+.312; fxBACL(i)=fxBACL(i)+.134; fCRES(i)=fCRES(i)+.077; fxBALD(i)=fxBALD(i)+.026; fxAFG1(i)=fxAFG1(i)+.221; fxAFG2(i)=fxAFG2(i)+.247; fAFG3(i)=fAFG3(i)+.178; fxAFG3(i)=fxAFG3(i)+.068; fxPROD2(i)=fxPROD2(i)+.057; fyR6OOH(i)=fyR6OOH(i)+.101; fXC(i)=fXC(i)+1.459;

i=i+1;
Rnames{i} = 'TERP+ OH = .734*xHO2 + .064*xRCO3 + 1.211*RO2C + .201*RO2XC + .201*zRNO3 + .001*xCO + .411*xHCHO + .385*xRCHO + .037*xACET + .007*xMEK + .003*xMGLY + .009*xBACL + .003*xMVK + .002*xIPRD + .409*xPROD2 + yR6OOH + 4.375*XC';
k(:,i) = 2.27e-11.*exp(434.783./T);
Gstr{i,1} = 'TERP'; Gstr{i,2} = 'OH';
fTERP(i)=fTERP(i)-1; fOH(i)=fOH(i)-1; fxHO2(i)=fxHO2(i)+.734; fxRCO3(i)=fxRCO3(i)+.064; fRO2C(i)=fRO2C(i)+1.211; fRO2XC(i)=fRO2XC(i)+.201; fzRNO3(i)=fzRNO3(i)+.201; fxCO(i)=fxCO(i)+.001; fxHCHO(i)=fxHCHO(i)+.411; fxRCHO(i)=fxRCHO(i)+.385; fxACET(i)=fxACET(i)+.037; fxMEK(i)=fxMEK(i)+.007; fxMGLY(i)=fxMGLY(i)+.003; fxBACL(i)=fxBACL(i)+.009; fxMVK(i)=fxMVK(i)+.003; fxIPRD(i)=fxIPRD(i)+.002; fxPROD2(i)=fxPROD2(i)+.409; fyR6OOH(i)=fyR6OOH(i)+1; fXC(i)=fXC(i)+4.375;

i=i+1;
Rnames{i} = 'TERP+ O3 = .078*HO2 + .046*xHO2 + .499*OH + .202*xMECO3 + .059*xRCO3 + .49*RO2C + .121*RO2XC + .121*zRNO3 + .249*CO + .063*CO2 + .127*HCHO + .033*xHCHO + .208*xRCHO + .057*xACET + .002*MEK + .172*HCOOH + .068*RCOOH + .003*xMGLY + .039*xBACL + .002*xMACR + .001*xIPRD + .502*PROD2 + .428*yR6OOH + 3.852*XC';
k(:,i) = 8.28e-16.*exp(-785.024./T);
Gstr{i,1} = 'TERP'; Gstr{i,2} = 'O3';
fTERP(i)=fTERP(i)-1; fO3(i)=fO3(i)-1; fHO2(i)=fHO2(i)+.078; fxHO2(i)=fxHO2(i)+.046; fOH(i)=fOH(i)+.499; fxMECO3(i)=fxMECO3(i)+.202; fxRCO3(i)=fxRCO3(i)+.059; fRO2C(i)=fRO2C(i)+.49; fRO2XC(i)=fRO2XC(i)+.121; fzRNO3(i)=fzRNO3(i)+.121; fCO(i)=fCO(i)+.249; fCO2(i)=fCO2(i)+.063; fHCHO(i)=fHCHO(i)+.127; fxHCHO(i)=fxHCHO(i)+.033; fxRCHO(i)=fxRCHO(i)+.208; fxACET(i)=fxACET(i)+.057; fMEK(i)=fMEK(i)+.002; fHCOOH(i)=fHCOOH(i)+.172; fRCOOH(i)=fRCOOH(i)+.068; fxMGLY(i)=fxMGLY(i)+.003; fxBACL(i)=fxBACL(i)+.039; fxMACR(i)=fxMACR(i)+.002; fxIPRD(i)=fxIPRD(i)+.001; fPROD2(i)=fPROD2(i)+.502; fyR6OOH(i)=fyR6OOH(i)+.428; fXC(i)=fXC(i)+3.852;

i=i+1;
Rnames{i} = 'TERP+ NO3 = .227*xHO2 + .287*xNO2 + .026*xRCO3 + 1.786*RO2C + .46*RO2XC + .46*zRNO3 + .012*xCO + .023*xHCHO + .002*xHOCCHO + .403*xRCHO + .239*xACET + .005*xMACR + .001*xMVK + .004*xIPRD + .228*xRNO3 + yR6OOH + .485*XN + 3.785*XC';
k(:,i) = 1.33e-12.*exp(490.137./T);
Gstr{i,1} = 'TERP'; Gstr{i,2} = 'NO3';
fTERP(i)=fTERP(i)-1; fNO3(i)=fNO3(i)-1; fxHO2(i)=fxHO2(i)+.227; fxNO2(i)=fxNO2(i)+.287; fxRCO3(i)=fxRCO3(i)+.026; fRO2C(i)=fRO2C(i)+1.786; fRO2XC(i)=fRO2XC(i)+.46; fzRNO3(i)=fzRNO3(i)+.46; fxCO(i)=fxCO(i)+.012; fxHCHO(i)=fxHCHO(i)+.023; fxHOCCHO(i)=fxHOCCHO(i)+.002; fxRCHO(i)=fxRCHO(i)+.403; fxACET(i)=fxACET(i)+.239; fxMACR(i)=fxMACR(i)+.005; fxMVK(i)=fxMVK(i)+.001; fxIPRD(i)=fxIPRD(i)+.004; fxRNO3(i)=fxRNO3(i)+.228; fyR6OOH(i)=fyR6OOH(i)+1; fXN(i)=fXN(i)+.485; fXC(i)=fXC(i)+3.785;

i=i+1;
Rnames{i} = 'TERP+ O3P = .237*RCHO + .763*PROD2 + 4.711*XC';
k(:,i) = 4.02e-11;
Gstr{i,1} = 'TERP'; Gstr{i,2} = 'O3P';
fTERP(i)=fTERP(i)-1; fO3P(i)=fO3P(i)-1; fRCHO(i)=fRCHO(i)+.237; fPROD2(i)=fPROD2(i)+.763; fXC(i)=fXC(i)+4.711;

i=i+1;
Rnames{i} = 'SESQ + OH = .734*xHO2 + .064*xRCO3 + 1.211*RO2C + .201*RO2XC + .201*zRNO3 + .001*xCO + .411*xHCHO + .385*xRCHO + .037*xACET + .007*xMEK + .003*xMGLY + .009*xBACL + .003*xMVK + .002*xIPRD + .409*xPROD2 + yR6OOH + 9.375*XC';
k(:,i) = 2.27e-11.*exp(434.783./T);
Gstr{i,1} = 'SESQ'; Gstr{i,2} = 'OH';
fSESQ(i)=fSESQ(i)-1; fOH(i)=fOH(i)-1; fxHO2(i)=fxHO2(i)+.734; fxRCO3(i)=fxRCO3(i)+.064; fRO2C(i)=fRO2C(i)+1.211; fRO2XC(i)=fRO2XC(i)+.201; fzRNO3(i)=fzRNO3(i)+.201; fxCO(i)=fxCO(i)+.001; fxHCHO(i)=fxHCHO(i)+.411; fxRCHO(i)=fxRCHO(i)+.385; fxACET(i)=fxACET(i)+.037; fxMEK(i)=fxMEK(i)+.007; fxMGLY(i)=fxMGLY(i)+.003; fxBACL(i)=fxBACL(i)+.009; fxMVK(i)=fxMVK(i)+.003; fxIPRD(i)=fxIPRD(i)+.002; fxPROD2(i)=fxPROD2(i)+.409; fyR6OOH(i)=fyR6OOH(i)+1; fXC(i)=fXC(i)+9.375;

i=i+1;
Rnames{i} = 'SESQ + O3 = .078*HO2 + .046*xHO2 + .499*OH + .202*xMECO3 + .059*xRCO3 + .49*RO2C + .121*RO2XC + .121*zRNO3 + .249*CO + .063*CO2 + .127*HCHO + .033*xHCHO + .208*xRCHO + .057*xACET + .002*MEK + .172*HCOOH + .068*RCOOH + .003*xMGLY + .039*xBACL + .002*xMACR + .001*xIPRD + .502*PROD2 + .428*yR6OOH + 8.852*XC';
k(:,i) = 8.28e-16.*exp(-785.024./T);
Gstr{i,1} = 'SESQ'; Gstr{i,2} = 'O3';
fSESQ(i)=fSESQ(i)-1; fO3(i)=fO3(i)-1; fHO2(i)=fHO2(i)+.078; fxHO2(i)=fxHO2(i)+.046; fOH(i)=fOH(i)+.499; fxMECO3(i)=fxMECO3(i)+.202; fxRCO3(i)=fxRCO3(i)+.059; fRO2C(i)=fRO2C(i)+.49; fRO2XC(i)=fRO2XC(i)+.121; fzRNO3(i)=fzRNO3(i)+.121; fCO(i)=fCO(i)+.249; fCO2(i)=fCO2(i)+.063; fHCHO(i)=fHCHO(i)+.127; fxHCHO(i)=fxHCHO(i)+.033; fxRCHO(i)=fxRCHO(i)+.208; fxACET(i)=fxACET(i)+.057; fMEK(i)=fMEK(i)+.002; fHCOOH(i)=fHCOOH(i)+.172; fRCOOH(i)=fRCOOH(i)+.068; fxMGLY(i)=fxMGLY(i)+.003; fxBACL(i)=fxBACL(i)+.039; fxMACR(i)=fxMACR(i)+.002; fxIPRD(i)=fxIPRD(i)+.001; fPROD2(i)=fPROD2(i)+.502; fyR6OOH(i)=fyR6OOH(i)+.428; fXC(i)=fXC(i)+8.852;

i=i+1;
Rnames{i} = 'SESQ + NO3 = .227*xHO2 + .287*xNO2 + .026*xRCO3 + 1.786*RO2C + .46*RO2XC + .46*zRNO3 + .012*xCO + .023*xHCHO + .002*xCCHO + .403*xRCHO + .239*xACET + .005*xMACR + .001*xMVK + .004*xIPRD + .228*xRNO3 + yR6OOH + .485*XN + 8.785*XC';
k(:,i) = 1.33e-12.*exp(490.137./T);
Gstr{i,1} = 'SESQ'; Gstr{i,2} = 'NO3';
fSESQ(i)=fSESQ(i)-1; fNO3(i)=fNO3(i)-1; fxHO2(i)=fxHO2(i)+.227; fxNO2(i)=fxNO2(i)+.287; fxRCO3(i)=fxRCO3(i)+.026; fRO2C(i)=fRO2C(i)+1.786; fRO2XC(i)=fRO2XC(i)+.46; fzRNO3(i)=fzRNO3(i)+.46; fxCO(i)=fxCO(i)+.012; fxHCHO(i)=fxHCHO(i)+.023; fxCCHO(i)=fxCCHO(i)+.002; fxRCHO(i)=fxRCHO(i)+.403; fxACET(i)=fxACET(i)+.239; fxMACR(i)=fxMACR(i)+.005; fxMVK(i)=fxMVK(i)+.001; fxIPRD(i)=fxIPRD(i)+.004; fxRNO3(i)=fxRNO3(i)+.228; fyR6OOH(i)=fyR6OOH(i)+1; fXN(i)=fXN(i)+.485; fXC(i)=fXC(i)+8.785;

i=i+1;
Rnames{i} = 'SESQ + O3P = .237*RCHO + .763*PROD2 + 9.711*XC';
k(:,i) = 4.02e-11;
Gstr{i,1} = 'SESQ'; Gstr{i,2} = 'O3P';
fSESQ(i)=fSESQ(i)-1; fO3P(i)=fO3P(i)-1; fRCHO(i)=fRCHO(i)+.237; fPROD2(i)=fPROD2(i)+.763; fXC(i)=fXC(i)+9.711;

i=i+1;
Rnames{i} = 'CL2 + HV = 2*CL';
k(:,i) = JCL2;
Gstr{i,1} = 'CL2';
fCL2(i)=fCL2(i)-1; fCL(i)=fCL(i)+2;

i=i+1;
Rnames{i} = 'CL + NO + M = CLNO + M';
k(:,i) = 7.60e-32.*(T./300).^-1.80.*exp(-0.0./T);
Gstr{i,1} = 'CL'; Gstr{i,2} = 'NO'; Gstr{i,3} = 'M';
fCL(i)=fCL(i)-1; fNO(i)=fNO(i)-1; fM(i)=fM(i)-1; fCLNO(i)=fCLNO(i)+1; fM(i)=fM(i)+1;

i=i+1;
Rnames{i} = 'CLNO + HV = CL + NO';
k(:,i) = JCLNO_06;
Gstr{i,1} = 'CLNO';
fCLNO(i)=fCLNO(i)-1; fCL(i)=fCL(i)+1; fNO(i)=fNO(i)+1;

i=i+1;
Rnames{i} = 'CL + NO2 = CLONO';
k(:,i) = K_CL_NO2_CLONO;
Gstr{i,1} = 'CL'; Gstr{i,2} = 'NO2';
fCL(i)=fCL(i)-1; fNO2(i)=fNO2(i)-1; fCLONO(i)=fCLONO(i)+1;

i=i+1;
Rnames{i} = 'CL + NO2 = CLNO2';
k(:,i) = K_CL_NO2_CLNO2;
Gstr{i,1} = 'CL'; Gstr{i,2} = 'NO2';
fCL(i)=fCL(i)-1; fNO2(i)=fNO2(i)-1; fCLNO2(i)=fCLNO2(i)+1;

i=i+1;
Rnames{i} = 'CLONO + HV = CL + NO2';
k(:,i) = JCLONO;
Gstr{i,1} = 'CLONO';
fCLONO(i)=fCLONO(i)-1; fCL(i)=fCL(i)+1; fNO2(i)=fNO2(i)+1;

i=i+1;
Rnames{i} = 'CLNO2 + HV = CL + NO2';
k(:,i) = JCLNO2;
Gstr{i,1} = 'CLNO2';
fCLNO2(i)=fCLNO2(i)-1; fCL(i)=fCL(i)+1; fNO2(i)=fNO2(i)+1;

i=i+1;
Rnames{i} = 'CL + HO2 = HCL + O2';
k(:,i) = 3.44e-11.*(T./300).^-0.56.*exp(-0.0./T);
Gstr{i,1} = 'CL'; Gstr{i,2} = 'HO2';
fCL(i)=fCL(i)-1; fHO2(i)=fHO2(i)-1; fHCL(i)=fHCL(i)+1; fO2(i)=fO2(i)+1;

i=i+1;
Rnames{i} = 'CL + HO2 = CLO + OH';
k(:,i) = 9.41e-12.*(T./300).^2.10.*exp(-0.0./T);
Gstr{i,1} = 'CL'; Gstr{i,2} = 'HO2';
fCL(i)=fCL(i)-1; fHO2(i)=fHO2(i)-1; fCLO(i)=fCLO(i)+1; fOH(i)=fOH(i)+1;

i=i+1;
Rnames{i} = 'CL + O3 = CLO + O2';
k(:,i) = 2.80e-11.*exp(-250.101./T);
Gstr{i,1} = 'CL'; Gstr{i,2} = 'O3';
fCL(i)=fCL(i)-1; fO3(i)=fO3(i)-1; fCLO(i)=fCLO(i)+1; fO2(i)=fO2(i)+1;

i=i+1;
Rnames{i} = 'CL + NO3 = CLO + NO2';
k(:,i) = 2.40e-11;
Gstr{i,1} = 'CL'; Gstr{i,2} = 'NO3';
fCL(i)=fCL(i)-1; fNO3(i)=fNO3(i)-1; fCLO(i)=fCLO(i)+1; fNO2(i)=fNO2(i)+1;

i=i+1;
Rnames{i} = 'CLO + NO = CL + NO2';
k(:,i) = 6.20e-12.*exp(294.887./T);
Gstr{i,1} = 'CLO'; Gstr{i,2} = 'NO';
fCLO(i)=fCLO(i)-1; fNO(i)=fNO(i)-1; fCL(i)=fCL(i)+1; fNO2(i)=fNO2(i)+1;

i=i+1;
Rnames{i} = 'CLO + NO2 = CLONO2';
k(:,i) = K_CLO_NO2;
Gstr{i,1} = 'CLO'; Gstr{i,2} = 'NO2';
fCLO(i)=fCLO(i)-1; fNO2(i)=fNO2(i)-1; fCLONO2(i)=fCLONO2(i)+1;

i=i+1;
Rnames{i} = 'CLONO2 + HV = CLO + NO2';
k(:,i) = JCLONO2_1;
Gstr{i,1} = 'CLONO2';
fCLONO2(i)=fCLONO2(i)-1; fCLO(i)=fCLO(i)+1; fNO2(i)=fNO2(i)+1;

i=i+1;
Rnames{i} = 'CLONO2 + HV = CL + NO3';
k(:,i) = JCLONO2_2;
Gstr{i,1} = 'CLONO2';
fCLONO2(i)=fCLONO2(i)-1; fCL(i)=fCL(i)+1; fNO3(i)=fNO3(i)+1;

i=i+1;
Rnames{i} = 'CLONO2 = CLO + NO2';
k(:,i) = K_CLONO2;
Gstr{i,1} = 'CLONO2';
fCLONO2(i)=fCLONO2(i)-1; fCLO(i)=fCLO(i)+1; fNO2(i)=fNO2(i)+1;

i=i+1;
Rnames{i} = 'CL + CLONO2 = CL2 + NO3';
k(:,i) = 6.20e-12.*exp(144.928./T);
Gstr{i,1} = 'CL'; Gstr{i,2} = 'CLONO2';
fCL(i)=fCL(i)-1; fCLONO2(i)=fCLONO2(i)-1; fCL2(i)=fCL2(i)+1; fNO3(i)=fNO3(i)+1;

i=i+1;
Rnames{i} = 'CLO + HO2 = HOCL + O2';
k(:,i) = 2.20e-12.*exp(340.177./T);
Gstr{i,1} = 'CLO'; Gstr{i,2} = 'HO2';
fCLO(i)=fCLO(i)-1; fHO2(i)=fHO2(i)-1; fHOCL(i)=fHOCL(i)+1; fO2(i)=fO2(i)+1;

i=i+1;
Rnames{i} = 'HOCL + HV = OH + CL';
k(:,i) = JHOCL_06;
Gstr{i,1} = 'HOCL';
fHOCL(i)=fHOCL(i)-1; fOH(i)=fOH(i)+1; fCL(i)=fCL(i)+1;

i=i+1;
Rnames{i} = 'CLO + CLO = .29*CL2 + 1.42*CL + O2';
k(:,i) = 1.25e-11.*exp(-1959.541./T);
Gstr{i,1} = 'CLO'; Gstr{i,2} = 'CLO';
fCLO(i)=fCLO(i)-1; fCLO(i)=fCLO(i)-1; fCL2(i)=fCL2(i)+.29; fCL(i)=fCL(i)+1.42; fO2(i)=fO2(i)+1;

i=i+1;
Rnames{i} = 'OH + HCL = H2O + CL';
k(:,i) = 1.70e-12.*exp(-229.972./T);
Gstr{i,1} = 'OH'; Gstr{i,2} = 'HCL';
fOH(i)=fOH(i)-1; fHCL(i)=fHCL(i)-1; fH2O(i)=fH2O(i)+1; fCL(i)=fCL(i)+1;

i=i+1;
Rnames{i} = 'CL + H2 = HCL + HO2';
k(:,i) = 3.90e-11.*exp(-2309.783./T);
Gstr{i,1} = 'CL'; Gstr{i,2} = 'H2';
fCL(i)=fCL(i)-1; fH2(i)=fH2(i)-1; fHCL(i)=fHCL(i)+1; fHO2(i)=fHO2(i)+1;

i=i+1;
Rnames{i} = 'HCHO + CL = HCL + HO2 + CO';
k(:,i) = 8.10e-11.*exp(-30.193./T);
Gstr{i,1} = 'HCHO'; Gstr{i,2} = 'CL';
fHCHO(i)=fHCHO(i)-1; fCL(i)=fCL(i)-1; fHCL(i)=fHCL(i)+1; fHO2(i)=fHO2(i)+1; fCO(i)=fCO(i)+1;

i=i+1;
Rnames{i} = 'CCHO + CL = HCL + MECO3';
k(:,i) = 8.00e-11;
Gstr{i,1} = 'CCHO'; Gstr{i,2} = 'CL';
fCCHO(i)=fCCHO(i)-1; fCL(i)=fCL(i)-1; fHCL(i)=fHCL(i)+1; fMECO3(i)=fMECO3(i)+1;

i=i+1;
Rnames{i} = 'MEOH + CL = HCL + HCHO + HO2';
k(:,i) = 5.50e-11.*exp(-0.0./T);
Gstr{i,1} = 'MEOH'; Gstr{i,2} = 'CL';
fMEOH(i)=fMEOH(i)-1; fCL(i)=fCL(i)-1; fHCL(i)=fHCL(i)+1; fHCHO(i)=fHCHO(i)+1; fHO2(i)=fHO2(i)+1;

i=i+1;
Rnames{i} = 'RCHO + CL = HCL + .9*RCO3 + .1*RO2C + xCCHO + xCO + xHO2 + .1*yROOH';
k(:,i) = 1.23e-10;
Gstr{i,1} = 'RCHO'; Gstr{i,2} = 'CL';
fRCHO(i)=fRCHO(i)-1; fCL(i)=fCL(i)-1; fHCL(i)=fHCL(i)+1; fRCO3(i)=fRCO3(i)+.9; fRO2C(i)=fRO2C(i)+.1; fxCCHO(i)=fxCCHO(i)+1; fxCO(i)=fxCO(i)+1; fxHO2(i)=fxHO2(i)+1; fyROOH(i)=fyROOH(i)+.1;

i=i+1;
Rnames{i} = 'ACET + CL = HCL + RO2C + xHCHO + xMECO3 + yROOH';
k(:,i) = 7.70e-11.*exp(-999.899./T);
Gstr{i,1} = 'ACET'; Gstr{i,2} = 'CL';
fACET(i)=fACET(i)-1; fCL(i)=fCL(i)-1; fHCL(i)=fHCL(i)+1; fRO2C(i)=fRO2C(i)+1; fxHCHO(i)=fxHCHO(i)+1; fxMECO3(i)=fxMECO3(i)+1; fyROOH(i)=fyROOH(i)+1;

i=i+1;
Rnames{i} = 'MEK + CL = HCL + .975*RO2C + .039*RO2XC + .039*zRNO3 + .84*xHO2 + .085*xMECO3 + .036*xRCO3 + .065*xHCHO + .07*xCCHO + .84*xRCHO + yROOH + .763*XC';
k(:,i) = 3.60e-11;
Gstr{i,1} = 'MEK'; Gstr{i,2} = 'CL';
fMEK(i)=fMEK(i)-1; fCL(i)=fCL(i)-1; fHCL(i)=fHCL(i)+1; fRO2C(i)=fRO2C(i)+.975; fRO2XC(i)=fRO2XC(i)+.039; fzRNO3(i)=fzRNO3(i)+.039; fxHO2(i)=fxHO2(i)+.84; fxMECO3(i)=fxMECO3(i)+.085; fxRCO3(i)=fxRCO3(i)+.036; fxHCHO(i)=fxHCHO(i)+.065; fxCCHO(i)=fxCCHO(i)+.07; fxRCHO(i)=fxRCHO(i)+.84; fyROOH(i)=fyROOH(i)+1; fXC(i)=fXC(i)+.763;

i=i+1;
Rnames{i} = 'RNO3 + CL = HCL + .038*NO2 + .055*HO2 + 1.282*RO2C + .202*RO2XC + .202*zRNO3 + .009*RCHO + .018*MEK + .012*PROD2 + .055*RNO3 + .159*xNO2 + .547*xHO2 + .045*xHCHO + .300*xCCHO + .020*xRCHO + .003*xACET + .041*xMEK + .046*xPROD2 + .547*xRNO3 + .908*yR6OOH + .201*XN - .149*XC';
k(:,i) = 1.92e-10;
Gstr{i,1} = 'RNO3'; Gstr{i,2} = 'CL';
fRNO3(i)=fRNO3(i)-1; fCL(i)=fCL(i)-1; fHCL(i)=fHCL(i)+1; fNO2(i)=fNO2(i)+.038; fHO2(i)=fHO2(i)+.055; fRO2C(i)=fRO2C(i)+1.282; fRO2XC(i)=fRO2XC(i)+.202; fzRNO3(i)=fzRNO3(i)+.202; fRCHO(i)=fRCHO(i)+.009; fMEK(i)=fMEK(i)+.018; fPROD2(i)=fPROD2(i)+.012; fRNO3(i)=fRNO3(i)+.055; fxNO2(i)=fxNO2(i)+.159; fxHO2(i)=fxHO2(i)+.547; fxHCHO(i)=fxHCHO(i)+.045; fxCCHO(i)=fxCCHO(i)+.300; fxRCHO(i)=fxRCHO(i)+.020; fxACET(i)=fxACET(i)+.003; fxMEK(i)=fxMEK(i)+.041; fxPROD2(i)=fxPROD2(i)+.046; fxRNO3(i)=fxRNO3(i)+.547; fyR6OOH(i)=fyR6OOH(i)+.908; fXN(i)=fXN(i)+.201; fXC(i)=fXC(i)-.149;

i=i+1;
Rnames{i} = 'PROD2 + CL = HCL + .314*HO2 + .680*RO2C + .116*RO2XC + .116*zRNO3 + .198*RCHO + .116*PROD2 + .541*xHO2 + .007*xMECO3 + .022*xRCO3 + .237*xHCHO + .109*xCCHO + .591*xRCHO + .051*xMEK + .040*xPROD2 + .686*yR6OOH + 1.262*XC';
k(:,i) = 2.00e-10;
Gstr{i,1} = 'PROD2'; Gstr{i,2} = 'CL';
fPROD2(i)=fPROD2(i)-1; fCL(i)=fCL(i)-1; fHCL(i)=fHCL(i)+1; fHO2(i)=fHO2(i)+.314; fRO2C(i)=fRO2C(i)+.680; fRO2XC(i)=fRO2XC(i)+.116; fzRNO3(i)=fzRNO3(i)+.116; fRCHO(i)=fRCHO(i)+.198; fPROD2(i)=fPROD2(i)+.116; fxHO2(i)=fxHO2(i)+.541; fxMECO3(i)=fxMECO3(i)+.007; fxRCO3(i)=fxRCO3(i)+.022; fxHCHO(i)=fxHCHO(i)+.237; fxCCHO(i)=fxCCHO(i)+.109; fxRCHO(i)=fxRCHO(i)+.591; fxMEK(i)=fxMEK(i)+.051; fxPROD2(i)=fxPROD2(i)+.040; fyR6OOH(i)=fyR6OOH(i)+.686; fXC(i)=fXC(i)+1.262;

i=i+1;
Rnames{i} = 'GLY + CL = HCL + .63*HO2 + 1.26*CO + .37*RCO3 - .37*XC';
k(:,i) = 8.10e-11.*exp(-30.193./T);
Gstr{i,1} = 'GLY'; Gstr{i,2} = 'CL';
fGLY(i)=fGLY(i)-1; fCL(i)=fCL(i)-1; fHCL(i)=fHCL(i)+1; fHO2(i)=fHO2(i)+.63; fCO(i)=fCO(i)+1.26; fRCO3(i)=fRCO3(i)+.37; fXC(i)=fXC(i)-.37;

i=i+1;
Rnames{i} = 'MGLY + CL = HCL + CO + MECO3';
k(:,i) = 8.00e-11;
Gstr{i,1} = 'MGLY'; Gstr{i,2} = 'CL';
fMGLY(i)=fMGLY(i)-1; fCL(i)=fCL(i)-1; fHCL(i)=fHCL(i)+1; fCO(i)=fCO(i)+1; fMECO3(i)=fMECO3(i)+1;

i=i+1;
Rnames{i} = 'CRES + CL = HCL + xHO2 + xBALD + yR6OOH';
k(:,i) = 6.20e-11;
Gstr{i,1} = 'CRES'; Gstr{i,2} = 'CL';
fCRES(i)=fCRES(i)-1; fCL(i)=fCL(i)-1; fHCL(i)=fHCL(i)+1; fxHO2(i)=fxHO2(i)+1; fxBALD(i)=fxBALD(i)+1; fyR6OOH(i)=fyR6OOH(i)+1;

i=i+1;
Rnames{i} = 'BALD + CL = HCL + BZCO3';
k(:,i) = 8.00e-11;
Gstr{i,1} = 'BALD'; Gstr{i,2} = 'CL';
fBALD(i)=fBALD(i)-1; fCL(i)=fCL(i)-1; fHCL(i)=fHCL(i)+1; fBZCO3(i)=fBZCO3(i)+1;

i=i+1;
Rnames{i} = 'ROOH + CL = HCL + .414*OH + .588*RO2C + .414*RCHO + .104*xOH + .482*xHO2 + .106*xHCHO + .104*xCCHO + .197*xRCHO + .285*xMEK + .586*yROOH - 0.287*XC';
k(:,i) = 1.66e-10;
Gstr{i,1} = 'ROOH'; Gstr{i,2} = 'CL';
fROOH(i)=fROOH(i)-1; fCL(i)=fCL(i)-1; fHCL(i)=fHCL(i)+1; fOH(i)=fOH(i)+.414; fRO2C(i)=fRO2C(i)+.588; fRCHO(i)=fRCHO(i)+.414; fxOH(i)=fxOH(i)+.104; fxHO2(i)=fxHO2(i)+.482; fxHCHO(i)=fxHCHO(i)+.106; fxCCHO(i)=fxCCHO(i)+.104; fxRCHO(i)=fxRCHO(i)+.197; fxMEK(i)=fxMEK(i)+.285; fyROOH(i)=fyROOH(i)+.586; fXC(i)=fXC(i)-0.287;

i=i+1;
Rnames{i} = 'R6OOH + CL = HCL + .145*OH + 1.078*RO2C + .117*RO2XC + .117*zRNO3 + .145*PROD2 + .502*xOH + .237*xHO2 + .186*xCCHO + .676*xRCHO + .28*xPROD2 + .855*yR6OOH + .348*XC';
k(:,i) = 3.00e-10;
Gstr{i,1} = 'R6OOH'; Gstr{i,2} = 'CL';
fR6OOH(i)=fR6OOH(i)-1; fCL(i)=fCL(i)-1; fHCL(i)=fHCL(i)+1; fOH(i)=fOH(i)+.145; fRO2C(i)=fRO2C(i)+1.078; fRO2XC(i)=fRO2XC(i)+.117; fzRNO3(i)=fzRNO3(i)+.117; fPROD2(i)=fPROD2(i)+.145; fxOH(i)=fxOH(i)+.502; fxHO2(i)=fxHO2(i)+.237; fxCCHO(i)=fxCCHO(i)+.186; fxRCHO(i)=fxRCHO(i)+.676; fxPROD2(i)=fxPROD2(i)+.28; fyR6OOH(i)=fyR6OOH(i)+.855; fXC(i)=fXC(i)+.348;

i=i+1;
Rnames{i} = 'RAOOH + CL = .404*HCL + .139*OH + .148*HO2 + .589*RO2C + .124*RO2XC + .124*zRNO3 + .074*PROD2 + .147*MGLY + .139*IPRD + .565*xHO2 + .024*xOH + .448*xRCHO + .026*xGLY + .030*xMEK + .252*xMGLY + .073*xAFG1 + .073*xAFG2 + .713*yR6OOH + 2.674*XC';
k(:,i) = 4.29e-10;
Gstr{i,1} = 'RAOOH'; Gstr{i,2} = 'CL';
fRAOOH(i)=fRAOOH(i)-1; fCL(i)=fCL(i)-1; fHCL(i)=fHCL(i)+.404; fOH(i)=fOH(i)+.139; fHO2(i)=fHO2(i)+.148; fRO2C(i)=fRO2C(i)+.589; fRO2XC(i)=fRO2XC(i)+.124; fzRNO3(i)=fzRNO3(i)+.124; fPROD2(i)=fPROD2(i)+.074; fMGLY(i)=fMGLY(i)+.147; fIPRD(i)=fIPRD(i)+.139; fxHO2(i)=fxHO2(i)+.565; fxOH(i)=fxOH(i)+.024; fxRCHO(i)=fxRCHO(i)+.448; fxGLY(i)=fxGLY(i)+.026; fxMEK(i)=fxMEK(i)+.030; fxMGLY(i)=fxMGLY(i)+.252; fxAFG1(i)=fxAFG1(i)+.073; fxAFG2(i)=fxAFG2(i)+.073; fyR6OOH(i)=fyR6OOH(i)+.713; fXC(i)=fXC(i)+2.674;

i=i+1;
Rnames{i} = 'ACRO + CL = .484*xHO2 + .274*xCL + .216*MACO3 + 1.032*RO2C + .026*RO2XC + .026*zRNO3 + .216*HCL + .484*xCO + .274*xHCHO + .274*xGLY + .484*xCLCCHO + .784*yROOH - .294*XC';
k(:,i) = 2.94e-10;
Gstr{i,1} = 'ACRO'; Gstr{i,2} = 'CL';
fACRO(i)=fACRO(i)-1; fCL(i)=fCL(i)-1; fxHO2(i)=fxHO2(i)+.484; fxCL(i)=fxCL(i)+.274; fMACO3(i)=fMACO3(i)+.216; fRO2C(i)=fRO2C(i)+1.032; fRO2XC(i)=fRO2XC(i)+.026; fzRNO3(i)=fzRNO3(i)+.026; fHCL(i)=fHCL(i)+.216; fxCO(i)=fxCO(i)+.484; fxHCHO(i)=fxHCHO(i)+.274; fxGLY(i)=fxGLY(i)+.274; fxCLCCHO(i)=fxCLCCHO(i)+.484; fyROOH(i)=fyROOH(i)+.784; fXC(i)=fXC(i)-.294;

i=i+1;
Rnames{i} = 'MACR + CL = .25*HCL + .165*MACO3 + .802*RO2C + .033*RO2XC + .033*zRNO3 + .802*xHO2 + .541*xCO + .082*xIPRD + .18*xCLCCHO + .541*xCLACET + .835*yROOH + .208*XC';
k(:,i) = 3.85e-10;
Gstr{i,1} = 'MACR'; Gstr{i,2} = 'CL';
fMACR(i)=fMACR(i)-1; fCL(i)=fCL(i)-1; fHCL(i)=fHCL(i)+.25; fMACO3(i)=fMACO3(i)+.165; fRO2C(i)=fRO2C(i)+.802; fRO2XC(i)=fRO2XC(i)+.033; fzRNO3(i)=fzRNO3(i)+.033; fxHO2(i)=fxHO2(i)+.802; fxCO(i)=fxCO(i)+.541; fxIPRD(i)=fxIPRD(i)+.082; fxCLCCHO(i)=fxCLCCHO(i)+.18; fxCLACET(i)=fxCLACET(i)+.541; fyROOH(i)=fyROOH(i)+.835; fXC(i)=fXC(i)+.208;

i=i+1;
Rnames{i} = 'MVK + CL = 1.283*RO2C + .053*RO2XC + .053*zRNO3 + .322*xHO2 + .625*xMECO3 + .947*xCLCCHO + yROOH + .538*XC';
k(:,i) = 2.32e-10;
Gstr{i,1} = 'MVK'; Gstr{i,2} = 'CL';
fMVK(i)=fMVK(i)-1; fCL(i)=fCL(i)-1; fRO2C(i)=fRO2C(i)+1.283; fRO2XC(i)=fRO2XC(i)+.053; fzRNO3(i)=fzRNO3(i)+.053; fxHO2(i)=fxHO2(i)+.322; fxMECO3(i)=fxMECO3(i)+.625; fxCLCCHO(i)=fxCLCCHO(i)+.947; fyROOH(i)=fyROOH(i)+1; fXC(i)=fXC(i)+.538;

i=i+1;
Rnames{i} = 'IPRD + CL = .401*HCL + .084*HO2 + .154*MACO3 + .73*RO2C + .051*RO2XC + .051*zRNO3 + .042*AFG1 + .042*AFG2 + .712*xHO2 + .498*xCO + .195*xHCHO + .017*xMGLY + .009*xAFG1 + .009*xAFG2 + .115*xIPRD + .14*xCLCCHO + .42*xCLACET + .762*yR6OOH + .709*XC';
k(:,i) = 4.12e-10;
Gstr{i,1} = 'IPRD'; Gstr{i,2} = 'CL';
fIPRD(i)=fIPRD(i)-1; fCL(i)=fCL(i)-1; fHCL(i)=fHCL(i)+.401; fHO2(i)=fHO2(i)+.084; fMACO3(i)=fMACO3(i)+.154; fRO2C(i)=fRO2C(i)+.73; fRO2XC(i)=fRO2XC(i)+.051; fzRNO3(i)=fzRNO3(i)+.051; fAFG1(i)=fAFG1(i)+.042; fAFG2(i)=fAFG2(i)+.042; fxHO2(i)=fxHO2(i)+.712; fxCO(i)=fxCO(i)+.498; fxHCHO(i)=fxHCHO(i)+.195; fxMGLY(i)=fxMGLY(i)+.017; fxAFG1(i)=fxAFG1(i)+.009; fxAFG2(i)=fxAFG2(i)+.009; fxIPRD(i)=fxIPRD(i)+.115; fxCLCCHO(i)=fxCLCCHO(i)+.14; fxCLACET(i)=fxCLACET(i)+.42; fyR6OOH(i)=fyR6OOH(i)+.762; fXC(i)=fXC(i)+.709;

i=i+1;
Rnames{i} = 'CLCCHO + HV = HO2 + CO + RO2C + xCL + xHCHO + yROOH';
k(:,i) = JCLCCHO;
Gstr{i,1} = 'CLCCHO';
fCLCCHO(i)=fCLCCHO(i)-1; fHO2(i)=fHO2(i)+1; fCO(i)=fCO(i)+1; fRO2C(i)=fRO2C(i)+1; fxCL(i)=fxCL(i)+1; fxHCHO(i)=fxHCHO(i)+1; fyROOH(i)=fyROOH(i)+1;

i=i+1;
Rnames{i} = 'CLCCHO + OH = RCO3 - 1*XC';
k(:,i) = 3.10e-12;
Gstr{i,1} = 'CLCCHO'; Gstr{i,2} = 'OH';
fCLCCHO(i)=fCLCCHO(i)-1; fOH(i)=fOH(i)-1; fRCO3(i)=fRCO3(i)+1; fXC(i)=fXC(i)-1;

i=i+1;
Rnames{i} = 'CLCCHO + CL = HCL + RCO3 - 1*XC';
k(:,i) = 1.29e-11;
Gstr{i,1} = 'CLCCHO'; Gstr{i,2} = 'CL';
fCLCCHO(i)=fCLCCHO(i)-1; fCL(i)=fCL(i)-1; fHCL(i)=fHCL(i)+1; fRCO3(i)=fRCO3(i)+1; fXC(i)=fXC(i)-1;

i=i+1;
Rnames{i} = 'CLACET + HV = MECO3 + RO2C + xCL + xHCHO + yROOH';
k(:,i) = JCLACET.*5.00e-1;
Gstr{i,1} = 'CLACET';
fCLACET(i)=fCLACET(i)-1; fMECO3(i)=fMECO3(i)+1; fRO2C(i)=fRO2C(i)+1; fxCL(i)=fxCL(i)+1; fxHCHO(i)=fxHCHO(i)+1; fyROOH(i)=fyROOH(i)+1;

i=i+1;
Rnames{i} = 'xCL + NO = NO + CL';
k(:,i) = 2.60e-12.*(T./300).^0.00.*exp(379.932./T);
Gstr{i,1} = 'xCL'; Gstr{i,2} = 'NO';
fxCL(i)=fxCL(i)-1; fNO(i)=fNO(i)-1; fNO(i)=fNO(i)+1; fCL(i)=fCL(i)+1;

i=i+1;
Rnames{i} = 'xCL + HO2 = HO2';
k(:,i) = 3.80e-13.*(T./300).^0.00.*exp(899.758./T);
Gstr{i,1} = 'xCL'; Gstr{i,2} = 'HO2';
fxCL(i)=fxCL(i)-1; fHO2(i)=fHO2(i)-1; fHO2(i)=fHO2(i)+1;

i=i+1;
Rnames{i} = 'xCL + NO3 = NO3 + CL';
k(:,i) = 2.30e-12;
Gstr{i,1} = 'xCL'; Gstr{i,2} = 'NO3';
fxCL(i)=fxCL(i)-1; fNO3(i)=fNO3(i)-1; fNO3(i)=fNO3(i)+1; fCL(i)=fCL(i)+1;

i=i+1;
Rnames{i} = 'xCL + MEO2 = MEO2 + .5*CL';
k(:,i) = 2.00e-13;
Gstr{i,1} = 'xCL'; Gstr{i,2} = 'MEO2';
fxCL(i)=fxCL(i)-1; fMEO2(i)=fMEO2(i)-1; fMEO2(i)=fMEO2(i)+1; fCL(i)=fCL(i)+.5;

i=i+1;
Rnames{i} = 'xCL + RO2C = RO2C + .5*CL';
k(:,i) = 3.50e-14;
Gstr{i,1} = 'xCL'; Gstr{i,2} = 'RO2C';
fxCL(i)=fxCL(i)-1; fRO2C(i)=fRO2C(i)-1; fRO2C(i)=fRO2C(i)+1; fCL(i)=fCL(i)+.5;

i=i+1;
Rnames{i} = 'xCL + RO2XC = RO2XC + .5*CL';
k(:,i) = 3.50e-14;
Gstr{i,1} = 'xCL'; Gstr{i,2} = 'RO2XC';
fxCL(i)=fxCL(i)-1; fRO2XC(i)=fRO2XC(i)-1; fRO2XC(i)=fRO2XC(i)+1; fCL(i)=fCL(i)+.5;

i=i+1;
Rnames{i} = 'xCL + MECO3 = MECO3 + CL';
k(:,i) = 4.40e-13.*(T./300).^0.00.*exp(1069.847./T);
Gstr{i,1} = 'xCL'; Gstr{i,2} = 'MECO3';
fxCL(i)=fxCL(i)-1; fMECO3(i)=fMECO3(i)-1; fMECO3(i)=fMECO3(i)+1; fCL(i)=fCL(i)+1;

i=i+1;
Rnames{i} = 'xCL + RCO3 = RCO3 + CL';
k(:,i) = 4.40e-13.*(T./300).^0.00.*exp(1069.847./T);
Gstr{i,1} = 'xCL'; Gstr{i,2} = 'RCO3';
fxCL(i)=fxCL(i)-1; fRCO3(i)=fRCO3(i)-1; fRCO3(i)=fRCO3(i)+1; fCL(i)=fCL(i)+1;

i=i+1;
Rnames{i} = 'xCL + BZCO3 = BZCO3 + CL';
k(:,i) = 4.40e-13.*(T./300).^0.00.*exp(1069.847./T);
Gstr{i,1} = 'xCL'; Gstr{i,2} = 'BZCO3';
fxCL(i)=fxCL(i)-1; fBZCO3(i)=fBZCO3(i)-1; fBZCO3(i)=fBZCO3(i)+1; fCL(i)=fCL(i)+1;

i=i+1;
Rnames{i} = 'xCL + MACO3 = MACO3 + CL';
k(:,i) = 4.40e-13.*(T./300).^0.00.*exp(1069.847./T);
Gstr{i,1} = 'xCL'; Gstr{i,2} = 'MACO3';
fxCL(i)=fxCL(i)-1; fMACO3(i)=fMACO3(i)-1; fMACO3(i)=fMACO3(i)+1; fCL(i)=fCL(i)+1;

i=i+1;
Rnames{i} = 'xCLCCHO + NO = NO + CLCCHO';
k(:,i) = 2.60e-12.*(T./300).^0.00.*exp(379.932./T);
Gstr{i,1} = 'xCLCCHO'; Gstr{i,2} = 'NO';
fxCLCCHO(i)=fxCLCCHO(i)-1; fNO(i)=fNO(i)-1; fNO(i)=fNO(i)+1; fCLCCHO(i)=fCLCCHO(i)+1;

i=i+1;
Rnames{i} = 'xCLCCHO + HO2 = HO2 + 2*XC';
k(:,i) = 3.80e-13.*(T./300).^0.00.*exp(899.758./T);
Gstr{i,1} = 'xCLCCHO'; Gstr{i,2} = 'HO2';
fxCLCCHO(i)=fxCLCCHO(i)-1; fHO2(i)=fHO2(i)-1; fHO2(i)=fHO2(i)+1; fXC(i)=fXC(i)+2;

i=i+1;
Rnames{i} = 'xCLCCHO + NO3 = NO3 + CLCCHO';
k(:,i) = 2.30e-12;
Gstr{i,1} = 'xCLCCHO'; Gstr{i,2} = 'NO3';
fxCLCCHO(i)=fxCLCCHO(i)-1; fNO3(i)=fNO3(i)-1; fNO3(i)=fNO3(i)+1; fCLCCHO(i)=fCLCCHO(i)+1;

i=i+1;
Rnames{i} = 'xCLCCHO + MEO2 = MEO2 + .5*CLCCHO + XC';
k(:,i) = 2.00e-13;
Gstr{i,1} = 'xCLCCHO'; Gstr{i,2} = 'MEO2';
fxCLCCHO(i)=fxCLCCHO(i)-1; fMEO2(i)=fMEO2(i)-1; fMEO2(i)=fMEO2(i)+1; fCLCCHO(i)=fCLCCHO(i)+.5; fXC(i)=fXC(i)+1;

i=i+1;
Rnames{i} = 'xCLCCHO + RO2C = RO2C + .5*CLCCHO + XC';
k(:,i) = 3.50e-14;
Gstr{i,1} = 'xCLCCHO'; Gstr{i,2} = 'RO2C';
fxCLCCHO(i)=fxCLCCHO(i)-1; fRO2C(i)=fRO2C(i)-1; fRO2C(i)=fRO2C(i)+1; fCLCCHO(i)=fCLCCHO(i)+.5; fXC(i)=fXC(i)+1;

i=i+1;
Rnames{i} = 'xCLCCHO + RO2XC = RO2XC + .5*CLCCHO + XC';
k(:,i) = 3.50e-14;
Gstr{i,1} = 'xCLCCHO'; Gstr{i,2} = 'RO2XC';
fxCLCCHO(i)=fxCLCCHO(i)-1; fRO2XC(i)=fRO2XC(i)-1; fRO2XC(i)=fRO2XC(i)+1; fCLCCHO(i)=fCLCCHO(i)+.5; fXC(i)=fXC(i)+1;

i=i+1;
Rnames{i} = 'xCLCCHO + MECO3 = MECO3 + CLCCHO';
k(:,i) = 4.40e-13.*(T./300).^0.00.*exp(1069.847./T);
Gstr{i,1} = 'xCLCCHO'; Gstr{i,2} = 'MECO3';
fxCLCCHO(i)=fxCLCCHO(i)-1; fMECO3(i)=fMECO3(i)-1; fMECO3(i)=fMECO3(i)+1; fCLCCHO(i)=fCLCCHO(i)+1;

i=i+1;
Rnames{i} = 'xCLCCHO + RCO3 = RCO3 + CLCCHO';
k(:,i) = 4.40e-13.*(T./300).^0.00.*exp(1069.847./T);
Gstr{i,1} = 'xCLCCHO'; Gstr{i,2} = 'RCO3';
fxCLCCHO(i)=fxCLCCHO(i)-1; fRCO3(i)=fRCO3(i)-1; fRCO3(i)=fRCO3(i)+1; fCLCCHO(i)=fCLCCHO(i)+1;

i=i+1;
Rnames{i} = 'xCLCCHO + BZCO3 = BZCO3 + CLCCHO';
k(:,i) = 4.40e-13.*(T./300).^0.00.*exp(1069.847./T);
Gstr{i,1} = 'xCLCCHO'; Gstr{i,2} = 'BZCO3';
fxCLCCHO(i)=fxCLCCHO(i)-1; fBZCO3(i)=fBZCO3(i)-1; fBZCO3(i)=fBZCO3(i)+1; fCLCCHO(i)=fCLCCHO(i)+1;

i=i+1;
Rnames{i} = 'xCLCCHO + MACO3 = MACO3 + CLCCHO';
k(:,i) = 4.40e-13.*(T./300).^0.00.*exp(1069.847./T);
Gstr{i,1} = 'xCLCCHO'; Gstr{i,2} = 'MACO3';
fxCLCCHO(i)=fxCLCCHO(i)-1; fMACO3(i)=fMACO3(i)-1; fMACO3(i)=fMACO3(i)+1; fCLCCHO(i)=fCLCCHO(i)+1;

i=i+1;
Rnames{i} = 'xCLACET + NO = NO + CLACET';
k(:,i) = 2.60e-12.*(T./300).^0.00.*exp(379.932./T);
Gstr{i,1} = 'xCLACET'; Gstr{i,2} = 'NO';
fxCLACET(i)=fxCLACET(i)-1; fNO(i)=fNO(i)-1; fNO(i)=fNO(i)+1; fCLACET(i)=fCLACET(i)+1;

i=i+1;
Rnames{i} = 'xCLACET + HO2 = HO2 + 3*XC';
k(:,i) = 3.80e-13.*(T./300).^0.00.*exp(899.758./T);
Gstr{i,1} = 'xCLACET'; Gstr{i,2} = 'HO2';
fxCLACET(i)=fxCLACET(i)-1; fHO2(i)=fHO2(i)-1; fHO2(i)=fHO2(i)+1; fXC(i)=fXC(i)+3;

i=i+1;
Rnames{i} = 'xCLACET + NO3 = NO3 + CLACET';
k(:,i) = 2.30e-12;
Gstr{i,1} = 'xCLACET'; Gstr{i,2} = 'NO3';
fxCLACET(i)=fxCLACET(i)-1; fNO3(i)=fNO3(i)-1; fNO3(i)=fNO3(i)+1; fCLACET(i)=fCLACET(i)+1;

i=i+1;
Rnames{i} = 'xCLACET + MEO2 = MEO2 + .5*CLACET + 1.5*XC';
k(:,i) = 2.00e-13;
Gstr{i,1} = 'xCLACET'; Gstr{i,2} = 'MEO2';
fxCLACET(i)=fxCLACET(i)-1; fMEO2(i)=fMEO2(i)-1; fMEO2(i)=fMEO2(i)+1; fCLACET(i)=fCLACET(i)+.5; fXC(i)=fXC(i)+1.5;

i=i+1;
Rnames{i} = 'xCLACET + RO2C = RO2C + .5*CLACET + 1.5*XC';
k(:,i) = 3.50e-14;
Gstr{i,1} = 'xCLACET'; Gstr{i,2} = 'RO2C';
fxCLACET(i)=fxCLACET(i)-1; fRO2C(i)=fRO2C(i)-1; fRO2C(i)=fRO2C(i)+1; fCLACET(i)=fCLACET(i)+.5; fXC(i)=fXC(i)+1.5;

i=i+1;
Rnames{i} = 'xCLACET + RO2XC = RO2XC + .5*CLACET + 1.5*XC';
k(:,i) = 3.50e-14;
Gstr{i,1} = 'xCLACET'; Gstr{i,2} = 'RO2XC';
fxCLACET(i)=fxCLACET(i)-1; fRO2XC(i)=fRO2XC(i)-1; fRO2XC(i)=fRO2XC(i)+1; fCLACET(i)=fCLACET(i)+.5; fXC(i)=fXC(i)+1.5;

i=i+1;
Rnames{i} = 'xCLACET + MECO3 = MECO3 + CLACET';
k(:,i) = 4.40e-13.*(T./300).^0.00.*exp(1069.847./T);
Gstr{i,1} = 'xCLACET'; Gstr{i,2} = 'MECO3';
fxCLACET(i)=fxCLACET(i)-1; fMECO3(i)=fMECO3(i)-1; fMECO3(i)=fMECO3(i)+1; fCLACET(i)=fCLACET(i)+1;

i=i+1;
Rnames{i} = 'xCLACET + RCO3 = RCO3 + CLACET';
k(:,i) = 4.40e-13.*(T./300).^0.00.*exp(1069.847./T);
Gstr{i,1} = 'xCLACET'; Gstr{i,2} = 'RCO3';
fxCLACET(i)=fxCLACET(i)-1; fRCO3(i)=fRCO3(i)-1; fRCO3(i)=fRCO3(i)+1; fCLACET(i)=fCLACET(i)+1;

i=i+1;
Rnames{i} = 'xCLACET + BZCO3 = BZCO3 + CLACET';
k(:,i) = 4.40e-13.*(T./300).^0.00.*exp(1069.847./T);
Gstr{i,1} = 'xCLACET'; Gstr{i,2} = 'BZCO3';
fxCLACET(i)=fxCLACET(i)-1; fBZCO3(i)=fBZCO3(i)-1; fBZCO3(i)=fBZCO3(i)+1; fCLACET(i)=fCLACET(i)+1;

i=i+1;
Rnames{i} = 'xCLACET + MACO3 = MACO3 + CLACET';
k(:,i) = 4.40e-13.*(T./300).^0.00.*exp(1069.847./T);
Gstr{i,1} = 'xCLACET'; Gstr{i,2} = 'MACO3';
fxCLACET(i)=fxCLACET(i)-1; fMACO3(i)=fMACO3(i)-1; fMACO3(i)=fMACO3(i)+1; fCLACET(i)=fCLACET(i)+1;

i=i+1;
Rnames{i} = 'CH4 + CL = HCL + MEO2';
k(:,i) = 7.30e-12.*exp(-1280.193./T);
Gstr{i,1} = 'CH4'; Gstr{i,2} = 'CL';
fCH4(i)=fCH4(i)-1; fCL(i)=fCL(i)-1; fHCL(i)=fHCL(i)+1; fMEO2(i)=fMEO2(i)+1;

i=i+1;
Rnames{i} = 'ETHENE + CL = xHO2 + 2*RO2C + xHCHO + CLCHO';
k(:,i) = K_ETHE_CL;
Gstr{i,1} = 'ETHENE'; Gstr{i,2} = 'CL';
fETHENE(i)=fETHENE(i)-1; fCL(i)=fCL(i)-1; fxHO2(i)=fxHO2(i)+1; fRO2C(i)=fRO2C(i)+2; fxHCHO(i)=fxHCHO(i)+1; fCLCHO(i)=fCLCHO(i)+1;

i=i+1;
Rnames{i} = 'PROPENE + CL = .124*HCL + .971*xHO2 + .971*RO2C + .029*RO2XC + .029*zRNO3 + .124*xACRO + .306*xCLCCHO + .54*xCLACET + yROOH + .222*XC';
k(:,i) = 2.67e-10;
Gstr{i,1} = 'PROPENE'; Gstr{i,2} = 'CL';
fPROPENE(i)=fPROPENE(i)-1; fCL(i)=fCL(i)-1; fHCL(i)=fHCL(i)+.124; fxHO2(i)=fxHO2(i)+.971; fRO2C(i)=fRO2C(i)+.971; fRO2XC(i)=fRO2XC(i)+.029; fzRNO3(i)=fzRNO3(i)+.029; fxACRO(i)=fxACRO(i)+.124; fxCLCCHO(i)=fxCLCCHO(i)+.306; fxCLACET(i)=fxCLACET(i)+.54; fyROOH(i)=fyROOH(i)+1; fXC(i)=fXC(i)+.222;

i=i+1;
Rnames{i} = 'BUTDE13E + CL = .39*xHO2 + .541*xCL + 1.884*RO2C + .069*RO2XC + .069*zRNO3 + .863*xHCHO + .457*xACRO + .473*xIPRD + yROOH - 1.013*XC';
k(:,i) = 4.90e-10;
Gstr{i,1} = 'BUTDE13E'; Gstr{i,2} = 'CL';
fBUTDE13E(i)=fBUTDE13E(i)-1; fCL(i)=fCL(i)-1; fxHO2(i)=fxHO2(i)+.39; fxCL(i)=fxCL(i)+.541; fRO2C(i)=fRO2C(i)+1.884; fRO2XC(i)=fRO2XC(i)+.069; fzRNO3(i)=fzRNO3(i)+.069; fxHCHO(i)=fxHCHO(i)+.863; fxACRO(i)=fxACRO(i)+.457; fxIPRD(i)=fxIPRD(i)+.473; fyROOH(i)=fyROOH(i)+1; fXC(i)=fXC(i)-1.013;

i=i+1;
Rnames{i} = 'ISOPRENE + CL = .15*HCL + .738*xHO2 + .177*xCL + 1.168*RO2C + .085*RO2XC + .085*zRNO3 + .275*xHCHO + .177*xMVK + .671*xIPRD + .067*xCLCCHO + yR6OOH + .018*XC';
k(:,i) = 4.80e-10;
Gstr{i,1} = 'ISOPRENE'; Gstr{i,2} = 'CL';
fISOPRENE(i)=fISOPRENE(i)-1; fCL(i)=fCL(i)-1; fHCL(i)=fHCL(i)+.15; fxHO2(i)=fxHO2(i)+.738; fxCL(i)=fxCL(i)+.177; fRO2C(i)=fRO2C(i)+1.168; fRO2XC(i)=fRO2XC(i)+.085; fzRNO3(i)=fzRNO3(i)+.085; fxHCHO(i)=fxHCHO(i)+.275; fxMVK(i)=fxMVK(i)+.177; fxIPRD(i)=fxIPRD(i)+.671; fxCLCCHO(i)=fxCLCCHO(i)+.067; fyR6OOH(i)=fyR6OOH(i)+1; fXC(i)=fXC(i)+.018;

i=i+1;
Rnames{i} = 'APINENE + CL = .548*HCL + .252*xHO2 + .068*xCL + .034*xMECO3 + .05*xRCO3 + .016*xMACO3 + 2.258*RO2C + .582*RO2XC + .582*zRNO3 + .035*xCO + .158*xHCHO + .185*xRCHO + .274*xACET + .007*xGLY + .003*xBACL + .003*xMVK + .158*xIPRD + .006*xAFG1 + .006*xAFG2 + .001*xAFG3 + .109*xCLCCHO + yR6OOH + 3.543*XC';
k(:,i) = 5.46e-10;
Gstr{i,1} = 'APINENE'; Gstr{i,2} = 'CL';
fAPINENE(i)=fAPINENE(i)-1; fCL(i)=fCL(i)-1; fHCL(i)=fHCL(i)+.548; fxHO2(i)=fxHO2(i)+.252; fxCL(i)=fxCL(i)+.068; fxMECO3(i)=fxMECO3(i)+.034; fxRCO3(i)=fxRCO3(i)+.05; fxMACO3(i)=fxMACO3(i)+.016; fRO2C(i)=fRO2C(i)+2.258; fRO2XC(i)=fRO2XC(i)+.582; fzRNO3(i)=fzRNO3(i)+.582; fxCO(i)=fxCO(i)+.035; fxHCHO(i)=fxHCHO(i)+.158; fxRCHO(i)=fxRCHO(i)+.185; fxACET(i)=fxACET(i)+.274; fxGLY(i)=fxGLY(i)+.007; fxBACL(i)=fxBACL(i)+.003; fxMVK(i)=fxMVK(i)+.003; fxIPRD(i)=fxIPRD(i)+.158; fxAFG1(i)=fxAFG1(i)+.006; fxAFG2(i)=fxAFG2(i)+.006; fxAFG3(i)=fxAFG3(i)+.001; fxCLCCHO(i)=fxCLCCHO(i)+.109; fyR6OOH(i)=fyR6OOH(i)+1; fXC(i)=fXC(i)+3.543;

i=i+1;
Rnames{i} = 'ACETYLEN + CL = HO2 + CO + XC';
k(:,i) = K_ACYE_CL;
Gstr{i,1} = 'ACETYLEN'; Gstr{i,2} = 'CL';
fACETYLEN(i)=fACETYLEN(i)-1; fCL(i)=fCL(i)-1; fHO2(i)=fHO2(i)+1; fCO(i)=fCO(i)+1; fXC(i)=fXC(i)+1;

i=i+1;
Rnames{i} = 'TOLUENE + CL = .894*xHO2 + .894*RO2C + .106*RO2XC + .106*zRNO3 + .894*xBALD + .106*XC';
k(:,i) = 6.20e-11;
Gstr{i,1} = 'TOLUENE'; Gstr{i,2} = 'CL';
fTOLUENE(i)=fTOLUENE(i)-1; fCL(i)=fCL(i)-1; fxHO2(i)=fxHO2(i)+.894; fRO2C(i)=fRO2C(i)+.894; fRO2XC(i)=fRO2XC(i)+.106; fzRNO3(i)=fzRNO3(i)+.106; fxBALD(i)=fxBALD(i)+.894; fXC(i)=fXC(i)+.106;

i=i+1;
Rnames{i} = 'MXYLENE + CL = .864*xHO2 + .864*RO2C + .136*RO2XC + .136*zRNO3 + .864*xBALD + 1.136*XC';
k(:,i) = 1.35e-10;
Gstr{i,1} = 'MXYLENE'; Gstr{i,2} = 'CL';
fMXYLENE(i)=fMXYLENE(i)-1; fCL(i)=fCL(i)-1; fxHO2(i)=fxHO2(i)+.864; fRO2C(i)=fRO2C(i)+.864; fRO2XC(i)=fRO2XC(i)+.136; fzRNO3(i)=fzRNO3(i)+.136; fxBALD(i)=fxBALD(i)+.864; fXC(i)=fXC(i)+1.136;

i=i+1;
Rnames{i} = 'OXYLENE + CL = .864*xHO2 + .864*RO2C + .136*RO2XC + .136*zRNO3 + .864*xBALD + 1.136*XC';
k(:,i) = 1.40e-10;
Gstr{i,1} = 'OXYLENE'; Gstr{i,2} = 'CL';
fOXYLENE(i)=fOXYLENE(i)-1; fCL(i)=fCL(i)-1; fxHO2(i)=fxHO2(i)+.864; fRO2C(i)=fRO2C(i)+.864; fRO2XC(i)=fRO2XC(i)+.136; fzRNO3(i)=fzRNO3(i)+.136; fxBALD(i)=fxBALD(i)+.864; fXC(i)=fXC(i)+1.136;

i=i+1;
Rnames{i} = 'PXYLENE + CL = .864*xHO2 + .864*RO2C + .136*RO2XC + .136*zRNO3 + .864*xBALD + 1.136*XC';
k(:,i) = 1.44e-10;
Gstr{i,1} = 'PXYLENE'; Gstr{i,2} = 'CL';
fPXYLENE(i)=fPXYLENE(i)-1; fCL(i)=fCL(i)-1; fxHO2(i)=fxHO2(i)+.864; fRO2C(i)=fRO2C(i)+.864; fRO2XC(i)=fRO2XC(i)+.136; fzRNO3(i)=fzRNO3(i)+.136; fxBALD(i)=fxBALD(i)+.864; fXC(i)=fXC(i)+1.136;

i=i+1;
Rnames{i} = 'TMB124 + CL = .838*xHO2 + .838*RO2C + .162*RO2XC + .162*zRNO3 + .838*xBALD + 2.162*XC';
k(:,i) = 2.42e-10;
Gstr{i,1} = 'TMB124'; Gstr{i,2} = 'CL';
fTMB124(i)=fTMB124(i)-1; fCL(i)=fCL(i)-1; fxHO2(i)=fxHO2(i)+.838; fRO2C(i)=fRO2C(i)+.838; fRO2XC(i)=fRO2XC(i)+.162; fzRNO3(i)=fzRNO3(i)+.162; fxBALD(i)=fxBALD(i)+.838; fXC(i)=fXC(i)+2.162;

i=i+1;
Rnames{i} = 'ETOH + CL = HCL + .688*HO2 + .312*xHO2 + .312*RO2C + .503*xHCHO + .688*CCHO + .061*xHOCCHO + .312*yROOH - .001*XC';
k(:,i) = 8.60e-11.*(T./300).^0.00.*exp(44.787./T);
Gstr{i,1} = 'ETOH'; Gstr{i,2} = 'CL';
fETOH(i)=fETOH(i)-1; fCL(i)=fCL(i)-1; fHCL(i)=fHCL(i)+1; fHO2(i)=fHO2(i)+.688; fxHO2(i)=fxHO2(i)+.312; fRO2C(i)=fRO2C(i)+.312; fxHCHO(i)=fxHCHO(i)+.503; fCCHO(i)=fCCHO(i)+.688; fxHOCCHO(i)=fxHOCCHO(i)+.061; fyROOH(i)=fyROOH(i)+.312; fXC(i)=fXC(i)-.001;

i=i+1;
Rnames{i} = 'ALK1 + CL = HCL + xHO2 + RO2C + xCCHO + yROOH';
k(:,i) = 8.30e-11.*exp(-100.141./T);
Gstr{i,1} = 'ALK1'; Gstr{i,2} = 'CL';
fALK1(i)=fALK1(i)-1; fCL(i)=fCL(i)-1; fHCL(i)=fHCL(i)+1; fxHO2(i)=fxHO2(i)+1; fRO2C(i)=fRO2C(i)+1; fxCCHO(i)=fxCCHO(i)+1; fyROOH(i)=fyROOH(i)+1;

i=i+1;
Rnames{i} = 'ALK2 + CL = HCL + .97*xHO2 + .97*RO2C + .03*RO2XC + .03*zRNO3 + .482*xRCHO + .488*xACET + yROOH - .09*XC';
k(:,i) = 1.20e-10.*(T./300).^0.00.*exp(39.754./T);
Gstr{i,1} = 'ALK2'; Gstr{i,2} = 'CL';
fALK2(i)=fALK2(i)-1; fCL(i)=fCL(i)-1; fHCL(i)=fHCL(i)+1; fxHO2(i)=fxHO2(i)+.97; fRO2C(i)=fRO2C(i)+.97; fRO2XC(i)=fRO2XC(i)+.03; fzRNO3(i)=fzRNO3(i)+.03; fxRCHO(i)=fxRCHO(i)+.482; fxACET(i)=fxACET(i)+.488; fyROOH(i)=fyROOH(i)+1; fXC(i)=fXC(i)-.09;

i=i+1;
Rnames{i} = 'ALK3 + CL = HCL + .835*xHO2 + .094*xTBUO + 1.361*RO2C + .07*RO2XC + .07*zRNO3 + .078*xHCHO + .34*xCCHO + .343*xRCHO + .075*xACET + .253*xMEK + .983*yROOH + .017*yR6OOH + .18*XC';
k(:,i) = 1.86e-10;
Gstr{i,1} = 'ALK3'; Gstr{i,2} = 'CL';
fALK3(i)=fALK3(i)-1; fCL(i)=fCL(i)-1; fHCL(i)=fHCL(i)+1; fxHO2(i)=fxHO2(i)+.835; fxTBUO(i)=fxTBUO(i)+.094; fRO2C(i)=fRO2C(i)+1.361; fRO2XC(i)=fRO2XC(i)+.07; fzRNO3(i)=fzRNO3(i)+.07; fxHCHO(i)=fxHCHO(i)+.078; fxCCHO(i)=fxCCHO(i)+.34; fxRCHO(i)=fxRCHO(i)+.343; fxACET(i)=fxACET(i)+.075; fxMEK(i)=fxMEK(i)+.253; fyROOH(i)=fyROOH(i)+.983; fyR6OOH(i)=fyR6OOH(i)+.017; fXC(i)=fXC(i)+.18;

i=i+1;
Rnames{i} = 'ALK4 + CL = HCL + .827*xHO2 + .003*xMEO2 + .004*xMECO3 + 1.737*RO2C + .165*RO2XC + .165*zRNO3 + .003*xCO + .034*xHCHO + .287*xCCHO + .412*xRCHO + .247*xACET + .076*xMEK + .13*xPROD2 + yR6OOH + .327*XC';
k(:,i) = 2.63e-10;
Gstr{i,1} = 'ALK4'; Gstr{i,2} = 'CL';
fALK4(i)=fALK4(i)-1; fCL(i)=fCL(i)-1; fHCL(i)=fHCL(i)+1; fxHO2(i)=fxHO2(i)+.827; fxMEO2(i)=fxMEO2(i)+.003; fxMECO3(i)=fxMECO3(i)+.004; fRO2C(i)=fRO2C(i)+1.737; fRO2XC(i)=fRO2XC(i)+.165; fzRNO3(i)=fzRNO3(i)+.165; fxCO(i)=fxCO(i)+.003; fxHCHO(i)=fxHCHO(i)+.034; fxCCHO(i)=fxCCHO(i)+.287; fxRCHO(i)=fxRCHO(i)+.412; fxACET(i)=fxACET(i)+.247; fxMEK(i)=fxMEK(i)+.076; fxPROD2(i)=fxPROD2(i)+.13; fyR6OOH(i)=fyR6OOH(i)+1; fXC(i)=fXC(i)+.327;

i=i+1;
Rnames{i} = 'ALK5 + CL = HCL + .647*xHO2 + 1.541*RO2C + .352*RO2XC + .352*zRNO3 + .022*xHCHO + .08*xCCHO + .258*xRCHO + .044*xACET + .041*xMEK + .378*xPROD2 + yR6OOH + 2.368*XC';
k(:,i) = 4.21e-10;
Gstr{i,1} = 'ALK5'; Gstr{i,2} = 'CL';
fALK5(i)=fALK5(i)-1; fCL(i)=fCL(i)-1; fHCL(i)=fHCL(i)+1; fxHO2(i)=fxHO2(i)+.647; fRO2C(i)=fRO2C(i)+1.541; fRO2XC(i)=fRO2XC(i)+.352; fzRNO3(i)=fzRNO3(i)+.352; fxHCHO(i)=fxHCHO(i)+.022; fxCCHO(i)=fxCCHO(i)+.08; fxRCHO(i)=fxRCHO(i)+.258; fxACET(i)=fxACET(i)+.044; fxMEK(i)=fxMEK(i)+.041; fxPROD2(i)=fxPROD2(i)+.378; fyR6OOH(i)=fyR6OOH(i)+1; fXC(i)=fXC(i)+2.368;

i=i+1;
Rnames{i} = 'OLE1+ CL = .384*HCL + .873*xHO2 + 1.608*RO2C + .127*RO2XC + .127*zRNO3 + .036*xHCHO + .206*xCCHO + .072*xRCHO + .215*xACRO + .019*xMVK + .038*xIPRD + .192*xCLCCHO + .337*xCLACET + .169*yROOH + .831*yR6OOH + 1.268*XC';
k(:,i) = 3.92e-10;
Gstr{i,1} = 'OLE1'; Gstr{i,2} = 'CL';
fOLE1(i)=fOLE1(i)-1; fCL(i)=fCL(i)-1; fHCL(i)=fHCL(i)+.384; fxHO2(i)=fxHO2(i)+.873; fRO2C(i)=fRO2C(i)+1.608; fRO2XC(i)=fRO2XC(i)+.127; fzRNO3(i)=fzRNO3(i)+.127; fxHCHO(i)=fxHCHO(i)+.036; fxCCHO(i)=fxCCHO(i)+.206; fxRCHO(i)=fxRCHO(i)+.072; fxACRO(i)=fxACRO(i)+.215; fxMVK(i)=fxMVK(i)+.019; fxIPRD(i)=fxIPRD(i)+.038; fxCLCCHO(i)=fxCLCCHO(i)+.192; fxCLACET(i)=fxCLACET(i)+.337; fyROOH(i)=fyROOH(i)+.169; fyR6OOH(i)=fyR6OOH(i)+.831; fXC(i)=fXC(i)+1.268;

i=i+1;
Rnames{i} = 'OLE2+ CL = .279*HCL + .45*xHO2 + .442*xCL + .001*xMEO2 + 1.492*RO2C + .106*RO2XC + .106*zRNO3 + .19*xHCHO + .383*xCCHO + .317*xRCHO + .086*xACET + .042*xMEK + .025*xMACR + .058*xMVK + .161*xIPRD + .013*xCLCCHO + .191*xCLACET + .319*yROOH + .681*yR6OOH + .294*XC';
k(:,i) = 3.77e-10;
Gstr{i,1} = 'OLE2'; Gstr{i,2} = 'CL';
fOLE2(i)=fOLE2(i)-1; fCL(i)=fCL(i)-1; fHCL(i)=fHCL(i)+.279; fxHO2(i)=fxHO2(i)+.45; fxCL(i)=fxCL(i)+.442; fxMEO2(i)=fxMEO2(i)+.001; fRO2C(i)=fRO2C(i)+1.492; fRO2XC(i)=fRO2XC(i)+.106; fzRNO3(i)=fzRNO3(i)+.106; fxHCHO(i)=fxHCHO(i)+.19; fxCCHO(i)=fxCCHO(i)+.383; fxRCHO(i)=fxRCHO(i)+.317; fxACET(i)=fxACET(i)+.086; fxMEK(i)=fxMEK(i)+.042; fxMACR(i)=fxMACR(i)+.025; fxMVK(i)=fxMVK(i)+.058; fxIPRD(i)=fxIPRD(i)+.161; fxCLCCHO(i)=fxCLCCHO(i)+.013; fxCLACET(i)=fxCLACET(i)+.191; fyROOH(i)=fyROOH(i)+.319; fyR6OOH(i)=fyR6OOH(i)+.681; fXC(i)=fXC(i)+.294;

i=i+1;
Rnames{i} = 'ARO1+ CL = .84*xHO2 + .84*RO2C + .16*RO2XC + .16*zRNO3 + .84*xPROD2 + XC';
k(:,i) = 2.16e-10;
Gstr{i,1} = 'ARO1'; Gstr{i,2} = 'CL';
fARO1(i)=fARO1(i)-1; fCL(i)=fCL(i)-1; fxHO2(i)=fxHO2(i)+.84; fRO2C(i)=fRO2C(i)+.84; fRO2XC(i)=fRO2XC(i)+.16; fzRNO3(i)=fzRNO3(i)+.16; fxPROD2(i)=fxPROD2(i)+.84; fXC(i)=fXC(i)+1;

i=i+1;
Rnames{i} = 'ARO2+ CL = .828*xHO2 + .828*RO2C + .172*RO2XC + .172*zRNO3 + .469*xBALD + .359*xPROD2 + 2.531*XC';
k(:,i) = 2.66e-10;
Gstr{i,1} = 'ARO2'; Gstr{i,2} = 'CL';
fARO2(i)=fARO2(i)-1; fCL(i)=fCL(i)-1; fxHO2(i)=fxHO2(i)+.828; fRO2C(i)=fRO2C(i)+.828; fRO2XC(i)=fRO2XC(i)+.172; fzRNO3(i)=fzRNO3(i)+.172; fxBALD(i)=fxBALD(i)+.469; fxPROD2(i)=fxPROD2(i)+.359; fXC(i)=fXC(i)+2.531;

i=i+1;
Rnames{i} = 'TERP+ CL = .548*HCL + .252*xHO2 + .068*xCL + .034*xMECO3 + .05*xRCO3 + .016*xMACO3 + 2.258*RO2C + .582*RO2XC + .582*zRNO3 + .035*xCO + .158*xHCHO + .185*xRCHO + .274*xACET + .007*xGLY + .003*xBACL + .003*xMVK + .158*xIPRD + .006*xAFG1 + .006*xAFG2 + .001*xAFG3 + .109*xCLCCHO + yR6OOH + 3.543*XC';
k(:,i) = 5.46e-10;
Gstr{i,1} = 'TERP'; Gstr{i,2} = 'CL';
fTERP(i)=fTERP(i)-1; fCL(i)=fCL(i)-1; fHCL(i)=fHCL(i)+.548; fxHO2(i)=fxHO2(i)+.252; fxCL(i)=fxCL(i)+.068; fxMECO3(i)=fxMECO3(i)+.034; fxRCO3(i)=fxRCO3(i)+.05; fxMACO3(i)=fxMACO3(i)+.016; fRO2C(i)=fRO2C(i)+2.258; fRO2XC(i)=fRO2XC(i)+.582; fzRNO3(i)=fzRNO3(i)+.582; fxCO(i)=fxCO(i)+.035; fxHCHO(i)=fxHCHO(i)+.158; fxRCHO(i)=fxRCHO(i)+.185; fxACET(i)=fxACET(i)+.274; fxGLY(i)=fxGLY(i)+.007; fxBACL(i)=fxBACL(i)+.003; fxMVK(i)=fxMVK(i)+.003; fxIPRD(i)=fxIPRD(i)+.158; fxAFG1(i)=fxAFG1(i)+.006; fxAFG2(i)=fxAFG2(i)+.006; fxAFG3(i)=fxAFG3(i)+.001; fxCLCCHO(i)=fxCLCCHO(i)+.109; fyR6OOH(i)=fyR6OOH(i)+1; fXC(i)=fXC(i)+3.543;

i=i+1;
Rnames{i} = 'SESQ + CL = .252*xHO2 + .068*xCL + .034*xMECO3 + .05*xRCO3 + .016*xMACO3 + 2.258*RO2C + .582*RO2XC + .582*zRNO3 + .548*HCL + .035*xCO + .158*xHCHO + .185*xRCHO + .274*xACET + .007*xGLY + .003*xBACL + .003*xMVK + .158*xIPRD + .006*xAFG1 + .006*xAFG2 + .001*xAFG3 + .109*xCLCCHO + yR6OOH + 8.543*XC*.';
k(:,i) = 5.46e-10;
Gstr{i,1} = 'SESQ'; Gstr{i,2} = 'CL';
fSESQ(i)=fSESQ(i)-1; fCL(i)=fCL(i)-1; fxHO2(i)=fxHO2(i)+.252; fxCL(i)=fxCL(i)+.068; fxMECO3(i)=fxMECO3(i)+.034; fxRCO3(i)=fxRCO3(i)+.05; fxMACO3(i)=fxMACO3(i)+.016; fRO2C(i)=fRO2C(i)+2.258; fRO2XC(i)=fRO2XC(i)+.582; fzRNO3(i)=fzRNO3(i)+.582; fHCL(i)=fHCL(i)+.548; fxCO(i)=fxCO(i)+.035; fxHCHO(i)=fxHCHO(i)+.158; fxRCHO(i)=fxRCHO(i)+.185; fxACET(i)=fxACET(i)+.274; fxGLY(i)=fxGLY(i)+.007; fxBACL(i)=fxBACL(i)+.003; fxMVK(i)=fxMVK(i)+.003; fxIPRD(i)=fxIPRD(i)+.158; fxAFG1(i)=fxAFG1(i)+.006; fxAFG2(i)=fxAFG2(i)+.006; fxAFG3(i)=fxAFG3(i)+.001; fxCLCCHO(i)=fxCLCCHO(i)+.109; fyR6OOH(i)=fyR6OOH(i)+1; fXC(i)=fXC(i)+8.543;


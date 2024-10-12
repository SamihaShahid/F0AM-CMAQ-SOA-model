% MechGen derived explicit mechanism
% File created by Jia Jiang

SpeciesToAdd = {...
'PHEN'; 'HCHDO'; 'CRES'; 'M24PHEN'; 'CATECHOL'; 'SVPHE';...
'XYNL'; 'PHEN_A1'; 'PHEN_P1'; 'PHEN_P2'; 'HCHDO_A1'; 'HCHDO_P1';...
'CATECHOL_P1'; 'CRES_P1'; 'M24PHEN_P1'; 'XYNL_P1'; 'SumRO2'; 'SumRCO3';};

AddSpecies


% Reactions:
%   1, <R001>
i = i + 1;
Rnames{i} = 'PHEN + OH = .95 PHEN_A1 + .05 BZO + .00 HO2';
k(:,i) = 4.7e-13 .* exp(1219.8041./T) .* (T./300).^0.00;
Gstr{i,1} = 'PHEN'; Gstr{i,2} = 'OH'; 
fPHEN(i) = fPHEN(i) - 1;
fOH(i) = fOH(i) - 1;
fPHEN_A1(i) = fPHEN_A1(i) + 0.95;
fBZO(i) = fBZO(i) + 0.05;
fHO2(i) = fHO2(i) + 0.0;

%   2, <R002>
i = i + 1;
Rnames{i} = 'PHEN + NO3 = BZO + HNO3';
k(:,i) = 1.10e-11;
Gstr{i,1} = 'PHEN'; Gstr{i,2} = 'NO3'; 
fPHEN(i) = fPHEN(i) - 1;
fNO3(i) = fNO3(i) - 1;
fBZO(i) = fBZO(i) + 1.0;
fHNO3(i) = fHNO3(i) + 1.0;

%   3, <R003>
i = i + 1;
Rnames{i} = 'PHEN_A1 + O2 = .25 PHEN_P1 + .75 CATECHOL + .75 HO2';
k(:,i) = 5.10e-13;
Gstr{i,1} = 'PHEN_A1'; Gstr{i,2} = 'O2'; 
fPHEN_A1(i) = fPHEN_A1(i) - 1;
fO2(i) = fO2(i) - 1;
fPHEN_P1(i) = fPHEN_P1(i) + 0.25;
fCATECHOL(i) = fCATECHOL(i) + 0.75;
fHO2(i) = fHO2(i) + 0.75;

%   4, <R004>
i = i + 1;
Rnames{i} = 'PHEN_A1 + NO2 = CATECHOL + HONO';
k(:,i) = 3.00e-11;
Gstr{i,1} = 'PHEN_A1'; Gstr{i,2} = 'NO2'; 
fPHEN_A1(i) = fPHEN_A1(i) - 1;
fNO2(i) = fNO2(i) - 1;
fCATECHOL(i) = fCATECHOL(i) + 1.0;
fHONO(i) = fHONO(i) + 1.0;

%   5, <R005>
i = i + 1;
Rnames{i} = 'PHEN_P1 = .996 HCHDO + .996 HO2 + .004 PHEN_P2 + -1.992 XC + .004 SumRO2';
k(:,i) = 1.10e+6;
Gstr{i,1} = 'PHEN_P1'; 
fPHEN_P1(i) = fPHEN_P1(i) - 1;
fHCHDO(i) = fHCHDO(i) + 0.996;
fHO2(i) = fHO2(i) + 0.996;
fPHEN_P2(i) = fPHEN_P2(i) + 0.004;
fXC(i) = fXC(i) -1.992;
fSumRO2(i) = fSumRO2(i) + 0.004;

%   6, <R006>
i = i + 1;
Rnames{i} = 'PHEN_P1 + NO = OLEA1 + HO2 + NO2';
k(:,i) = 9.05e-12;
Gstr{i,1} = 'PHEN_P1'; Gstr{i,2} = 'NO'; 
fPHEN_P1(i) = fPHEN_P1(i) - 1;
fNO(i) = fNO(i) - 1;
fOLEA1(i) = fOLEA1(i) + 1.0;
fHO2(i) = fHO2(i) + 1.0;
fNO2(i) = fNO2(i) + 1.0;

%   7, <R007>
i = i + 1;
Rnames{i} = 'PHEN_P1 + HO2 = .5 OLEA1 + .5 HO2 + .5 OH + .5 RUOOH';
k(:,i) = 6.82e-12;
Gstr{i,1} = 'PHEN_P1'; Gstr{i,2} = 'HO2'; 
fPHEN_P1(i) = fPHEN_P1(i) - 1;
fHO2(i) = fHO2(i) - 1;
fOLEA1(i) = fOLEA1(i) + 0.5;
fHO2(i) = fHO2(i) + 0.5;
fOH(i) = fOH(i) + 0.5;
fRUOOH(i) = fRUOOH(i) + 0.5;

%   8, <R008>
i = i + 1;
Rnames{i} = 'PHEN_P2 + NO = .876 HO2 + .876 NO2 + .438 AFG2A + .438 GLY + .438 BUDAL + .438 MGLY + .124 RPNO3 + -1.124 XC';
k(:,i) = 9.13e-12;
Gstr{i,1} = 'PHEN_P2'; Gstr{i,2} = 'NO'; 
fPHEN_P2(i) = fPHEN_P2(i) - 1;
fNO(i) = fNO(i) - 1;
fHO2(i) = fHO2(i) + 0.876;
fNO2(i) = fNO2(i) + 0.876;
fAFG2A(i) = fAFG2A(i) + 0.438;
fGLY(i) = fGLY(i) + 0.438;
fBUDAL(i) = fBUDAL(i) + 0.438;
fMGLY(i) = fMGLY(i) + 0.438;
fRPNO3(i) = fRPNO3(i) + 0.124;
fXC(i) = fXC(i) -1.124;

%   9, <R009>
i = i + 1;
Rnames{i} = 'PHEN_P2 + NO3 = HO2 + NO2 + .5 AFG2A + .5 GLY + .5 BUDAL + .5 MGLY + -1 XC';
k(:,i) = 2.30e-12;
Gstr{i,1} = 'PHEN_P2'; Gstr{i,2} = 'NO3'; 
fPHEN_P2(i) = fPHEN_P2(i) - 1;
fNO3(i) = fNO3(i) - 1;
fHO2(i) = fHO2(i) + 1.0;
fNO2(i) = fNO2(i) + 1.0;
fAFG2A(i) = fAFG2A(i) + 0.5;
fGLY(i) = fGLY(i) + 0.5;
fBUDAL(i) = fBUDAL(i) + 0.5;
fMGLY(i) = fMGLY(i) + 0.5;
fXC(i) = fXC(i) -1.0;

%   10, <R010>
i = i + 1;
Rnames{i} = 'PHEN_P2 + HO2 = RAOOH + -2 XC';
k(:,i) = 1.95e-11;
Gstr{i,1} = 'PHEN_P2'; Gstr{i,2} = 'HO2'; 
fPHEN_P2(i) = fPHEN_P2(i) - 1;
fHO2(i) = fHO2(i) - 1;
fRAOOH(i) = fRAOOH(i) + 1.0;
fXC(i) = fXC(i) -2.0;

%   11, <R011>
i = i + 1;
Rnames{i} = 'PHEN_P2 + SumRO2 = SumRO2 + .5 HO2 + .5 OLEP + .25 AFG2A + .25 GLY + .25 BUDAL + .25 MGLY + -2.5 XC';
k(:,i) = 2.57e-12;
Gstr{i,1} = 'PHEN_P2'; Gstr{i,2} = 'SumRO2'; 
fPHEN_P2(i) = fPHEN_P2(i) - 1;
fSumRO2(i) = fSumRO2(i) - 1;
fSumRO2(i) = fSumRO2(i) + 1.0;
fHO2(i) = fHO2(i) + 0.5;
fOLEP(i) = fOLEP(i) + 0.5;
fAFG2A(i) = fAFG2A(i) + 0.25;
fGLY(i) = fGLY(i) + 0.25;
fBUDAL(i) = fBUDAL(i) + 0.25;
fMGLY(i) = fMGLY(i) + 0.25;
fXC(i) = fXC(i) -2.5;

%   12, <R012>
i = i + 1;
Rnames{i} = 'PHEN_P2 + SumRCO3 = SumRCO3 + .8 HO2 + .4 AFG2A + .4 GLY + .4 BUDAL + .4 MGLY + .2 OLEP + -1.6 XC';
k(:,i) = 1.37e-11;
Gstr{i,1} = 'PHEN_P2'; Gstr{i,2} = 'SumRCO3'; 
fPHEN_P2(i) = fPHEN_P2(i) - 1;
fSumRCO3(i) = fSumRCO3(i) - 1;
fSumRCO3(i) = fSumRCO3(i) + 1.0;
fHO2(i) = fHO2(i) + 0.8;
fAFG2A(i) = fAFG2A(i) + 0.4;
fGLY(i) = fGLY(i) + 0.4;
fBUDAL(i) = fBUDAL(i) + 0.4;
fMGLY(i) = fMGLY(i) + 0.4;
fOLEP(i) = fOLEP(i) + 0.2;
fXC(i) = fXC(i) -1.6;

%   13, <R013>
i = i + 1;
Rnames{i} = 'HCHDO + OH = .989 HCHDO_P1 + .011 BACL + .011 HO2 + .022 XC + .989 SumRO2';
k(:,i) = 1.73e-10;
Gstr{i,1} = 'HCHDO'; Gstr{i,2} = 'OH'; 
fHCHDO(i) = fHCHDO(i) - 1;
fOH(i) = fOH(i) - 1;
fHCHDO_P1(i) = fHCHDO_P1(i) + 0.989;
fBACL(i) = fBACL(i) + 0.011;
fHO2(i) = fHO2(i) + 0.011;
fXC(i) = fXC(i) + 0.022;
fSumRO2(i) = fSumRO2(i) + 0.989;

%   14, <R014>
i = i + 1;
Rnames{i} = 'HCHDO + O3 = .75 AFG2A + .643 HO2 + .613 OH + .25 RCHO + .137 CO2 + 1.113 XC';
k(:,i) = 3.77e-17;
Gstr{i,1} = 'HCHDO'; Gstr{i,2} = 'O3'; 
fHCHDO(i) = fHCHDO(i) - 1;
fO3(i) = fO3(i) - 1;
fAFG2A(i) = fAFG2A(i) + 0.75;
fHO2(i) = fHO2(i) + 0.643;
fOH(i) = fOH(i) + 0.613;
fRCHO(i) = fRCHO(i) + 0.25;
fCO2(i) = fCO2(i) + 0.137;
fXC(i) = fXC(i) + 1.113;

%   15, <R015>
i = i + 1;
Rnames{i} = 'HCHDO + HV = OLEP + CO + -5 XC';
k(:,i) = JMVK_16;
Gstr{i,1} = 'HCHDO'; 
fHCHDO(i) = fHCHDO(i) - 1;
fOLEP(i) = fOLEP(i) + 1.0;
fCO(i) = fCO(i) + 1.0;
fXC(i) = fXC(i) -5.0;

%   16, <R016>
i = i + 1;
Rnames{i} = 'HCHDO_P1 + NO = .931 NO2 + .747 HO2 + .542 MGLY + .204 AFG2A + .185 MACO3 + .069 RCNO3 + 2.269 XC + .185 SumRCO3';
k(:,i) = 9.05e-12;
Gstr{i,1} = 'HCHDO_P1'; Gstr{i,2} = 'NO'; 
fHCHDO_P1(i) = fHCHDO_P1(i) - 1;
fNO(i) = fNO(i) - 1;
fNO2(i) = fNO2(i) + 0.931;
fHO2(i) = fHO2(i) + 0.747;
fMGLY(i) = fMGLY(i) + 0.542;
fAFG2A(i) = fAFG2A(i) + 0.204;
fMACO3(i) = fMACO3(i) + 0.185;
fRCNO3(i) = fRCNO3(i) + 0.069;
fXC(i) = fXC(i) + 2.269;
fSumRCO3(i) = fSumRCO3(i) + 0.185;

%   17, <R017>
i = i + 1;
Rnames{i} = 'HCHDO_P1 + NO3 = NO2 + .802 HO2 + .582 MGLY + .219 AFG2A + .198 MACO3 + 2.367 XC + .198 SumRCO3';
k(:,i) = 2.30e-12;
Gstr{i,1} = 'HCHDO_P1'; Gstr{i,2} = 'NO3'; 
fHCHDO_P1(i) = fHCHDO_P1(i) - 1;
fNO3(i) = fNO3(i) - 1;
fNO2(i) = fNO2(i) + 1.0;
fHO2(i) = fHO2(i) + 0.802;
fMGLY(i) = fMGLY(i) + 0.582;
fAFG2A(i) = fAFG2A(i) + 0.219;
fMACO3(i) = fMACO3(i) + 0.198;
fXC(i) = fXC(i) + 2.367;
fSumRCO3(i) = fSumRCO3(i) + 0.198;

%   18, <R018>
i = i + 1;
Rnames{i} = 'HCHDO_P1 + HO2 = .759 RUOOH + .219 OTHN + .021 BACL + -1.266 XC';
k(:,i) = 1.95e-11;
Gstr{i,1} = 'HCHDO_P1'; Gstr{i,2} = 'HO2'; 
fHCHDO_P1(i) = fHCHDO_P1(i) - 1;
fHO2(i) = fHO2(i) - 1;
fRUOOH(i) = fRUOOH(i) + 0.759;
fOTHN(i) = fOTHN(i) + 0.219;
fBACL(i) = fBACL(i) + 0.021;
fXC(i) = fXC(i) -1.266;

%   19, <R019>
i = i + 1;
Rnames{i} = 'HCHDO_P1 + SumRO2 = SumRO2 + .401 HO2 + .291 MGLY + .202 LVKS + .195 OLEP + .11 AFG2A + .099 MACO3 + .053 BACL + .05 AFG3 + .103 XC + .099 SumRCO3';
k(:,i) = 2.57e-12;
Gstr{i,1} = 'HCHDO_P1'; Gstr{i,2} = 'SumRO2'; 
fHCHDO_P1(i) = fHCHDO_P1(i) - 1;
fSumRO2(i) = fSumRO2(i) - 1;
fSumRO2(i) = fSumRO2(i) + 1.0;
fHO2(i) = fHO2(i) + 0.401;
fMGLY(i) = fMGLY(i) + 0.291;
fLVKS(i) = fLVKS(i) + 0.202;
fOLEP(i) = fOLEP(i) + 0.195;
fAFG2A(i) = fAFG2A(i) + 0.11;
fMACO3(i) = fMACO3(i) + 0.099;
fBACL(i) = fBACL(i) + 0.053;
fAFG3(i) = fAFG3(i) + 0.05;
fXC(i) = fXC(i) + 0.103;
fSumRCO3(i) = fSumRCO3(i) + 0.099;

%   20, <R020>
i = i + 1;
Rnames{i} = 'HCHDO_P1 + SumRCO3 = SumRCO3 + .641 HO2 + .466 MGLY + .175 AFG2A + .159 MACO3 + .118 LVKS + .043 BACL + .04 AFG3 + 1.735 XC + .159 SumRCO3';
k(:,i) = 1.37e-11;
Gstr{i,1} = 'HCHDO_P1'; Gstr{i,2} = 'SumRCO3'; 
fHCHDO_P1(i) = fHCHDO_P1(i) - 1;
fSumRCO3(i) = fSumRCO3(i) - 1;
fSumRCO3(i) = fSumRCO3(i) + 1.0;
fHO2(i) = fHO2(i) + 0.641;
fMGLY(i) = fMGLY(i) + 0.466;
fAFG2A(i) = fAFG2A(i) + 0.175;
fMACO3(i) = fMACO3(i) + 0.159;
fLVKS(i) = fLVKS(i) + 0.118;
fBACL(i) = fBACL(i) + 0.043;
fAFG3(i) = fAFG3(i) + 0.04;
fXC(i) = fXC(i) + 1.735;
fSumRCO3(i) = fSumRCO3(i) + 0.159;

%   21, <R021>
i = i + 1;
Rnames{i} = 'CATECHOL + OH = .774 HO2 + .386 OLEP + .00 HO2 + .197 CATECHOL_P1 + .132 OLEA1 + .123 XYNL + .087 OLEA2 + .045 LVKS + .03 BZO + -2.228 XC + .197 SumRO2';
k(:,i) = 1.04e-10;
Gstr{i,1} = 'CATECHOL'; Gstr{i,2} = 'OH'; 
fCATECHOL(i) = fCATECHOL(i) - 1;
fOH(i) = fOH(i) - 1;
fHO2(i) = fHO2(i) + 0.774;
fOLEP(i) = fOLEP(i) + 0.386;
fHO2(i) = fHO2(i) + 0.0;
fCATECHOL_P1(i) = fCATECHOL_P1(i) + 0.197;
fOLEA1(i) = fOLEA1(i) + 0.132;
fXYNL(i) = fXYNL(i) + 0.123;
fOLEA2(i) = fOLEA2(i) + 0.087;
fLVKS(i) = fLVKS(i) + 0.045;
fBZO(i) = fBZO(i) + 0.03;
fXC(i) = fXC(i) -2.228;
fSumRO2(i) = fSumRO2(i) + 0.197;

%   22, <R022>
i = i + 1;
Rnames{i} = 'CATECHOL + NO3 = BZO + XN';
k(:,i) = 0.98e-10;
Gstr{i,1} = 'CATECHOL'; Gstr{i,2} = 'NO3'; 
fCATECHOL(i) = fCATECHOL(i) - 1;
fNO3(i) = fNO3(i) - 1;
fBZO(i) = fBZO(i) + 1.0;
fXN(i) = fXN(i) + 1.0;

%   23, <R023>
i = i + 1;
Rnames{i} = 'CATECHOL_P1 + NO = .876 HO2 + .876 NO2 + .438 AFG2A + .438 MGLY + .438 BUDAL + .438 BACL + .124 RPNO3 + -1.562 XC';
k(:,i) = 9.13e-12;
Gstr{i,1} = 'CATECHOL_P1'; Gstr{i,2} = 'NO'; 
fCATECHOL_P1(i) = fCATECHOL_P1(i) - 1;
fNO(i) = fNO(i) - 1;
fHO2(i) = fHO2(i) + 0.876;
fNO2(i) = fNO2(i) + 0.876;
fAFG2A(i) = fAFG2A(i) + 0.438;
fMGLY(i) = fMGLY(i) + 0.438;
fBUDAL(i) = fBUDAL(i) + 0.438;
fBACL(i) = fBACL(i) + 0.438;
fRPNO3(i) = fRPNO3(i) + 0.124;
fXC(i) = fXC(i) -1.562;

%   24, <R024>
i = i + 1;
Rnames{i} = 'CATECHOL_P1 + NO3 = HO2 + NO2 + .5 AFG2A + .5 MGLY + .5 BUDAL + .5 BACL + -1.5 XC';
k(:,i) = 2.30e-12;
Gstr{i,1} = 'CATECHOL_P1'; Gstr{i,2} = 'NO3'; 
fCATECHOL_P1(i) = fCATECHOL_P1(i) - 1;
fNO3(i) = fNO3(i) - 1;
fHO2(i) = fHO2(i) + 1.0;
fNO2(i) = fNO2(i) + 1.0;
fAFG2A(i) = fAFG2A(i) + 0.5;
fMGLY(i) = fMGLY(i) + 0.5;
fBUDAL(i) = fBUDAL(i) + 0.5;
fBACL(i) = fBACL(i) + 0.5;
fXC(i) = fXC(i) -1.5;

%   25, <R025>
i = i + 1;
Rnames{i} = 'CATECHOL_P1 + HO2 = OTHN + -6 XC';
k(:,i) = 1.95e-11;
Gstr{i,1} = 'CATECHOL_P1'; Gstr{i,2} = 'HO2'; 
fCATECHOL_P1(i) = fCATECHOL_P1(i) - 1;
fHO2(i) = fHO2(i) - 1;
fOTHN(i) = fOTHN(i) + 1.0;
fXC(i) = fXC(i) -6.0;

%   26, <R026>
i = i + 1;
Rnames{i} = 'CATECHOL_P1 + SumRO2 = SumRO2 + .5 HO2 + .5 OLEP + .25 AFG2A + .25 MGLY + .25 BUDAL + .25 BACL + -2.75 XC';
k(:,i) = 2.57e-12;
Gstr{i,1} = 'CATECHOL_P1'; Gstr{i,2} = 'SumRO2'; 
fCATECHOL_P1(i) = fCATECHOL_P1(i) - 1;
fSumRO2(i) = fSumRO2(i) - 1;
fSumRO2(i) = fSumRO2(i) + 1.0;
fHO2(i) = fHO2(i) + 0.5;
fOLEP(i) = fOLEP(i) + 0.5;
fAFG2A(i) = fAFG2A(i) + 0.25;
fMGLY(i) = fMGLY(i) + 0.25;
fBUDAL(i) = fBUDAL(i) + 0.25;
fBACL(i) = fBACL(i) + 0.25;
fXC(i) = fXC(i) -2.75;

%   27, <R027>
i = i + 1;
Rnames{i} = 'CATECHOL_P1 + SumRCO3 = SumRCO3 + .8 HO2 + .4 AFG2A + .4 MGLY + .4 BUDAL + .4 BACL + .2 OLEP + -2 XC';
k(:,i) = 1.37e-11;
Gstr{i,1} = 'CATECHOL_P1'; Gstr{i,2} = 'SumRCO3'; 
fCATECHOL_P1(i) = fCATECHOL_P1(i) - 1;
fSumRCO3(i) = fSumRCO3(i) - 1;
fSumRCO3(i) = fSumRCO3(i) + 1.0;
fHO2(i) = fHO2(i) + 0.8;
fAFG2A(i) = fAFG2A(i) + 0.4;
fMGLY(i) = fMGLY(i) + 0.4;
fBUDAL(i) = fBUDAL(i) + 0.4;
fBACL(i) = fBACL(i) + 0.4;
fOLEP(i) = fOLEP(i) + 0.2;
fXC(i) = fXC(i) -2.0;

%   28, <R028>
i = i + 1;
Rnames{i} = 'SVPHE + OH = .774 HO2 + .386 OLEP + .00 HO2 + .197 SVPHE_P1 + .132 OLEA1 + .123 XYNL + .087 OLEA2 + .045 LVKS + .03 BZO + -2.228 XC + .197 SumRO2';
k(:,i) = 1.04e-10;
Gstr{i,1} = 'SVPHE'; Gstr{i,2} = 'OH'; 
fSVPHE(i) = fSVPHE(i) - 1;
fOH(i) = fOH(i) - 1;
fHO2(i) = fHO2(i) + 0.774;
fOLEP(i) = fOLEP(i) + 0.386;
fHO2(i) = fHO2(i) + 0.0;
fSVPHE_P1(i) = fSVPHE_P1(i) + 0.197;
fOLEA1(i) = fOLEA1(i) + 0.132;
fXYNL(i) = fXYNL(i) + 0.123;
fOLEA2(i) = fOLEA2(i) + 0.087;
fLVKS(i) = fLVKS(i) + 0.045;
fBZO(i) = fBZO(i) + 0.03;
fXC(i) = fXC(i) -2.228;
fSumRO2(i) = fSumRO2(i) + 0.197;

%   29, <R029>
i = i + 1;
Rnames{i} = 'SVPHE + NO3 = BZO + XN';
k(:,i) = 0.98e-10;
Gstr{i,1} = 'SVPHE'; Gstr{i,2} = 'NO3'; 
fSVPHE(i) = fSVPHE(i) - 1;
fNO3(i) = fNO3(i) - 1;
fBZO(i) = fBZO(i) + 1.0;
fXN(i) = fXN(i) + 1.0;

%   30, <R030>
i = i + 1;
Rnames{i} = 'SVPHE_P1 + NO = .876 HO2 + .876 NO2 + .438 AFG2A + .438 MGLY + .438 BUDAL + .438 BACL + .124 RPNO3 + -1.562 XC';
k(:,i) = 9.13e-12;
Gstr{i,1} = 'SVPHE_P1'; Gstr{i,2} = 'NO'; 
fSVPHE_P1(i) = fSVPHE_P1(i) - 1;
fNO(i) = fNO(i) - 1;
fHO2(i) = fHO2(i) + 0.876;
fNO2(i) = fNO2(i) + 0.876;
fAFG2A(i) = fAFG2A(i) + 0.438;
fMGLY(i) = fMGLY(i) + 0.438;
fBUDAL(i) = fBUDAL(i) + 0.438;
fBACL(i) = fBACL(i) + 0.438;
fRPNO3(i) = fRPNO3(i) + 0.124;
fXC(i) = fXC(i) -1.562;

%   31, <R031>
i = i + 1;
Rnames{i} = 'SVPHE_P1 + NO3 = HO2 + NO2 + .5 AFG2A + .5 MGLY + .5 BUDAL + .5 BACL + -1.5 XC';
k(:,i) = 2.30e-12;
Gstr{i,1} = 'SVPHE_P1'; Gstr{i,2} = 'NO3'; 
fSVPHE_P1(i) = fSVPHE_P1(i) - 1;
fNO3(i) = fNO3(i) - 1;
fHO2(i) = fHO2(i) + 1.0;
fNO2(i) = fNO2(i) + 1.0;
fAFG2A(i) = fAFG2A(i) + 0.5;
fMGLY(i) = fMGLY(i) + 0.5;
fBUDAL(i) = fBUDAL(i) + 0.5;
fBACL(i) = fBACL(i) + 0.5;
fXC(i) = fXC(i) -1.5;

%   32, <R032>
i = i + 1;
Rnames{i} = 'SVPHE_P1 + HO2 = OTHN + -6 XC';
k(:,i) = 1.95e-11;
Gstr{i,1} = 'SVPHE_P1'; Gstr{i,2} = 'HO2'; 
fSVPHE_P1(i) = fSVPHE_P1(i) - 1;
fHO2(i) = fHO2(i) - 1;
fOTHN(i) = fOTHN(i) + 1.0;
fXC(i) = fXC(i) -6.0;

%   33, <R033>
i = i + 1;
Rnames{i} = 'SVPHE_P1 + SumRO2 = SumRO2 + .5 HO2 + .5 OLEP + .25 AFG2A + .25 MGLY + .25 BUDAL + .25 BACL + -2.75 XC';
k(:,i) = 2.57e-12;
Gstr{i,1} = 'SVPHE_P1'; Gstr{i,2} = 'SumRO2'; 
fSVPHE_P1(i) = fSVPHE_P1(i) - 1;
fSumRO2(i) = fSumRO2(i) - 1;
fSumRO2(i) = fSumRO2(i) + 1.0;
fHO2(i) = fHO2(i) + 0.5;
fOLEP(i) = fOLEP(i) + 0.5;
fAFG2A(i) = fAFG2A(i) + 0.25;
fMGLY(i) = fMGLY(i) + 0.25;
fBUDAL(i) = fBUDAL(i) + 0.25;
fBACL(i) = fBACL(i) + 0.25;
fXC(i) = fXC(i) -2.75;

%   34, <R034>
i = i + 1;
Rnames{i} = 'SVPHE_P1 + SumRCO3 = SumRCO3 + .8 HO2 + .4 AFG2A + .4 MGLY + .4 BUDAL + .4 BACL + .2 OLEP + -2 XC';
k(:,i) = 1.37e-11;
Gstr{i,1} = 'SVPHE_P1'; Gstr{i,2} = 'SumRCO3'; 
fSVPHE_P1(i) = fSVPHE_P1(i) - 1;
fSumRCO3(i) = fSumRCO3(i) - 1;
fSumRCO3(i) = fSumRCO3(i) + 1.0;
fHO2(i) = fHO2(i) + 0.8;
fAFG2A(i) = fAFG2A(i) + 0.4;
fMGLY(i) = fMGLY(i) + 0.4;
fBUDAL(i) = fBUDAL(i) + 0.4;
fBACL(i) = fBACL(i) + 0.4;
fOLEP(i) = fOLEP(i) + 0.2;
fXC(i) = fXC(i) -2.0;

%   35, <R035>
i = i + 1;
Rnames{i} = 'CRES + OH = .73 XYNL + .73 HO2 + .2 CRES_P1 + .07 BZO + -0.66 XC + .2 SumRO2';
k(:,i) = 1.6e-12 .* exp(998.8908./T) .* (T./300).^0.00;
Gstr{i,1} = 'CRES'; Gstr{i,2} = 'OH'; 
fCRES(i) = fCRES(i) - 1;
fOH(i) = fOH(i) - 1;
fXYNL(i) = fXYNL(i) + 0.73;
fHO2(i) = fHO2(i) + 0.73;
fCRES_P1(i) = fCRES_P1(i) + 0.2;
fBZO(i) = fBZO(i) + 0.07;
fXC(i) = fXC(i) -0.66;
fSumRO2(i) = fSumRO2(i) + 0.2;

%   36, <R036>
i = i + 1;
Rnames{i} = 'CRES + NO3 = BZO + XC + XN';
k(:,i) = 1.42e-11;
Gstr{i,1} = 'CRES'; Gstr{i,2} = 'NO3'; 
fCRES(i) = fCRES(i) - 1;
fNO3(i) = fNO3(i) - 1;
fBZO(i) = fBZO(i) + 1.0;
fXC(i) = fXC(i) + 1.0;
fXN(i) = fXN(i) + 1.0;

%   37, <R037>
i = i + 1;
Rnames{i} = 'CRES_P1 + NO = .406 AFG2A + .406 AFG2B + .811 GLY + .811 HO2 + .811 NO2 + .189 RPNO3 + -0.189 XC';
k(:,i) = 9.05e-12;
Gstr{i,1} = 'CRES_P1'; Gstr{i,2} = 'NO'; 
fCRES_P1(i) = fCRES_P1(i) - 1;
fNO(i) = fNO(i) - 1;
fAFG2A(i) = fAFG2A(i) + 0.406;
fAFG2B(i) = fAFG2B(i) + 0.406;
fGLY(i) = fGLY(i) + 0.811;
fHO2(i) = fHO2(i) + 0.811;
fNO2(i) = fNO2(i) + 0.811;
fRPNO3(i) = fRPNO3(i) + 0.189;
fXC(i) = fXC(i) -0.189;

%   38, <R038>
i = i + 1;
Rnames{i} = 'CRES_P1 + NO3 = .5 AFG2A + .5 AFG2B + GLY + HO2 + NO2';
k(:,i) = 2.30e-12;
Gstr{i,1} = 'CRES_P1'; Gstr{i,2} = 'NO3'; 
fCRES_P1(i) = fCRES_P1(i) - 1;
fNO3(i) = fNO3(i) - 1;
fAFG2A(i) = fAFG2A(i) + 0.5;
fAFG2B(i) = fAFG2B(i) + 0.5;
fGLY(i) = fGLY(i) + 1.0;
fHO2(i) = fHO2(i) + 1.0;
fNO2(i) = fNO2(i) + 1.0;

%   39, <R039>
i = i + 1;
Rnames{i} = 'CRES_P1 + HO2 = OTHN + -5 XC';
k(:,i) = 2.11e-11;
Gstr{i,1} = 'CRES_P1'; Gstr{i,2} = 'HO2'; 
fCRES_P1(i) = fCRES_P1(i) - 1;
fHO2(i) = fHO2(i) - 1;
fOTHN(i) = fOTHN(i) + 1.0;
fXC(i) = fXC(i) -5.0;

%   40, <R040>
i = i + 1;
Rnames{i} = 'CRES_P1 + SumRO2 = SumRO2 + .5 OLEP + .25 AFG2A + .25 AFG2B + .5 GLY + .5 HO2 + -1.5 XC';
k(:,i) = 3.71e-16;
Gstr{i,1} = 'CRES_P1'; Gstr{i,2} = 'SumRO2'; 
fCRES_P1(i) = fCRES_P1(i) - 1;
fSumRO2(i) = fSumRO2(i) - 1;
fSumRO2(i) = fSumRO2(i) + 1.0;
fOLEP(i) = fOLEP(i) + 0.5;
fAFG2A(i) = fAFG2A(i) + 0.25;
fAFG2B(i) = fAFG2B(i) + 0.25;
fGLY(i) = fGLY(i) + 0.5;
fHO2(i) = fHO2(i) + 0.5;
fXC(i) = fXC(i) -1.5;

%   41, <R041>
i = i + 1;
Rnames{i} = 'CRES_P1 + SumRCO3 = SumRCO3 + .5 AFG2A + .5 AFG2B + GLY + OH';
k(:,i) = 1.37e-11;
Gstr{i,1} = 'CRES_P1'; Gstr{i,2} = 'SumRCO3'; 
fCRES_P1(i) = fCRES_P1(i) - 1;
fSumRCO3(i) = fSumRCO3(i) - 1;
fSumRCO3(i) = fSumRCO3(i) + 1.0;
fAFG2A(i) = fAFG2A(i) + 0.5;
fAFG2B(i) = fAFG2B(i) + 0.5;
fGLY(i) = fGLY(i) + 1.0;
fOH(i) = fOH(i) + 1.0;

%   42, <R042>
i = i + 1;
Rnames{i} = '24M-PHEN + OH = .877 HO2 + .658 XYNL + .112 24M-PHEN_P1 + .105 OLEA2 + .062 XYNL + .036 OLEA1 + .017 LVKS + .011 BZO + -1.44 XC + .112 SumRO2';
k(:,i) = 7.40e-11;
Gstr{i,1} = 'M24PHEN'; Gstr{i,2} = 'OH'; 
fM24PHEN(i) = fM24PHEN(i) - 1;
fOH(i) = fOH(i) - 1;
fHO2(i) = fHO2(i) + 0.877;
fXYNL(i) = fXYNL(i) + 0.658;
fM24PHEN_P1(i) = fM24PHEN_P1(i) + 0.112;
fOLEA2(i) = fOLEA2(i) + 0.105;
fXYNL(i) = fXYNL(i) + 0.062;
fOLEA1(i) = fOLEA1(i) + 0.036;
fLVKS(i) = fLVKS(i) + 0.017;
fBZO(i) = fBZO(i) + 0.011;
fXC(i) = fXC(i) -1.44;
fSumRO2(i) = fSumRO2(i) + 0.112;

%   43, <R043>
i = i + 1;
Rnames{i} = '24M-PHEN + NO3 = BZO + 2 XC + XN';
k(:,i) = 3.12e-11;
Gstr{i,1} = 'M24PHEN'; Gstr{i,2} = 'NO3'; 
fM24PHEN(i) = fM24PHEN(i) - 1;
fNO3(i) = fNO3(i) - 1;
fBZO(i) = fBZO(i) + 1.0;
fXC(i) = fXC(i) + 2.0;
fXN(i) = fXN(i) + 1.0;

%   44, <R044>
i = i + 1;
Rnames{i} = '24M-PHEN_P1 + NO = .746 HO2 + .746 NO2 + .373 MGLY + .373 AFG2A + .373 AFG2B + .254 RPNO3 + .239 BACL + .134 GLY + -0.105 XC';
k(:,i) = 9.13e-12;
Gstr{i,1} = 'M24PHEN_P1'; Gstr{i,2} = 'NO'; 
fM24PHEN_P1(i) = fM24PHEN_P1(i) - 1;
fNO(i) = fNO(i) - 1;
fHO2(i) = fHO2(i) + 0.746;
fNO2(i) = fNO2(i) + 0.746;
fMGLY(i) = fMGLY(i) + 0.373;
fAFG2A(i) = fAFG2A(i) + 0.373;
fAFG2B(i) = fAFG2B(i) + 0.373;
fRPNO3(i) = fRPNO3(i) + 0.254;
fBACL(i) = fBACL(i) + 0.239;
fGLY(i) = fGLY(i) + 0.134;
fXC(i) = fXC(i) -0.105;

%   45, <R045>
i = i + 1;
Rnames{i} = '24M-PHEN_P1 + NO3 = HO2 + NO2 + .5 MGLY + .5 AFG2A + .5 AFG2B + .32 BACL + .18 GLY + -0.14 XC';
k(:,i) = 2.30e-12;
Gstr{i,1} = 'M24PHEN_P1'; Gstr{i,2} = 'NO3'; 
fM24PHEN_P1(i) = fM24PHEN_P1(i) - 1;
fNO3(i) = fNO3(i) - 1;
fHO2(i) = fHO2(i) + 1.0;
fNO2(i) = fNO2(i) + 1.0;
fMGLY(i) = fMGLY(i) + 0.5;
fAFG2A(i) = fAFG2A(i) + 0.5;
fAFG2B(i) = fAFG2B(i) + 0.5;
fBACL(i) = fBACL(i) + 0.32;
fGLY(i) = fGLY(i) + 0.18;
fXC(i) = fXC(i) -0.14;

%   46, <R046>
i = i + 1;
Rnames{i} = '24M-PHEN_P1 + HO2 = .641 RAOOH + .359 OTHN + -1.436 XC';
k(:,i) = 2.11e-11;
Gstr{i,1} = 'M24PHEN_P1'; Gstr{i,2} = 'HO2'; 
fM24PHEN_P1(i) = fM24PHEN_P1(i) - 1;
fHO2(i) = fHO2(i) - 1;
fRAOOH(i) = fRAOOH(i) + 0.641;
fOTHN(i) = fOTHN(i) + 0.359;
fXC(i) = fXC(i) -1.436;

%   47, <R047>
i = i + 1;
Rnames{i} = '24M-PHEN_P1 + SumRO2 = SumRO2 + .5 OLEP + .5 HO2 + .25 MGLY + .25 AFG2A + .25 AFG2B + .16 BACL + .09 GLY + -1.07 XC';
k(:,i) = 1.36e-12;
Gstr{i,1} = 'M24PHEN_P1'; Gstr{i,2} = 'SumRO2'; 
fM24PHEN_P1(i) = fM24PHEN_P1(i) - 1;
fSumRO2(i) = fSumRO2(i) - 1;
fSumRO2(i) = fSumRO2(i) + 1.0;
fOLEP(i) = fOLEP(i) + 0.5;
fHO2(i) = fHO2(i) + 0.5;
fMGLY(i) = fMGLY(i) + 0.25;
fAFG2A(i) = fAFG2A(i) + 0.25;
fAFG2B(i) = fAFG2B(i) + 0.25;
fBACL(i) = fBACL(i) + 0.16;
fGLY(i) = fGLY(i) + 0.09;
fXC(i) = fXC(i) -1.07;

%   48, <R048>
i = i + 1;
Rnames{i} = '24M-PHEN_P1 + SumRCO3 = SumRCO3 + .894 HO2 + .458 MGLY + .447 AFG2A + .447 AFG2B + .256 BACL + .18 GLY + .106 OLEP + -0.288 XC';
k(:,i) = 1.37e-11;
Gstr{i,1} = 'M24PHEN_P1'; Gstr{i,2} = 'SumRCO3'; 
fM24PHEN_P1(i) = fM24PHEN_P1(i) - 1;
fSumRCO3(i) = fSumRCO3(i) - 1;
fSumRCO3(i) = fSumRCO3(i) + 1.0;
fHO2(i) = fHO2(i) + 0.894;
fMGLY(i) = fMGLY(i) + 0.458;
fAFG2A(i) = fAFG2A(i) + 0.447;
fAFG2B(i) = fAFG2B(i) + 0.447;
fBACL(i) = fBACL(i) + 0.256;
fGLY(i) = fGLY(i) + 0.18;
fOLEP(i) = fOLEP(i) + 0.106;
fXC(i) = fXC(i) -0.288;

%   49, <R049>
i = i + 1;
Rnames{i} = 'XYNL + OH = .877 HO2 + .658 XYNL + .112 XYNL_P1 + .105 OLEA2 + .062 XYNL + .036 OLEA1 + .017 LVKS + .011 BZO + -1.44 XC + .112 SumRO2';
k(:,i) = 7.40e-11;
Gstr{i,1} = 'XYNL'; Gstr{i,2} = 'OH'; 
fXYNL(i) = fXYNL(i) - 1;
fOH(i) = fOH(i) - 1;
fHO2(i) = fHO2(i) + 0.877;
fXYNL(i) = fXYNL(i) + 0.658;
fXYNL_P1(i) = fXYNL_P1(i) + 0.112;
fOLEA2(i) = fOLEA2(i) + 0.105;
fXYNL(i) = fXYNL(i) + 0.062;
fOLEA1(i) = fOLEA1(i) + 0.036;
fLVKS(i) = fLVKS(i) + 0.017;
fBZO(i) = fBZO(i) + 0.011;
fXC(i) = fXC(i) -1.44;
fSumRO2(i) = fSumRO2(i) + 0.112;

%   50, <R050>
i = i + 1;
Rnames{i} = 'XYNL + NO3 = BZO + 2 XC + XN';
k(:,i) = 3.12e-11;
Gstr{i,1} = 'XYNL'; Gstr{i,2} = 'NO3'; 
fXYNL(i) = fXYNL(i) - 1;
fNO3(i) = fNO3(i) - 1;
fBZO(i) = fBZO(i) + 1.0;
fXC(i) = fXC(i) + 2.0;
fXN(i) = fXN(i) + 1.0;

%   51, <R051>
i = i + 1;
Rnames{i} = 'XYNL_P1 + NO = .746 HO2 + .746 NO2 + .373 MGLY + .373 AFG2A + .373 AFG2B + .254 RPNO3 + .239 BACL + .134 GLY + -0.105 XC';
k(:,i) = 9.13e-12;
Gstr{i,1} = 'XYNL_P1'; Gstr{i,2} = 'NO'; 
fXYNL_P1(i) = fXYNL_P1(i) - 1;
fNO(i) = fNO(i) - 1;
fHO2(i) = fHO2(i) + 0.746;
fNO2(i) = fNO2(i) + 0.746;
fMGLY(i) = fMGLY(i) + 0.373;
fAFG2A(i) = fAFG2A(i) + 0.373;
fAFG2B(i) = fAFG2B(i) + 0.373;
fRPNO3(i) = fRPNO3(i) + 0.254;
fBACL(i) = fBACL(i) + 0.239;
fGLY(i) = fGLY(i) + 0.134;
fXC(i) = fXC(i) -0.105;

%   52, <R052>
i = i + 1;
Rnames{i} = 'XYNL_P1 + NO3 = HO2 + NO2 + .5 MGLY + .5 AFG2A + .5 AFG2B + .32 BACL + .18 GLY + -0.14 XC';
k(:,i) = 2.30e-12;
Gstr{i,1} = 'XYNL_P1'; Gstr{i,2} = 'NO3'; 
fXYNL_P1(i) = fXYNL_P1(i) - 1;
fNO3(i) = fNO3(i) - 1;
fHO2(i) = fHO2(i) + 1.0;
fNO2(i) = fNO2(i) + 1.0;
fMGLY(i) = fMGLY(i) + 0.5;
fAFG2A(i) = fAFG2A(i) + 0.5;
fAFG2B(i) = fAFG2B(i) + 0.5;
fBACL(i) = fBACL(i) + 0.32;
fGLY(i) = fGLY(i) + 0.18;
fXC(i) = fXC(i) -0.14;

%   53, <R053>
i = i + 1;
Rnames{i} = 'XYNL_P1 + HO2 = .641 RAOOH + .359 OTHN + -1.436 XC';
k(:,i) = 2.11e-11;
Gstr{i,1} = 'XYNL_P1'; Gstr{i,2} = 'HO2'; 
fXYNL_P1(i) = fXYNL_P1(i) - 1;
fHO2(i) = fHO2(i) - 1;
fRAOOH(i) = fRAOOH(i) + 0.641;
fOTHN(i) = fOTHN(i) + 0.359;
fXC(i) = fXC(i) -1.436;

%   54, <R054>
i = i + 1;
Rnames{i} = 'XYNL_P1 + SumRO2 = SumRO2 + .5 OLEP + .5 HO2 + .25 MGLY + .25 AFG2A + .25 AFG2B + .16 BACL + .09 GLY + -1.07 XC';
k(:,i) = 1.36e-12;
Gstr{i,1} = 'XYNL_P1'; Gstr{i,2} = 'SumRO2'; 
fXYNL_P1(i) = fXYNL_P1(i) - 1;
fSumRO2(i) = fSumRO2(i) - 1;
fSumRO2(i) = fSumRO2(i) + 1.0;
fOLEP(i) = fOLEP(i) + 0.5;
fHO2(i) = fHO2(i) + 0.5;
fMGLY(i) = fMGLY(i) + 0.25;
fAFG2A(i) = fAFG2A(i) + 0.25;
fAFG2B(i) = fAFG2B(i) + 0.25;
fBACL(i) = fBACL(i) + 0.16;
fGLY(i) = fGLY(i) + 0.09;
fXC(i) = fXC(i) -1.07;

%   55, <R055>
i = i + 1;
Rnames{i} = 'XYNL_P1 + SumRCO3 = SumRCO3 + .894 HO2 + .458 MGLY + .447 AFG2A + .447 AFG2B + .256 BACL + .18 GLY + .106 OLEP + -0.288 XC';
k(:,i) = 1.37e-11;
Gstr{i,1} = 'XYNL_P1'; Gstr{i,2} = 'SumRCO3'; 
fXYNL_P1(i) = fXYNL_P1(i) - 1;
fSumRCO3(i) = fSumRCO3(i) - 1;
fSumRCO3(i) = fSumRCO3(i) + 1.0;
fHO2(i) = fHO2(i) + 0.894;
fMGLY(i) = fMGLY(i) + 0.458;
fAFG2A(i) = fAFG2A(i) + 0.447;
fAFG2B(i) = fAFG2B(i) + 0.447;
fBACL(i) = fBACL(i) + 0.256;
fGLY(i) = fGLY(i) + 0.18;
fOLEP(i) = fOLEP(i) + 0.106;
fXC(i) = fXC(i) -0.288;


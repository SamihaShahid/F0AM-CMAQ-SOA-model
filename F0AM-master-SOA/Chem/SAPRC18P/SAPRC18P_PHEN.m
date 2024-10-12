% MechGen derived explicit mechanism
% File created by Jia Jiang

SpeciesToAdd = {...
'HCHDO'; 'AFG4'; 'AFG4A'; 'PHEN_A1'; 'PHEN_P1'; 'PHEN_P2';'SVPHE_P1'; ...
'HCHDO_A1'; 'HCHDO_P1'; 'CRES_P1'; 'XYNL_P1'; 'AFG4_R1'; 'AFG4_P1';...
'AFG4_P2'; 'AFG4A_R1'; 'AFG4A_P1'; 'AFG4A_P2'; 'SumRO2'; 'SumRCO3';
'TOLRO2';};

AddSpecies


% Reactions:
%   1, <R001>
i = i + 1;
Rnames{i} = 'PHEN + OH = .95 PHEN_A1 + .05 BZO + .00 HO2 + TOLRO2';
k(:,i) = 4.7e-13 .* exp(1219.8041./T) .* (T./300).^0.00;
Gstr{i,1} = 'PHEN'; Gstr{i,2} = 'OH'; 
fPHEN(i) = fPHEN(i) - 1;
fOH(i) = fOH(i) - 1;
fPHEN_A1(i) = fPHEN_A1(i) + 0.95;
fBZO(i) = fBZO(i) + 0.05;
fHO2(i) = fHO2(i) + 0.0;
fTOLRO2(i) = fTOLRO2(i) + 1;

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
Rnames{i} = 'PHEN_A1 + O2 = .25 PHEN_P1 + .75 SVPHE + .75 HO2';
k(:,i) = 2.87e+6;
Gstr{i,1} = 'PHEN_A1';
fPHEN_A1(i) = fPHEN_A1(i) - 1;
fPHEN_P1(i) = fPHEN_P1(i) + 0.25;
fSVPHE(i) = fSVPHE(i) + 0.75;
fHO2(i) = fHO2(i) + 0.75;

%   4, <R004>
i = i + 1;
Rnames{i} = 'PHEN_A1 + NO2 = SVPHE + HONO';
k(:,i) = 3.00e-11;
Gstr{i,1} = 'PHEN_A1'; Gstr{i,2} = 'NO2'; 
fPHEN_A1(i) = fPHEN_A1(i) - 1;
fNO2(i) = fNO2(i) - 1;
fSVPHE(i) = fSVPHE(i) + 1.0;
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

%   22, <R022>
i = i + 1;
Rnames{i} = 'SVPHE + NO3 = BZO + XN';
k(:,i) = 0.98e-10;
Gstr{i,1} = 'SVPHE'; Gstr{i,2} = 'NO3'; 
fSVPHE(i) = fSVPHE(i) - 1;
fNO3(i) = fNO3(i) - 1;
fBZO(i) = fBZO(i) + 1.0;
fXN(i) = fXN(i) + 1.0;

%   23, <R023>
i = i + 1;
Rnames{i} = 'SVPHE_P1 + NO = .876 HO2 + .876 NO2 + .438 AFG4A + .438 MGLY + .438 BUDAL + .438 BACL + .124 RPNO3 + -1.562 XC';
k(:,i) = 9.13e-12;
Gstr{i,1} = 'SVPHE_P1'; Gstr{i,2} = 'NO'; 
fSVPHE_P1(i) = fSVPHE_P1(i) - 1;
fNO(i) = fNO(i) - 1;
fHO2(i) = fHO2(i) + 0.876;
fNO2(i) = fNO2(i) + 0.876;
fAFG4A(i) = fAFG4A(i) + 0.438;
fMGLY(i) = fMGLY(i) + 0.438;
fBUDAL(i) = fBUDAL(i) + 0.438;
fBACL(i) = fBACL(i) + 0.438;
fRPNO3(i) = fRPNO3(i) + 0.124;
fXC(i) = fXC(i) -1.562;

%   24, <R024>
i = i + 1;
Rnames{i} = 'SVPHE_P1 + NO3 = HO2 + NO2 + .5 AFG4A + .5 MGLY + .5 BUDAL + .5 BACL + -1.5 XC';
k(:,i) = 2.30e-12;
Gstr{i,1} = 'SVPHE_P1'; Gstr{i,2} = 'NO3'; 
fSVPHE_P1(i) = fSVPHE_P1(i) - 1;
fNO3(i) = fNO3(i) - 1;
fHO2(i) = fHO2(i) + 1.0;
fNO2(i) = fNO2(i) + 1.0;
fAFG4A(i) = fAFG4A(i) + 0.5;
fMGLY(i) = fMGLY(i) + 0.5;
fBUDAL(i) = fBUDAL(i) + 0.5;
fBACL(i) = fBACL(i) + 0.5;
fXC(i) = fXC(i) -1.5;

%   25, <R025>
i = i + 1;
Rnames{i} = 'SVPHE_P1 + HO2 = OTHN + -6 XC';
k(:,i) = 1.95e-11;
Gstr{i,1} = 'SVPHE_P1'; Gstr{i,2} = 'HO2'; 
fSVPHE_P1(i) = fSVPHE_P1(i) - 1;
fHO2(i) = fHO2(i) - 1;
fOTHN(i) = fOTHN(i) + 1.0;
fXC(i) = fXC(i) -6.0;

%   26, <R026>
i = i + 1;
Rnames{i} = 'SVPHE_P1 + SumRO2 = SumRO2 + .5 HO2 + .5 OLEP + .25 AFG4A + .25 MGLY + .25 BUDAL + .25 BACL + -2.75 XC';
k(:,i) = 2.57e-12;
Gstr{i,1} = 'SVPHE_P1'; Gstr{i,2} = 'SumRO2'; 
fSVPHE_P1(i) = fSVPHE_P1(i) - 1;
fSumRO2(i) = fSumRO2(i) - 1;
fSumRO2(i) = fSumRO2(i) + 1.0;
fHO2(i) = fHO2(i) + 0.5;
fOLEP(i) = fOLEP(i) + 0.5;
fAFG4A(i) = fAFG4A(i) + 0.25;
fMGLY(i) = fMGLY(i) + 0.25;
fBUDAL(i) = fBUDAL(i) + 0.25;
fBACL(i) = fBACL(i) + 0.25;
fXC(i) = fXC(i) -2.75;

%   27, <R027>
i = i + 1;
Rnames{i} = 'SVPHE_P1 + SumRCO3 = SumRCO3 + .8 HO2 + .4 AFG4A + .4 MGLY + .4 BUDAL + .4 BACL + .2 OLEP + -2 XC';
k(:,i) = 1.37e-11;
Gstr{i,1} = 'SVPHE_P1'; Gstr{i,2} = 'SumRCO3'; 
fSVPHE_P1(i) = fSVPHE_P1(i) - 1;
fSumRCO3(i) = fSumRCO3(i) - 1;
fSumRCO3(i) = fSumRCO3(i) + 1.0;
fHO2(i) = fHO2(i) + 0.8;
fAFG4A(i) = fAFG4A(i) + 0.4;
fMGLY(i) = fMGLY(i) + 0.4;
fBUDAL(i) = fBUDAL(i) + 0.4;
fBACL(i) = fBACL(i) + 0.4;
fOLEP(i) = fOLEP(i) + 0.2;
fXC(i) = fXC(i) -2.0;

%   28, <R028>
i = i + 1;
Rnames{i} = 'CRES + OH = .73 XYNL + .73 HO2 + .2 CRES_P1 + .07 BZO + -0.66 XC + .2 SumRO2 + TOLRO2';
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
fTOLO2(i) = fTOLRO2(i) + 1;

%   29, <R029>
i = i + 1;
Rnames{i} = 'CRES + NO3 = BZO + XC + XN';
k(:,i) = 1.42e-11;
Gstr{i,1} = 'CRES'; Gstr{i,2} = 'NO3'; 
fCRES(i) = fCRES(i) - 1;
fNO3(i) = fNO3(i) - 1;
fBZO(i) = fBZO(i) + 1.0;
fXC(i) = fXC(i) + 1.0;
fXN(i) = fXN(i) + 1.0;

%   30, <R030>
i = i + 1;
Rnames{i} = 'CRES_P1 + NO = .811 AFG4 + .811 GLY + .811 HO2 + .811 NO2 + .189 RPNO3 + -0.189 XC';
k(:,i) = 9.05e-12;
Gstr{i,1} = 'CRES_P1'; Gstr{i,2} = 'NO'; 
fCRES_P1(i) = fCRES_P1(i) - 1;
fNO(i) = fNO(i) - 1;
fAFG4(i) = fAFG4(i) + 0.811;
fGLY(i) = fGLY(i) + 0.811;
fHO2(i) = fHO2(i) + 0.811;
fNO2(i) = fNO2(i) + 0.811;
fRPNO3(i) = fRPNO3(i) + 0.189;
fXC(i) = fXC(i) -0.189;

%   31, <R031>
i = i + 1;
Rnames{i} = 'CRES_P1 + NO3 = AFG4 + GLY + HO2 + NO2';
k(:,i) = 2.30e-12;
Gstr{i,1} = 'CRES_P1'; Gstr{i,2} = 'NO3'; 
fCRES_P1(i) = fCRES_P1(i) - 1;
fNO3(i) = fNO3(i) - 1;
fAFG4(i) = fAFG4(i) + 1.0;
fGLY(i) = fGLY(i) + 1.0;
fHO2(i) = fHO2(i) + 1.0;
fNO2(i) = fNO2(i) + 1.0;

%   32, <R032>
i = i + 1;
Rnames{i} = 'CRES_P1 + HO2 = OTHN + -5 XC';
k(:,i) = 2.11e-11;
Gstr{i,1} = 'CRES_P1'; Gstr{i,2} = 'HO2'; 
fCRES_P1(i) = fCRES_P1(i) - 1;
fHO2(i) = fHO2(i) - 1;
fOTHN(i) = fOTHN(i) + 1.0;
fXC(i) = fXC(i) -5.0;

%   33, <R033>
i = i + 1;
Rnames{i} = 'CRES_P1 + SumRO2 = SumRO2 + .5 OLEP + .5 AFG4 + .5 GLY + .5 HO2 + -1.5 XC';
k(:,i) = 3.71e-16;
Gstr{i,1} = 'CRES_P1'; Gstr{i,2} = 'SumRO2'; 
fCRES_P1(i) = fCRES_P1(i) - 1;
fSumRO2(i) = fSumRO2(i) - 1;
fSumRO2(i) = fSumRO2(i) + 1.0;
fOLEP(i) = fOLEP(i) + 0.5;
fAFG4(i) = fAFG4(i) + 0.5;
fGLY(i) = fGLY(i) + 0.5;
fHO2(i) = fHO2(i) + 0.5;
fXC(i) = fXC(i) -1.5;

%   34, <R034>
i = i + 1;
Rnames{i} = 'CRES_P1 + SumRCO3 = SumRCO3 + AFG4 + GLY + HO2';
k(:,i) = 1.37e-11;
Gstr{i,1} = 'CRES_P1'; Gstr{i,2} = 'SumRCO3'; 
fCRES_P1(i) = fCRES_P1(i) - 1;
fSumRCO3(i) = fSumRCO3(i) - 1;
fSumRCO3(i) = fSumRCO3(i) + 1.0;
fAFG4(i) = fAFG4(i) + 1.0;
fGLY(i) = fGLY(i) + 1.0;
fHO2(i) = fHO2(i) + 1.0;

%   35, <R035>
i = i + 1;
Rnames{i} = 'XYNL + OH = .877 HO2 + .658 XYNL + .112 XYNL_P1 + .105 OLEA2 + .062 XYNL + .036 OLEA1 + .017 LVKS + .011 BZO + -1.44 XC + .112 SumRO2 + TOLRO2';
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
fTOLRO2(i) = fTOLRO2(i) + 1;

%   36, <R036>
i = i + 1;
Rnames{i} = 'XYNL + NO3 = BZO + 2 XC + XN';
k(:,i) = 3.12e-11;
Gstr{i,1} = 'XYNL'; Gstr{i,2} = 'NO3'; 
fXYNL(i) = fXYNL(i) - 1;
fNO3(i) = fNO3(i) - 1;
fBZO(i) = fBZO(i) + 1.0;
fXC(i) = fXC(i) + 2.0;
fXN(i) = fXN(i) + 1.0;

%   37, <R037>
i = i + 1;
Rnames{i} = 'XYNL_P1 + NO = .746 HO2 + .746 NO2 + .373 MGLY + .291 AFG2A + .254 RPNO3 + .239 BACL + .239 AFG1 + .216 AFG4 + .134 GLY + -0.105 XC';
k(:,i) = 9.13e-12;
Gstr{i,1} = 'XYNL_P1'; Gstr{i,2} = 'NO'; 
fXYNL_P1(i) = fXYNL_P1(i) - 1;
fNO(i) = fNO(i) - 1;
fHO2(i) = fHO2(i) + 0.746;
fNO2(i) = fNO2(i) + 0.746;
fMGLY(i) = fMGLY(i) + 0.373;
fAFG2A(i) = fAFG2A(i) + 0.291;
fRPNO3(i) = fRPNO3(i) + 0.254;
fBACL(i) = fBACL(i) + 0.239;
fAFG1(i) = fAFG1(i) + 0.239;
fAFG4(i) = fAFG4(i) + 0.216;
fGLY(i) = fGLY(i) + 0.134;
fXC(i) = fXC(i) -0.105;

%   38, <R038>
i = i + 1;
Rnames{i} = 'XYNL_P1 + NO3 = HO2 + NO2 + .5 MGLY + .39 AFG2A + .32 BACL + .32 AFG1 + .29 AFG4 + .18 GLY + -0.14 XC';
k(:,i) = 2.30e-12;
Gstr{i,1} = 'XYNL_P1'; Gstr{i,2} = 'NO3'; 
fXYNL_P1(i) = fXYNL_P1(i) - 1;
fNO3(i) = fNO3(i) - 1;
fHO2(i) = fHO2(i) + 1.0;
fNO2(i) = fNO2(i) + 1.0;
fMGLY(i) = fMGLY(i) + 0.5;
fAFG2A(i) = fAFG2A(i) + 0.39;
fBACL(i) = fBACL(i) + 0.32;
fAFG1(i) = fAFG1(i) + 0.32;
fAFG4(i) = fAFG4(i) + 0.29;
fGLY(i) = fGLY(i) + 0.18;
fXC(i) = fXC(i) -0.14;

%   39, <R039>
i = i + 1;
Rnames{i} = 'XYNL_P1 + HO2 = .641 RAOOH + .359 OTHN + -1.436 XC';
k(:,i) = 2.11e-11;
Gstr{i,1} = 'XYNL_P1'; Gstr{i,2} = 'HO2'; 
fXYNL_P1(i) = fXYNL_P1(i) - 1;
fHO2(i) = fHO2(i) - 1;
fRAOOH(i) = fRAOOH(i) + 0.641;
fOTHN(i) = fOTHN(i) + 0.359;
fXC(i) = fXC(i) -1.436;

%   40, <R040>
i = i + 1;
Rnames{i} = 'XYNL_P1 + SumRO2 = SumRO2 + .5 OLEP + .5 HO2 + .25 MGLY + .195 AFG2A + .16 BACL + .16 AFG1 + .145 AFG4 + .09 GLY + -1.07 XC';
k(:,i) = 1.36e-12;
Gstr{i,1} = 'XYNL_P1'; Gstr{i,2} = 'SumRO2'; 
fXYNL_P1(i) = fXYNL_P1(i) - 1;
fSumRO2(i) = fSumRO2(i) - 1;
fSumRO2(i) = fSumRO2(i) + 1.0;
fOLEP(i) = fOLEP(i) + 0.5;
fHO2(i) = fHO2(i) + 0.5;
fMGLY(i) = fMGLY(i) + 0.25;
fAFG2A(i) = fAFG2A(i) + 0.195;
fBACL(i) = fBACL(i) + 0.16;
fAFG1(i) = fAFG1(i) + 0.16;
fAFG4(i) = fAFG4(i) + 0.145;
fGLY(i) = fGLY(i) + 0.09;
fXC(i) = fXC(i) -1.07;

%   41, <R041>
i = i + 1;
Rnames{i} = 'XYNL_P1 + SumRCO3 = SumRCO3 + .894 HO2 + .458 MGLY + .348 AFG2A + .29 AFG4 + .256 BACL + .256 AFG1 + .18 GLY + .106 OLEP + -0.288 XC';
k(:,i) = 1.37e-11;
Gstr{i,1} = 'XYNL_P1'; Gstr{i,2} = 'SumRCO3'; 
fXYNL_P1(i) = fXYNL_P1(i) - 1;
fSumRCO3(i) = fSumRCO3(i) - 1;
fSumRCO3(i) = fSumRCO3(i) + 1.0;
fHO2(i) = fHO2(i) + 0.894;
fMGLY(i) = fMGLY(i) + 0.458;
fAFG2A(i) = fAFG2A(i) + 0.348;
fAFG4(i) = fAFG4(i) + 0.29;
fBACL(i) = fBACL(i) + 0.256;
fAFG1(i) = fAFG1(i) + 0.256;
fGLY(i) = fGLY(i) + 0.18;
fOLEP(i) = fOLEP(i) + 0.106;
fXC(i) = fXC(i) -0.288;

%   42, <R042>
i = i + 1;
Rnames{i} = 'AFG4 + OH = .349 MACO3 + .288 AFG4_R1 + .23 AFG4_P1 + .097 OH + .062 RO2C + .036 CO2 + .035 MGLY + .034 ROOH + .026 HO2 + .023 RCHO + .019 AFG3 + .014 KET2 + .012 BACL + .009 RO2XC + .008 zRCNO3 + .004 HPALD + .004 GLY + .004 AFG4 + .001 zRNNO3 + .001 CO + .262 XC + .301 SumRO2 + .349 SumRCO3';
k(:,i) = 5.53e-11;
Gstr{i,1} = 'AFG4'; Gstr{i,2} = 'OH'; 
fAFG4(i) = fAFG4(i) - 1;
fOH(i) = fOH(i) - 1;
fMACO3(i) = fMACO3(i) + 0.349;
fAFG4_R1(i) = fAFG4_R1(i) + 0.288;
fAFG4_P1(i) = fAFG4_P1(i) + 0.23;
fOH(i) = fOH(i) + 0.097;
fRO2C(i) = fRO2C(i) + 0.062;
fCO2(i) = fCO2(i) + 0.036;
fMGLY(i) = fMGLY(i) + 0.035;
fROOH(i) = fROOH(i) + 0.034;
fHO2(i) = fHO2(i) + 0.026;
fRCHO(i) = fRCHO(i) + 0.023;
fAFG3(i) = fAFG3(i) + 0.019;
fKET2(i) = fKET2(i) + 0.014;
fBACL(i) = fBACL(i) + 0.012;
fRO2XC(i) = fRO2XC(i) + 0.009;
fzRCNO3(i) = fzRCNO3(i) + 0.008;
fHPALD(i) = fHPALD(i) + 0.004;
fGLY(i) = fGLY(i) + 0.004;
fAFG4(i) = fAFG4(i) + 0.004;
fzRNNO3(i) = fzRNNO3(i) + 0.001;
fCO(i) = fCO(i) + 0.001;
fXC(i) = fXC(i) + 0.262;
fSumRO2(i) = fSumRO2(i) + 0.301;
fSumRCO3(i) = fSumRCO3(i) + 0.349;

%   43, <R043>
i = i + 1;
Rnames{i} = 'AFG4 + HV = OH + .934 MALAH + .846 MEO2 + .088 ETO2 + .057 MACO3 + .009 HCHO + .007 RO2C + .003 HPALD + .003 HO2 + .003 R2CO3 + .003 AFG4 + .002 RO2XC + .002 zRCNO3 + .001 OTHN + -0.059 XC + .943 SumRO2 + .06 SumRCO3';
k(:,i) = JAFGS * 0.200;
Gstr{i,1} = 'AFG4'; 
fAFG4(i) = fAFG4(i) - 1;
fOH(i) = fOH(i) + 1.0;
fMALAH(i) = fMALAH(i) + 0.934;
fMEO2(i) = fMEO2(i) + 0.846;
fETO2(i) = fETO2(i) + 0.088;
fMACO3(i) = fMACO3(i) + 0.057;
fHCHO(i) = fHCHO(i) + 0.009;
fRO2C(i) = fRO2C(i) + 0.007;
fHPALD(i) = fHPALD(i) + 0.003;
fHO2(i) = fHO2(i) + 0.003;
fR2CO3(i) = fR2CO3(i) + 0.003;
fAFG4(i) = fAFG4(i) + 0.003;
fRO2XC(i) = fRO2XC(i) + 0.002;
fzRCNO3(i) = fzRCNO3(i) + 0.002;
fOTHN(i) = fOTHN(i) + 0.001;
fXC(i) = fXC(i) -0.059;
fSumRO2(i) = fSumRO2(i) + 0.943;
fSumRCO3(i) = fSumRCO3(i) + 0.06;

%   44, <R044>
i = i + 1;
Rnames{i} = 'AFG4_R1 = AFG4_P2 + SumRO2';
k(:,i) = 164000000000.0 .* exp(-7848.2118./T) .* (T./300).^0.00;
Gstr{i,1} = 'AFG4_R1'; 
fAFG4_R1(i) = fAFG4_R1(i) - 1;
fAFG4_P2(i) = fAFG4_P2(i) + 1.0;
fSumRO2(i) = fSumRO2(i) + 1.0;

%   45, <R045>
i = i + 1;
Rnames{i} = 'AFG4_R1 + NO = .948 HO2 + .948 NO2 + .86 MGLY + .86 GLY + .088 RCHO + .088 CO + .052 RCNO3';
k(:,i) = 9.13e-12;
Gstr{i,1} = 'AFG4_R1'; Gstr{i,2} = 'NO'; 
fAFG4_R1(i) = fAFG4_R1(i) - 1;
fNO(i) = fNO(i) - 1;
fHO2(i) = fHO2(i) + 0.948;
fNO2(i) = fNO2(i) + 0.948;
fMGLY(i) = fMGLY(i) + 0.86;
fGLY(i) = fGLY(i) + 0.86;
fRCHO(i) = fRCHO(i) + 0.088;
fCO(i) = fCO(i) + 0.088;
fRCNO3(i) = fRCNO3(i) + 0.052;

%   46, <R046>
i = i + 1;
Rnames{i} = 'AFG4_P1 + NO = .929 NO2 + .74 CROOH + .675 MECO3 + .355 MGLY + .182 HO2 + .071 RCNO3 + .065 ETCO3 + .007 MECHO + .007 MALAH + .007 OH + .004 HPALD + .001 BACL + -3.215 XC + .74 SumRCO3';
k(:,i) = 9.13e-12;
Gstr{i,1} = 'AFG4_P1'; Gstr{i,2} = 'NO'; 
fAFG4_P1(i) = fAFG4_P1(i) - 1;
fNO(i) = fNO(i) - 1;
fNO2(i) = fNO2(i) + 0.929;
fCROOH(i) = fCROOH(i) + 0.74;
fMECO3(i) = fMECO3(i) + 0.675;
fMGLY(i) = fMGLY(i) + 0.355;
fHO2(i) = fHO2(i) + 0.182;
fRCNO3(i) = fRCNO3(i) + 0.071;
fETCO3(i) = fETCO3(i) + 0.065;
fMECHO(i) = fMECHO(i) + 0.007;
fMALAH(i) = fMALAH(i) + 0.007;
fOH(i) = fOH(i) + 0.007;
fHPALD(i) = fHPALD(i) + 0.004;
fBACL(i) = fBACL(i) + 0.001;
fXC(i) = fXC(i) -3.215;
fSumRCO3(i) = fSumRCO3(i) + 0.74;

%   47, <R047>
i = i + 1;
Rnames{i} = 'AFG4_P1 + NO3 = NO2 + .796 CROOH + .722 MECO3 + .381 MGLY + .196 HO2 + .074 ETCO3 + .008 MECHO + .008 MALAH + .008 OH + .004 HPALD + .002 BACL + -3.461 XC + .796 SumRCO3';
k(:,i) = 2.30e-12;
Gstr{i,1} = 'AFG4_P1'; Gstr{i,2} = 'NO3'; 
fAFG4_P1(i) = fAFG4_P1(i) - 1;
fNO3(i) = fNO3(i) - 1;
fNO2(i) = fNO2(i) + 1.0;
fCROOH(i) = fCROOH(i) + 0.796;
fMECO3(i) = fMECO3(i) + 0.722;
fMGLY(i) = fMGLY(i) + 0.381;
fHO2(i) = fHO2(i) + 0.196;
fETCO3(i) = fETCO3(i) + 0.074;
fMECHO(i) = fMECHO(i) + 0.008;
fMALAH(i) = fMALAH(i) + 0.008;
fOH(i) = fOH(i) + 0.008;
fHPALD(i) = fHPALD(i) + 0.004;
fBACL(i) = fBACL(i) + 0.002;
fXC(i) = fXC(i) -3.461;
fSumRCO3(i) = fSumRCO3(i) + 0.796;

%   48, <R048>
i = i + 1;
Rnames{i} = 'AFG4_P1 + HO2 = .805 CROOH + .099 BACL + .084 OTHN + .012 HPALD + -2.111 XC';
k(:,i) = 1.80e-11;
Gstr{i,1} = 'AFG4_P1'; Gstr{i,2} = 'HO2'; 
fAFG4_P1(i) = fAFG4_P1(i) - 1;
fHO2(i) = fHO2(i) - 1;
fCROOH(i) = fCROOH(i) + 0.805;
fBACL(i) = fBACL(i) + 0.099;
fOTHN(i) = fOTHN(i) + 0.084;
fHPALD(i) = fHPALD(i) + 0.012;
fXC(i) = fXC(i) -2.111;

%   49, <R049>
i = i + 1;
Rnames{i} = 'AFG4_P1 + SumRO2 = SumRO2 + .645 CROOH + .361 MECO3 + .248 BACL + .19 MGLY + .098 HO2 + .037 ETCO3 + .008 HPALD + .004 MECHO + .004 MALAH + .004 OH + -1.982 XC + .398 SumRCO3';
k(:,i) = 2.56e-12;
Gstr{i,1} = 'AFG4_P1'; Gstr{i,2} = 'SumRO2'; 
fAFG4_P1(i) = fAFG4_P1(i) - 1;
fSumRO2(i) = fSumRO2(i) - 1;
fSumRO2(i) = fSumRO2(i) + 1.0;
fCROOH(i) = fCROOH(i) + 0.645;
fMECO3(i) = fMECO3(i) + 0.361;
fBACL(i) = fBACL(i) + 0.248;
fMGLY(i) = fMGLY(i) + 0.19;
fHO2(i) = fHO2(i) + 0.098;
fETCO3(i) = fETCO3(i) + 0.037;
fHPALD(i) = fHPALD(i) + 0.008;
fMECHO(i) = fMECHO(i) + 0.004;
fMALAH(i) = fMALAH(i) + 0.004;
fOH(i) = fOH(i) + 0.004;
fXC(i) = fXC(i) -1.982;
fSumRCO3(i) = fSumRCO3(i) + 0.398;

%   50, <R050>
i = i + 1;
Rnames{i} = 'AFG4_P1 + SumRCO3 = SumRCO3 + .637 CROOH + .578 MECO3 + .305 MGLY + .199 BACL + .157 HO2 + .059 ETCO3 + .006 MECHO + .006 MALAH + .006 OH + .006 HPALD + -2.575 XC + .637 SumRCO3';
k(:,i) = 1.37e-11;
Gstr{i,1} = 'AFG4_P1'; Gstr{i,2} = 'SumRCO3'; 
fAFG4_P1(i) = fAFG4_P1(i) - 1;
fSumRCO3(i) = fSumRCO3(i) - 1;
fSumRCO3(i) = fSumRCO3(i) + 1.0;
fCROOH(i) = fCROOH(i) + 0.637;
fMECO3(i) = fMECO3(i) + 0.578;
fMGLY(i) = fMGLY(i) + 0.305;
fBACL(i) = fBACL(i) + 0.199;
fHO2(i) = fHO2(i) + 0.157;
fETCO3(i) = fETCO3(i) + 0.059;
fMECHO(i) = fMECHO(i) + 0.006;
fMALAH(i) = fMALAH(i) + 0.006;
fOH(i) = fOH(i) + 0.006;
fHPALD(i) = fHPALD(i) + 0.006;
fXC(i) = fXC(i) -2.575;
fSumRCO3(i) = fSumRCO3(i) + 0.637;

%   51, <R051>
i = i + 1;
Rnames{i} = 'AFG4_P2 + NO = .938 NO2 + .899 RCHO + .899 CO2 + .899 OH + .078 MGLY + .062 RCNO3 + .039 HO2 + -0.039 XC';
k(:,i) = 9.13e-12;
Gstr{i,1} = 'AFG4_P2'; Gstr{i,2} = 'NO'; 
fAFG4_P2(i) = fAFG4_P2(i) - 1;
fNO(i) = fNO(i) - 1;
fNO2(i) = fNO2(i) + 0.938;
fRCHO(i) = fRCHO(i) + 0.899;
fCO2(i) = fCO2(i) + 0.899;
fOH(i) = fOH(i) + 0.899;
fMGLY(i) = fMGLY(i) + 0.078;
fRCNO3(i) = fRCNO3(i) + 0.062;
fHO2(i) = fHO2(i) + 0.039;
fXC(i) = fXC(i) -0.039;

%   52, <R052>
i = i + 1;
Rnames{i} = 'AFG4_P2 + NO3 = NO2 + .959 RCHO + .959 CO2 + .959 OH + .083 MGLY + .041 HO2 + -0.044 XC';
k(:,i) = 2.30e-12;
Gstr{i,1} = 'AFG4_P2'; Gstr{i,2} = 'NO3'; 
fAFG4_P2(i) = fAFG4_P2(i) - 1;
fNO3(i) = fNO3(i) - 1;
fNO2(i) = fNO2(i) + 1.0;
fRCHO(i) = fRCHO(i) + 0.959;
fCO2(i) = fCO2(i) + 0.959;
fOH(i) = fOH(i) + 0.959;
fMGLY(i) = fMGLY(i) + 0.083;
fHO2(i) = fHO2(i) + 0.041;
fXC(i) = fXC(i) -0.044;

%   53, <R053>
i = i + 1;
Rnames{i} = 'AFG4_P2 + HO2 = .9 CROOH + .1 BACL + -1.7 XC';
k(:,i) = 1.78e-11;
Gstr{i,1} = 'AFG4_P2'; Gstr{i,2} = 'HO2'; 
fAFG4_P2(i) = fAFG4_P2(i) - 1;
fHO2(i) = fHO2(i) - 1;
fCROOH(i) = fCROOH(i) + 0.9;
fBACL(i) = fBACL(i) + 0.1;
fXC(i) = fXC(i) -1.7;

%   54, <R054>
i = i + 1;
Rnames{i} = 'AFG4_P2 + SumRO2 = SumRO2 + .479 RCHO + .479 CO2 + .479 OH + .25 BACL + .25 CROOH + .041 MGLY + .021 HO2 + -0.268 XC';
k(:,i) = 2.57e-12;
Gstr{i,1} = 'AFG4_P2'; Gstr{i,2} = 'SumRO2'; 
fAFG4_P2(i) = fAFG4_P2(i) - 1;
fSumRO2(i) = fSumRO2(i) - 1;
fSumRO2(i) = fSumRO2(i) + 1.0;
fRCHO(i) = fRCHO(i) + 0.479;
fCO2(i) = fCO2(i) + 0.479;
fOH(i) = fOH(i) + 0.479;
fBACL(i) = fBACL(i) + 0.25;
fCROOH(i) = fCROOH(i) + 0.25;
fMGLY(i) = fMGLY(i) + 0.041;
fHO2(i) = fHO2(i) + 0.021;
fXC(i) = fXC(i) -0.268;

%   55, <R055>
i = i + 1;
Rnames{i} = 'AFG4_P2 + SumRCO3 = SumRCO3 + .767 RCHO + .767 CO2 + .767 OH + .2 BACL + .066 MGLY + .033 HO2 + .167 XC';
k(:,i) = 1.37e-11;
Gstr{i,1} = 'AFG4_P2'; Gstr{i,2} = 'SumRCO3'; 
fAFG4_P2(i) = fAFG4_P2(i) - 1;
fSumRCO3(i) = fSumRCO3(i) - 1;
fSumRCO3(i) = fSumRCO3(i) + 1.0;
fRCHO(i) = fRCHO(i) + 0.767;
fCO2(i) = fCO2(i) + 0.767;
fOH(i) = fOH(i) + 0.767;
fBACL(i) = fBACL(i) + 0.2;
fMGLY(i) = fMGLY(i) + 0.066;
fHO2(i) = fHO2(i) + 0.033;
fXC(i) = fXC(i) + 0.167;

%   56, <R056>
i = i + 1;
Rnames{i} = 'AFG4A + OH = .349 MACO3 + .288 AFG4A_R1 + .23 AFG4A_P1 + .097 OH + .062 RO2C + .036 CO2 + .035 MGLY + .034 ROOH + .026 HO2 + .023 RCHO + .019 AFG3 + .014 KET2 + .012 BACL + .009 RO2XC + .008 zRCNO3 + .004 HPALD + .004 GLY + .004 AFG4A + .001 zRNNO3 + .001 CO + .262 XC + .301 SumRO2 + .349 SumRCO3';
k(:,i) = 5.53e-11;
Gstr{i,1} = 'AFG4A'; Gstr{i,2} = 'OH'; 
fAFG4A(i) = fAFG4A(i) - 1;
fOH(i) = fOH(i) - 1;
fMACO3(i) = fMACO3(i) + 0.349;
fAFG4A_R1(i) = fAFG4A_R1(i) + 0.288;
fAFG4A_P1(i) = fAFG4A_P1(i) + 0.23;
fOH(i) = fOH(i) + 0.097;
fRO2C(i) = fRO2C(i) + 0.062;
fCO2(i) = fCO2(i) + 0.036;
fMGLY(i) = fMGLY(i) + 0.035;
fROOH(i) = fROOH(i) + 0.034;
fHO2(i) = fHO2(i) + 0.026;
fRCHO(i) = fRCHO(i) + 0.023;
fAFG3(i) = fAFG3(i) + 0.019;
fKET2(i) = fKET2(i) + 0.014;
fBACL(i) = fBACL(i) + 0.012;
fRO2XC(i) = fRO2XC(i) + 0.009;
fzRCNO3(i) = fzRCNO3(i) + 0.008;
fHPALD(i) = fHPALD(i) + 0.004;
fGLY(i) = fGLY(i) + 0.004;
fAFG4A(i) = fAFG4A(i) + 0.004;
fzRNNO3(i) = fzRNNO3(i) + 0.001;
fCO(i) = fCO(i) + 0.001;
fXC(i) = fXC(i) + 0.262;
fSumRO2(i) = fSumRO2(i) + 0.301;
fSumRCO3(i) = fSumRCO3(i) + 0.349;

%   57, <R057>
i = i + 1;
Rnames{i} = 'AFG4A + HV = OH + .934 MALAH + .846 MEO2 + .088 ETO2 + .057 MACO3 + .009 HCHO + .007 RO2C + .003 HPALD + .003 HO2 + .003 R2CO3 + .003 AFG4A + .002 RO2XC + .002 zRCNO3 + .001 OTHN + -0.059 XC + .943 SumRO2 + .06 SumRCO3';
k(:,i) = JAFGS * 1.000;
Gstr{i,1} = 'AFG4A'; 
fAFG4A(i) = fAFG4A(i) - 1;
fOH(i) = fOH(i) + 1.0;
fMALAH(i) = fMALAH(i) + 0.934;
fMEO2(i) = fMEO2(i) + 0.846;
fETO2(i) = fETO2(i) + 0.088;
fMACO3(i) = fMACO3(i) + 0.057;
fHCHO(i) = fHCHO(i) + 0.009;
fRO2C(i) = fRO2C(i) + 0.007;
fHPALD(i) = fHPALD(i) + 0.003;
fHO2(i) = fHO2(i) + 0.003;
fR2CO3(i) = fR2CO3(i) + 0.003;
fAFG4A(i) = fAFG4A(i) + 0.003;
fRO2XC(i) = fRO2XC(i) + 0.002;
fzRCNO3(i) = fzRCNO3(i) + 0.002;
fOTHN(i) = fOTHN(i) + 0.001;
fXC(i) = fXC(i) -0.059;
fSumRO2(i) = fSumRO2(i) + 0.943;
fSumRCO3(i) = fSumRCO3(i) + 0.06;

%   58, <R058>
i = i + 1;
Rnames{i} = 'AFG4A_R1 = AFG4A_P2 + SumRO2';
k(:,i) = 164000000000.0 .* exp(-7848.2118./T) .* (T./300).^0.00;
Gstr{i,1} = 'AFG4A_R1'; 
fAFG4A_R1(i) = fAFG4A_R1(i) - 1;
fAFG4A_P2(i) = fAFG4A_P2(i) + 1.0;
fSumRO2(i) = fSumRO2(i) + 1.0;

%   59, <R059>
i = i + 1;
Rnames{i} = 'AFG4A_R1 + NO = .948 HO2 + .948 NO2 + .86 MGLY + .86 GLY + .088 RCHO + .088 CO + .052 RCNO3';
k(:,i) = 9.13e-12;
Gstr{i,1} = 'AFG4A_R1'; Gstr{i,2} = 'NO'; 
fAFG4A_R1(i) = fAFG4A_R1(i) - 1;
fNO(i) = fNO(i) - 1;
fHO2(i) = fHO2(i) + 0.948;
fNO2(i) = fNO2(i) + 0.948;
fMGLY(i) = fMGLY(i) + 0.86;
fGLY(i) = fGLY(i) + 0.86;
fRCHO(i) = fRCHO(i) + 0.088;
fCO(i) = fCO(i) + 0.088;
fRCNO3(i) = fRCNO3(i) + 0.052;

%   60, <R060>
i = i + 1;
Rnames{i} = 'AFG4A_P1 + NO = .929 NO2 + .74 CROOH + .675 MECO3 + .355 MGLY + .182 HO2 + .071 RCNO3 + .065 ETCO3 + .007 MECHO + .007 MALAH + .007 OH + .004 HPALD + .001 BACL + -3.215 XC + .74 SumRCO3';
k(:,i) = 9.13e-12;
Gstr{i,1} = 'AFG4A_P1'; Gstr{i,2} = 'NO'; 
fAFG4A_P1(i) = fAFG4A_P1(i) - 1;
fNO(i) = fNO(i) - 1;
fNO2(i) = fNO2(i) + 0.929;
fCROOH(i) = fCROOH(i) + 0.74;
fMECO3(i) = fMECO3(i) + 0.675;
fMGLY(i) = fMGLY(i) + 0.355;
fHO2(i) = fHO2(i) + 0.182;
fRCNO3(i) = fRCNO3(i) + 0.071;
fETCO3(i) = fETCO3(i) + 0.065;
fMECHO(i) = fMECHO(i) + 0.007;
fMALAH(i) = fMALAH(i) + 0.007;
fOH(i) = fOH(i) + 0.007;
fHPALD(i) = fHPALD(i) + 0.004;
fBACL(i) = fBACL(i) + 0.001;
fXC(i) = fXC(i) -3.215;
fSumRCO3(i) = fSumRCO3(i) + 0.74;

%   61, <R061>
i = i + 1;
Rnames{i} = 'AFG4A_P1 + NO3 = NO2 + .796 CROOH + .722 MECO3 + .381 MGLY + .196 HO2 + .074 ETCO3 + .008 MECHO + .008 MALAH + .008 OH + .004 HPALD + .002 BACL + -3.461 XC + .796 SumRCO3';
k(:,i) = 2.30e-12;
Gstr{i,1} = 'AFG4A_P1'; Gstr{i,2} = 'NO3'; 
fAFG4A_P1(i) = fAFG4A_P1(i) - 1;
fNO3(i) = fNO3(i) - 1;
fNO2(i) = fNO2(i) + 1.0;
fCROOH(i) = fCROOH(i) + 0.796;
fMECO3(i) = fMECO3(i) + 0.722;
fMGLY(i) = fMGLY(i) + 0.381;
fHO2(i) = fHO2(i) + 0.196;
fETCO3(i) = fETCO3(i) + 0.074;
fMECHO(i) = fMECHO(i) + 0.008;
fMALAH(i) = fMALAH(i) + 0.008;
fOH(i) = fOH(i) + 0.008;
fHPALD(i) = fHPALD(i) + 0.004;
fBACL(i) = fBACL(i) + 0.002;
fXC(i) = fXC(i) -3.461;
fSumRCO3(i) = fSumRCO3(i) + 0.796;

%   62, <R062>
i = i + 1;
Rnames{i} = 'AFG4A_P1 + HO2 = .805 CROOH + .099 BACL + .084 OTHN + .012 HPALD + -2.111 XC';
k(:,i) = 1.80e-11;
Gstr{i,1} = 'AFG4A_P1'; Gstr{i,2} = 'HO2'; 
fAFG4A_P1(i) = fAFG4A_P1(i) - 1;
fHO2(i) = fHO2(i) - 1;
fCROOH(i) = fCROOH(i) + 0.805;
fBACL(i) = fBACL(i) + 0.099;
fOTHN(i) = fOTHN(i) + 0.084;
fHPALD(i) = fHPALD(i) + 0.012;
fXC(i) = fXC(i) -2.111;

%   63, <R063>
i = i + 1;
Rnames{i} = 'AFG4A_P1 + SumRO2 = SumRO2 + .645 CROOH + .361 MECO3 + .248 BACL + .19 MGLY + .098 HO2 + .037 ETCO3 + .008 HPALD + .004 MECHO + .004 MALAH + .004 OH + -1.982 XC + .398 SumRCO3';
k(:,i) = 2.56e-12;
Gstr{i,1} = 'AFG4A_P1'; Gstr{i,2} = 'SumRO2'; 
fAFG4A_P1(i) = fAFG4A_P1(i) - 1;
fSumRO2(i) = fSumRO2(i) - 1;
fSumRO2(i) = fSumRO2(i) + 1.0;
fCROOH(i) = fCROOH(i) + 0.645;
fMECO3(i) = fMECO3(i) + 0.361;
fBACL(i) = fBACL(i) + 0.248;
fMGLY(i) = fMGLY(i) + 0.19;
fHO2(i) = fHO2(i) + 0.098;
fETCO3(i) = fETCO3(i) + 0.037;
fHPALD(i) = fHPALD(i) + 0.008;
fMECHO(i) = fMECHO(i) + 0.004;
fMALAH(i) = fMALAH(i) + 0.004;
fOH(i) = fOH(i) + 0.004;
fXC(i) = fXC(i) -1.982;
fSumRCO3(i) = fSumRCO3(i) + 0.398;

%   64, <R064>
i = i + 1;
Rnames{i} = 'AFG4A_P1 + SumRCO3 = SumRCO3 + .637 CROOH + .578 MECO3 + .305 MGLY + .199 BACL + .157 HO2 + .059 ETCO3 + .006 MECHO + .006 MALAH + .006 OH + .006 HPALD + -2.575 XC + .637 SumRCO3';
k(:,i) = 1.37e-11;
Gstr{i,1} = 'AFG4A_P1'; Gstr{i,2} = 'SumRCO3'; 
fAFG4A_P1(i) = fAFG4A_P1(i) - 1;
fSumRCO3(i) = fSumRCO3(i) - 1;
fSumRCO3(i) = fSumRCO3(i) + 1.0;
fCROOH(i) = fCROOH(i) + 0.637;
fMECO3(i) = fMECO3(i) + 0.578;
fMGLY(i) = fMGLY(i) + 0.305;
fBACL(i) = fBACL(i) + 0.199;
fHO2(i) = fHO2(i) + 0.157;
fETCO3(i) = fETCO3(i) + 0.059;
fMECHO(i) = fMECHO(i) + 0.006;
fMALAH(i) = fMALAH(i) + 0.006;
fOH(i) = fOH(i) + 0.006;
fHPALD(i) = fHPALD(i) + 0.006;
fXC(i) = fXC(i) -2.575;
fSumRCO3(i) = fSumRCO3(i) + 0.637;

%   65, <R065>
i = i + 1;
Rnames{i} = 'AFG4A_P2 + NO = .938 NO2 + .899 RCHO + .899 CO2 + .899 OH + .078 MGLY + .062 RCNO3 + .039 HO2 + -0.039 XC';
k(:,i) = 9.13e-12;
Gstr{i,1} = 'AFG4A_P2'; Gstr{i,2} = 'NO'; 
fAFG4A_P2(i) = fAFG4A_P2(i) - 1;
fNO(i) = fNO(i) - 1;
fNO2(i) = fNO2(i) + 0.938;
fRCHO(i) = fRCHO(i) + 0.899;
fCO2(i) = fCO2(i) + 0.899;
fOH(i) = fOH(i) + 0.899;
fMGLY(i) = fMGLY(i) + 0.078;
fRCNO3(i) = fRCNO3(i) + 0.062;
fHO2(i) = fHO2(i) + 0.039;
fXC(i) = fXC(i) -0.039;

%   66, <R066>
i = i + 1;
Rnames{i} = 'AFG4A_P2 + NO3 = NO2 + .959 RCHO + .959 CO2 + .959 OH + .083 MGLY + .041 HO2 + -0.044 XC';
k(:,i) = 2.30e-12;
Gstr{i,1} = 'AFG4A_P2'; Gstr{i,2} = 'NO3'; 
fAFG4A_P2(i) = fAFG4A_P2(i) - 1;
fNO3(i) = fNO3(i) - 1;
fNO2(i) = fNO2(i) + 1.0;
fRCHO(i) = fRCHO(i) + 0.959;
fCO2(i) = fCO2(i) + 0.959;
fOH(i) = fOH(i) + 0.959;
fMGLY(i) = fMGLY(i) + 0.083;
fHO2(i) = fHO2(i) + 0.041;
fXC(i) = fXC(i) -0.044;

%   67, <R067>
i = i + 1;
Rnames{i} = 'AFG4A_P2 + HO2 = .9 CROOH + .1 BACL + -1.7 XC';
k(:,i) = 1.78e-11;
Gstr{i,1} = 'AFG4A_P2'; Gstr{i,2} = 'HO2'; 
fAFG4A_P2(i) = fAFG4A_P2(i) - 1;
fHO2(i) = fHO2(i) - 1;
fCROOH(i) = fCROOH(i) + 0.9;
fBACL(i) = fBACL(i) + 0.1;
fXC(i) = fXC(i) -1.7;

%   68, <R068>
i = i + 1;
Rnames{i} = 'AFG4A_P2 + SumRO2 = SumRO2 + .479 RCHO + .479 CO2 + .479 OH + .25 BACL + .25 CROOH + .041 MGLY + .021 HO2 + -0.268 XC';
k(:,i) = 2.57e-12;
Gstr{i,1} = 'AFG4A_P2'; Gstr{i,2} = 'SumRO2'; 
fAFG4A_P2(i) = fAFG4A_P2(i) - 1;
fSumRO2(i) = fSumRO2(i) - 1;
fSumRO2(i) = fSumRO2(i) + 1.0;
fRCHO(i) = fRCHO(i) + 0.479;
fCO2(i) = fCO2(i) + 0.479;
fOH(i) = fOH(i) + 0.479;
fBACL(i) = fBACL(i) + 0.25;
fCROOH(i) = fCROOH(i) + 0.25;
fMGLY(i) = fMGLY(i) + 0.041;
fHO2(i) = fHO2(i) + 0.021;
fXC(i) = fXC(i) -0.268;

%   69, <R069>
i = i + 1;
Rnames{i} = 'AFG4A_P2 + SumRCO3 = SumRCO3 + .767 RCHO + .767 CO2 + .767 OH + .2 BACL + .066 MGLY + .033 HO2 + .167 XC';
k(:,i) = 1.37e-11;
Gstr{i,1} = 'AFG4A_P2'; Gstr{i,2} = 'SumRCO3'; 
fAFG4A_P2(i) = fAFG4A_P2(i) - 1;
fSumRCO3(i) = fSumRCO3(i) - 1;
fSumRCO3(i) = fSumRCO3(i) + 1.0;
fRCHO(i) = fRCHO(i) + 0.767;
fCO2(i) = fCO2(i) + 0.767;
fOH(i) = fOH(i) + 0.767;
fBACL(i) = fBACL(i) + 0.2;
fMGLY(i) = fMGLY(i) + 0.066;
fHO2(i) = fHO2(i) + 0.033;
fXC(i) = fXC(i) + 0.167;


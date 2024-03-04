% Reactions for aerosol precursor adopted from saprc_aero07 mechanism

SpeciesToAdd = {...
'SOAALK'; 'OH'; 'BENZRO2'; 'TOLRO2'; 'XYLRO2'; 'PAHRO2'; ...
'SVAVB1'; 'SVAVB2';'SVAVB3'; 'SVAVB4'; ...
};

AddSpecies

%% Information on Reaction encounter (SAPRC-18 model species)
% BENZRO2 : BENZ + OH

% TOLRO2  : TOLU + OH; 
%           ARO1 + OH

% XYLRO2  : MXYL + OH;
%         : OXYL + OH;
%         : PXYL + OH;
%         : ARO2 + OH;

% PAHRO2  : NAPS + OH; 

%%

i=i+1;
Rnames{i} = 'SOAALK + OH = OH + 0.006*SVAVB2 + 0.052*SVAVB3 + 0.081*SVAVB4';
k(:,i) = 2.70e-12.*(T./300).^0.00.*exp(374./T);
Gstr{i,1} = 'SOAALK'; Gstr{i,2} = 'OH';
fSOAALK(i)=fSOAALK(i)-1; fOH(i)=fOH(i)-1; fOH(i)=fOH(i)+1; fSVAVB2(i)=fSVAVB2(i)+0.006; fSVAVB3(i)=fSVAVB3(i)+0.052; fSVAVB4(i)=fSVAVB4(i)+0.081;

i=i+1;
Rnames{i} = 'BENZRO2 + NO = NO + 0.034*SVAVB2 + 0.392*SVAVB4';
k(:,i) = 2.55e-12.*exp(379.932./T);
Gstr{i,1} = 'BENZRO2'; Gstr{i,2} = 'NO';
fBENZRO2(i)=fBENZRO2(i)-1; fNO(i)=fNO(i)-1; fNO(i)=fNO(i)+1; fSVAVB2(i)=fSVAVB2(i)+0.034; fSVAVB4(i)=fSVAVB4(i)+0.392;

i=i+1;
Rnames{i} = 'BENZRO2 + HO2 = HO2 + 0.146*SVAVB1';
k(:,i) = 1.49e-11;
Gstr{i,1} = 'BENZRO2'; Gstr{i,2} = 'HO2';
fBENZRO2(i)=fBENZRO2(i)-1; fHO2(i)=fHO2(i)-1; fHO2(i)=fHO2(i)+1; fSVAVB1(i)=fSVAVB1(i)+0.146;

i=i+1;
Rnames{i} = 'XYLRO2 + NO = NO + 0.015*SVAVB2 + 0.023*SVAVB3 + 0.06*SVAVB4';
k(:,i) = 2.55e-12.*exp(379.932./T);
Gstr{i,1} = 'XYLRO2'; Gstr{i,2} = 'NO';
fXYLRO2(i)=fXYLRO2(i)-1; fNO(i)=fNO(i)-1; fNO(i)=fNO(i)+1; fSVAVB2(i)=fSVAVB2(i)+0.015; fSVAVB3(i)=fSVAVB3(i)+0.023; fSVAVB4(i)=fSVAVB4(i)+0.026;

i=i+1;
Rnames{i} = 'XYLRO2 + HO2 = HO2 + 0.193*SVAVB1';
k(:,i) = 1.49e-11;
Gstr{i,1} = 'XYLRO2'; Gstr{i,2} = 'HO2';
fXYLRO2(i)=fXYLRO2(i)-1; fHO2(i)=fHO2(i)-1; fHO2(i)=fHO2(i)+1; fSVAVB1(i)=fSVAVB1(i)+0.193;

i=i+1;
Rnames{i} = 'TOLRO2 + NO = NO + 0.016*SVAVB2 + 0.051*SVAVB3 + 0.047*SVAVB4';
k(:,i) = 2.55e-12.*exp(379.932./T);
Gstr{i,1} = 'TOLRO2'; Gstr{i,2} = 'NO';
fTOLRO2(i)=fTOLRO2(i)-1; fNO(i)=fNO(i)-1; fNO(i)=fNO(i)+1; fSVAVB2(i)=fSVAVB2(i)+0.016; fSVAVB3(i)=fSVAVB3(i)+0.051; fSVAVB3(i)=fSVAVB3(i)+0.047;

i=i+1;
Rnames{i} = 'TOLRO2 + HO2 = HO2 + 0.14*SVAVB1';
k(:,i) = 1.49e-11;
Gstr{i,1} = 'TOLRO2'; Gstr{i,2} = 'NO';
fTOLRO2(i)=fTOLRO2(i)-1; fHO2(i)=fHO2(i)-1; fHO2(i)=fHO2(i)+1; fSVAVB1(i)=fSVAVB1(i)+0.16;

i=i+1;
Rnames{i} = 'PAHRO2 + NO = NO + 0.028*SVAVB2 + 0.225*SVAVB3+ 0.191*SVAVB4';
k(:,i) = 2.55e-12.*exp(379.932./T);
Gstr{i,1} = 'PAHRO2'; Gstr{i,2} = 'NO';
fPAHRO2(i)=fPAHRO2(i)-1; fNO(i)=fNO(i)-1; fNO(i)=fNO(i)+1; fSVAVB2(i)=fSVAVB2(i)+0.028; fSVAVB3(i)=fSVAVB3(i)+0.225; fSVAVB4(i)=fSVAVB4(i)+0.191;

i=i+1;
Rnames{i} = 'PAHRO2 + HO2 = HO2 + 0.473*SVAVB1';
k(:,i) = 1.49e-11;
Gstr{i,1} = 'PAHRO2'; Gstr{i,2} = 'HO2';
fPAHRO2(i)=fPAHRO2(i)-1; fHO2(i)=fHO2(i)-1; fHO2(i)=fHO2(i)+1; fSVAVB1(i)=fSVAVB1(i)+0.473;



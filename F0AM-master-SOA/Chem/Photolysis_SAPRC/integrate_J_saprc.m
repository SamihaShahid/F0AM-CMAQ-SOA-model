function [J] = integrate_J_saprc(PHFname,LFin)
% Created by Samiha Binte Shahid
% PHF files contain absorpotion cross section and quantum yield of each
% photolyis rate.
%

%% LIGHT FLUX
lf= readmatrix (LFin);
fc=2.1066e-20; % adjustment factor
lf(:,2)=lf(:,2)./fc;
lf(:,1)=lf(:,1)./1000;

%% PHF FILE
phf_data = readmatrix (PHFname);
phf_data(:,1)=phf_data(:,1)./1000;

%% boundaries of light flux data
lb =  min(phf_data(:,1));
upb = max(phf_data(:,1));
iwl = lf(:,1)>=lb & lf(:,1)<= upb;
lf_wl = lf(iwl, 1);
lf_i = lf(iwl,2);
%% PHF file
% absorption cross section (abs) * quantum yield (QY)
phf_data(:,4)=phf_data(:,2).*phf_data(:,3);

% Row
for i=1:length(lf_wl)
    wl=lf_wl(i,1); % the wl in light_flux
    ind=find(phf_data(:,1)<=wl); % indices in phf_data where it is less than wl
    max_wl=max(phf_data(ind)); % the max value of wl in phf_data
    index=find(phf_data(:,1)==max_wl); 
    lf_wl(i,2)=index;
    l_indice=ind(end); % lower boundary
    lf_wl(i,3)=phf_data(l_indice,1);
    upb_indice=find(phf_data(:,1)>wl);
    if ~isempty(upb_indice)
        upb_indice=upb_indice(1);% upper boundary
        lf_wl(i,4)=phf_data(upb_indice,1);
    else
        lf_wl(i,4)=0;
    end
end

wl2_wl1 = lf_wl(:,4)-lf_wl(:,3);
act1=phf_data(lf_wl(:,2),4); % use the index
ind_wl2 = lf_wl(:,2)+1; 
ind_wl2(end)=ind_wl2(end)-1;
act2=phf_data(ind_wl2,4);
act2(end)=0;

%% act_sdt =  ((wl2 - lf_wl)./wl2_wl).* act1) + ((wl_lf - wl1)./wl2_wl).*act2)
fc1= ((lf_wl(:,4)-lf_wl(:,1))./wl2_wl1).*act1;
fc2 = ((lf_wl(:,1) - lf_wl(:,3))./wl2_wl1).*act2;
act_sdr = fc1 + fc2;
act_i = act_sdr.*lf_i;

row=length(lf_wl)-1;
for i=1:row
    vals=[act_i(i),act_i(i+1)];
    avg=mean(vals);
    dwl=lf_wl(i+1,1)-lf_wl(i,1);
    phk_val=avg*dwl;
    lf_wl(i,5)=phk_val;
end
J = sum(lf_wl(:,5));
J = J/0.5;


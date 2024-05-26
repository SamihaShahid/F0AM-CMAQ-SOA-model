function [J] = integrate_J_saprc_07(PHFname,LFin)
%% LIGHT FLUX
lf= readmatrix (LFin);
fc=2.1066e-20; % adjustment factor
lf(:,2)=lf(:,2)./fc;
lf(:,1)=lf(:,1)./1000;
%% PHF FILE
phf_data = readmatrix (PHFname);
%phf_data(:,1)=phf_data(:,1)./1000;
% Abs*QY
phf_data(:,4) = phf_data(:,2).*phf_data(:,3);
% Row number on phf_data abs list with highest wavelength less than or equal to SDR wavelength

row_number = zeros(size(lf,1),1);
row_number_2 = zeros(size(lf,1),1);
range = phf_data(:,1);

for i = 1:size(lf,1)
    % Extract the lookup value for this iteration
    lookup_value = lf(i,1);
    
    % Find the position of the largest value less than or equal to the lookup value
    position = find(range <= lookup_value, 1, 'last');
    
    % Store the position in row_number array
    if length(position)~=0
        row_number(i) = position;
        % Check if the position is at the end of the range
        if position + 1 > length(phf_data)
            row_number_2(i) = position;
        else
            % If not, store the next position
            row_number_2(i) = position + 1;
        end
    end
end

non_zero_index = row_number ~= 0;
row_number=row_number(non_zero_index);
sdr_wl = lf(non_zero_index, 1);
sdr_i = lf(non_zero_index, 2);
non_zero_index = row_number_2 ~= 0;
row_number_2=row_number_2(non_zero_index);

wl1=phf_data(row_number, 1);
wl2= phf_data(row_number_2, 1);
act1=phf_data(row_number, 4);
act2=phf_data(row_number_2, 4);

dwl = wl2-wl1;

d_wl2_sdrWL = wl2-sdr_wl;
d_sdrWL_wl1 = sdr_wl-wl1;

interpolated_act = ((d_wl2_sdrWL./dwl).*act1) + ((d_sdrWL_wl1./dwl).*act2);

ACT_I = interpolated_act.*sdr_i;

phk = zeros (length(ACT_I),1);
for i = 1:length(ACT_I)-1
    %disp(i)
    act_i_mean = mean(ACT_I(i:i+1));
    %disp(act_i_mean)
    d_sdr_wl = sdr_wl(i+1)-sdr_wl(i);
    phk(i) = act_i_mean*d_sdr_wl;
end
J = tsnansum(phk);
J = J/0.5;

clc;
clear;
% Initialize model
origData = '/Users/samiha/Desktop/desktop_v1/SOA model/Input/verify_calc_lim_conc.xlsx';
initinfo = initializeSOA(origData);
% idx = 31;
dcaer = [];
for idx = 1:height(initinfo.dgas2)
    [initinfo.og_conc_init,aer_conc,dcaer_ll] = orgaer(idx,initinfo,1);
    dcaer = [dcaer; dcaer_ll];
end
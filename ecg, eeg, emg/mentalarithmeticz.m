clear all;
clc; close all;             
fs = 500;
leadNo=18;%row 18 ko data

% Load EEG data %20 electrodes data,unipolarin nature 182 sec but we need 180 sec only
x1=load('Subject00_1_edfm.mat');
eeg_cz_1 = x1.val(leadNo,2*fs+1:end); %=val(lead,:); to take all data %agadi ko 2 ta fyaldeko
% t=1/fs:1/fs: length(eeg_cz_1)/fs;
% figure, 
% plot(t,eeg_cz_1);

x2=load('Subject00_2_edfm.mat');
eeg_cz_2 = x2.val(leadNo, 1:end-fs*2); %(leadNo,2*fs+1:end);
% t=1/fs:1/fs: length(eeg_cz_2)/fs;
% figure, 
% plot(t,eeg_cz_2);

eeg_cz=[eeg_cz_1 eeg_cz_2];
% t=1/fs:1/fs: length(eeg_cz)/fs;
% figure,
% plot(t,eeg_cz);

data_band_matrix = zeros((length(eeg_cz)/fs)*2-1,5);
for i=0:0.5:(length(eeg_cz)/fs)-1
eeg_cz_1s=eeg_cz((fs*i)+1:(fs*(i+1)));

eeg_cz_fft=abs(fft(eeg_cz_1s));
eeg_cz_fft=eeg_cz_fft(2:fs/2);

    delta_1_4 = sum(eeg_cz_fft(1:4).^2)/4/fs;
    theta_5_8 = sum(eeg_cz_fft(5:8).^2)/4/fs;  
    alpha_9_12 = sum(eeg_cz_fft(9:12).^2)/3/fs;
    beta_13_30 = sum(eeg_cz_fft(13:30).^2)/18/fs;
    gamma_31_60 = sum(eeg_cz_fft(31:60).^2)/30/fs;
    
    data_band_matrix((i+1)*2-1,:) = [delta_1_4 theta_5_8 alpha_9_12 beta_13_30 gamma_31_60];
end

titles={'delta_1_4'; 'theta_5_8'; 'alpha_9_12'; 'beta_13_30'; 'gamma_31_60'};
for i=1:5
    subplot(5,1,i);
    plot(data_band_matrix(:,i));
    title(titles{i});
end
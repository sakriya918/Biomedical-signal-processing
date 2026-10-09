close all; clc; clear;
fs = 500;
t = 1/fs:1/fs:2;

y2 = sin(2*pi*2*t);
y8 = sin(2*pi*8*t);
y32 = sin(2*pi*32*t);

y = [y2 y8 y32];

fft_y = abs(fft(y(fs*5+1:fs*6)));
fft_y = fft_y(2:fs/2+1);
% figure, plot(fft_y);
delta_1_4 = sum(fft_y(1:4).^2)/4/fs;
theta_5_8 = sum(fft_y(5:8).^2)/4/fs;
alpha_9_12 = sum(fft_y(9:12).^2)/4/fs;
beta_13_30 = sum(fft_y(13:30).^2)/18/fs;
gamma_31_60 = sum(fft_y(31:60).^2)/30/fs;

disp([num2str(delta_1_4) ' ' num2str(theta_5_8) ' ' num2str(alpha_9_12) ' ' num2str(beta_13_30) ' ' num2str(gamma_31_60)])

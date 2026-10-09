clear; clc;
load("chb01_03_edfm.mat")

y = val(1,:);
fs = 256;

t = 1/fs: 1/fs: length(y)/fs;
plot(t,y)

data_band_energy = zeros(length(y)/fs, 5);

for i = 0: (length(y)/fs) - 1
    fft_y = abs(fft(y((fs * i) + 1: fs*(i + 1))));
    fft_y = fft_y(2:fs/2 + 1);
    
    %energy band calculation
    delta = sum(fft_y(1:4).^2)/4/fs;
    theta = sum(fft_y(5:8).^2)/4/fs;
    alpha = sum(fft_y(9:12).^2)/4/fs;
    beta  = sum(fft_y(13:30).^2)/18/fs;
    gamma = sum(fft_y(31:60).^2)/30/fs;
    
    data_band_energy(i+1, :) = [delta theta alpha beta gamma];
end

titlez = {"deltaz"; "thetaz"; "alphaz"; "betaz"; "gammaz"};

for i = 1: 5
    subplot(5,1,i)
    plot(data_band_energy(:,i))
    title(titlez{i});
end





%% 
data_band_energy = zeros(length(y)/fs, 5);

for i = 0 : length(y)/fs -1
    fft_y = abs(fft(y(fs * i + 1: fs * (i + 1))));
    fft_y = fft_y(2:fs/2 + 1);

    delta = sum(fft_y(1:4).^2)/4/fs;

    data_band_energy(i+1,:) = [delta theta alpha beta gamma];
end

titlez = {}

for i = 1 : 5
    subplot(5,1,i)
    plot(data_band_energy(:,i))
    title(titlez{i})
end








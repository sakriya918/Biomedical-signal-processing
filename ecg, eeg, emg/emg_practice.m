clear; close;
load("emg_healthy_neuro_myo3")

filtered_emg = emg_healthy_neuro_myo(:,1);
fs = 500;
fc = 15;

t = 1/fs : 1/fs: length(filtered_emg)/fs;

%filtered haina jasto ko testai ho
figure;
plot(filtered_emg);
title('Filtered EMG Signal');
xlabel('Time (samples)');
ylabel('Amplitude (mV)');

[b,a] = butter(2, fc/(fs/2));
filtered_emg = filter(b,a, filtered_emg);

figure;
plot(t, filtered_emg)


% Root Mean Square (RMS) - measures signal amplitude
rms_value = sqrt(mean(filtered_emg.^2));

% Median Frequency (MDF) - frequency domain feature
[pxx, f] = pwelch(filtered_emg, [], [], [], fs);
mdf_value = medfreq(pxx, f);

% Display extracted features
fprintf('Extracted Features:\n');
fprintf('RMS: %.2f\n', rms_value);
fprintf('Median Frequency: %.2f Hz\n', mdf_value);


rms_threshold_myopathy = 0.1; %adjust accordingly
rms_threshold_neuropathy = 0.3; 

mdf_threshold_myopathy = 80;   
mdf_threshold_neuropathy = 60;

% Detect disorder based on features
if rms_value < rms_threshold_myopathy && mdf_value > mdf_threshold_myopathy
    fprintf('Disorder Detected: Myopathy\n');
elseif rms_value > rms_threshold_neuropathy && mdf_value < mdf_threshold_neuropathy
    fprintf('Disorder Detected: Neuropathy\n');
else
    fprintf('No Disorder Detected: Healthy EMG Signal\n');
end

%% 
rms_value = sqrt(mean(filtered_emg .^ 2));

[pxx,f] = pwelch(filtered_emg, [], [], [], fs);
mdf_value = medfreq(pxx,f);


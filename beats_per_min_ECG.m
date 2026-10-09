clear; close all;
temp=0;
beat = 0;
bpm =0;
threshold = 100;
load("100m.mat"); %some ECG signals
leadII = val(1,:);
v5 = val(2,:);
time_period = 10;
fs = 360;
sinterval = 1/fs;
t = 1/fs:sinterval:time_period;
plot(t,leadII);
for i = 1:length(leadII)
if leadII(i)> threshold && leadII(i-1)<= threshold 
beat = beat +1;
end
end
bpm = (beat/time_period)*60;
display(beat);
display(bpm);
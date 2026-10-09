clear; clc; close;

load("100m.mat")

lead2 = val(1,:);
v5 = val(2,:);

fs = 360;

 fc = 15;

t = 1/fs: 1/fs: 10;

figure(1);
plot(t, lead2)

figure(2);
plot(t, v5)

% count = 0;
% thres = 50;

% for i = 1 : length(lead2)
%     if lead2(i) > thres && lead2(i-1) < thres
%         count = count + 1;
%     end
% end
% 
% countz = count;
% 
% bpm = (countz/10) * 60;
% 
% disp(bpm)



count = 0;
thres = 50;

for i = 1 : length(v5)
    if v5(i) > thres && v5(i-1) < thres
        count = count + 1;
    end
end

countz = count;

bpm = (countz/10) * 60;

disp(bpm)





% figure(3);
% y = fft(v5);
% x = (0 : length(v5) - 1) * fs/length(v5);
% plot(x,y)
% axis([0 360 -20000 20000]);
% 
% figure(4);
% [b,a] = butter(2, fc/(fs/2));
% filtered = filter(b,a, y);
% plot(x, filtered)
% 
% figure(5);
% recovered = ifft(filtered);
% plot(t, recovered)
% 







% n = 15 * rand(1,length(v5));
% 
% noisy = v5 + n;
% 
% figure(3);
% plot(t, noisy)
% 
% fc = 15;
% 
% [b,a] = butter(2, fc/(fs/2));
% filtered = filter(b, a , noisy);
% 
% figure(4);
% plot(t,filtered)





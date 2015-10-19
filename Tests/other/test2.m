duration = size(E, 1)/fs;
timepoints = linspace(0,duration, size(E, 1));
plot(timepoints, E);
zoom xon;
grid on;


% 
% % Section 2
% [m6Data fs nbits] = wavread('male_six.wav');
% % 2a fs = 22050 Hz
% % 2b Highest frequency = 11025
% m6Dur = size(m6Data, 1) / fs;
% % 2d 0.8989 seconds
% 
% timepointsM6 = linspace(0, m6Dur, size(m6Data, 1));
% figure(1);
% plot(timepointsM6, m6Data);
% % My estimate of the pitch (made over 7 cycles) was 126 Hz.
% 
% [f6Data fs nbits] = wavread('female_six.wav');
% f6Dur = size(f6Data, 1) / fs;
% timepointsF6 = linspace(0, f6Dur, size(f6Data, 1));
% figure(2);
% plot(timepointsF6, f6Data);
% % My estimate of the pitch (made over 3 cycles) was 185 Hz.

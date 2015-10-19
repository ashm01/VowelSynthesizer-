% Script that loads in all the recorded vowel sounds and resamples them to 
% 10khz and writes the resample to a new file.
fs = 10000;
[I1 fsI] = wavread('I1.wav');
I1 = resample(I1, 10000, fsI);
wavwrite(I1,fs,16,'I1-10khz');
[I2 fsI] = wavread('I2.wav');
I2 = resample(I2, 10000, fsI);
wavwrite(I2,fs,16,'I2-10khz');
[I3 fsI] = wavread('I3.wav');
I3 = resample(I3, 10000, fsI);
wavwrite(I3,fs,16,'I3-10khz');

[A1 fsA] = wavread('A1.wav');
A1 = resample(A1, 10000, fsA);
wavwrite(A1,fs,16,'A1-10khz');
[A2 fsA] = wavread('A2.wav');
A2 = resample(A2, 10000, fsA);
wavwrite(A2,fs,16,'A2-10khz');
[A3 fsA] = wavread('A3.wav');
A3 = resample(A3, 10000, fsA);
wavwrite(A3,fs,16,'A3-10khz');

[U1 fsU] = wavread('U1.wav');
U1 = resample(U1, 10000, fsU);
wavwrite(U1,fs,16,'U1-10khz');
[U2 fsU] = wavread('U2.wav');
U2 = resample(U2, 10000, fsU);
wavwrite(U2,fs,16,'U2-10khz');
[U3 fsU] = wavread('U3.wav');
U3 = resample(U3, 10000, fsU);
wavwrite(U3,fs,16,'U3-10khz');

[O1 fsO] = wavread('O1.wav');
O1 = resample(O1, 10000, fsO);
wavwrite(O1,fs,16,'O1-10khz');
[O2 fsO] = wavread('O2.wav');
O2 = resample(O2, 10000, fsO);
wavwrite(O2,fs,16,'O2-10khz');
[O3 fsO] = wavread('O3.wav');
O3 = resample(O3, 10000, fsO);
wavwrite(O3,fs,16,'O3-10khz');

[E1 fsE] = wavread('E1.wav');
E1 = resample(E1, 10000, fsE);
wavwrite(E1,fs,16,'E1-10khz');
[E2 fsE] = wavread('E2.wav');
E2 = resample(E2, 10000, fsE);
wavwrite(E2,fs,16,'E2-10khz');
[E3 fsE] = wavread('E3.wav');
E3 = resample(E3, 10000, fsE);
wavwrite(E3,fs,16,'E3-10khz');


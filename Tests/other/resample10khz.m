function A = resample10khz (X)

A = resample(X, 10000, 44100);

wavwrite(A,'10khz');
end
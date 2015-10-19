z = fft(A);


Npts = size (A, 1);

zz = abs(fft(A));
magz= zz(1:(Npts/2));

scale = (0:5000/15790:5000-5000/15790)';

plot (scale, log(magz))
plot (scale, magz)



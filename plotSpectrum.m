function plotSpectrum(X)
%plotSpectrum   Plots the log amplitude spectrum of a givel sound signal (x)
%
%       plotSpectrum (X) takes the vowel sound and produces a plot of the
%       of the spectrum with the frequency against the log amplitude
% 
%       X =  vector of audio data representing a vowel sound

if nargin == 0 
    %Determining the string given when this error occurs
    error ('no parameters given!');
%Checking whether there is 5 argument being parsed through   
elseif nargin == 1
    %Using the validateattributes function to check the data that is parsed
    %is of the appropiate type. Ensuring the vowel is a numeric array of finite
    %real numbers.
    validateattributes(X, {'numeric'},{'real','finite','nonnan'});
%Throws an error for every other number of arguments that are parsed through     
else 
    %Determining the string given when this error occurs
    error ('wrong number of parameters');
%Terminates the IF function    
end   
    

%Frequency of sample
fs = 10000;
% Creating the beginning and end points of the segment of the vowel
XStart = round(0.8*fs);
XEnd = round(0.9*fs);
% Determining the number of samples in the given segment
nPointsXsegment = XEnd - XStart+1;
% Creating the actual segment of vowel data
Xsegment = X(XStart:XEnd);
% a vector of linearly spaced numbers from 0 to fs/2 with the length of nPointsXsegment/2
% to be ploted against the log magnitude of the amplutide
FreqPoints = linspace(0, fs/2, nPointsXsegment/2)';
% Creates a new segment which has beened been put through the hamming process 
segmentHam = hamming(nPointsXsegment).* Xsegment;
% absolute fast fourier transformation of the segmentHam
zz2 = abs( fft(segmentHam));
% Creates a segment which conatins the samples upto the nyquist
% theory (fs/2)
magSegHam = zz2(1:round((nPointsXsegment/2)-1));
% ploting the freq against the log magnitude
figure
plot(FreqPoints, log10( magSegHam ));
grid on;

% Labeling the axis
xlabel('Frequency (Hz)');
ylabel('Log Amplitude');
zoom xon;


end

function synthVowel(X)
%synthVowel synthesises the vowel sound parsed through to a pitch of 150 hz
%           and duration of 5 seconds
%       synthVowel (X) takes the vowel sound and synthesise it to sound of
%       pitch 150hz and duration of 5 seconds
% 
%   X =  vector of audio data representing a vowel sound

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
XEnd = round(1.9*fs);
% Determining the number of samples in the given segment
nPointsXsegment = XEnd - XStart+1;
% Creating the actual segment of vowel data
Xsegment = X(XStart:XEnd);
% Creates a new segment which has beened been put through the hamming process 
segmentHam = hamming(nPointsXsegment).* Xsegment;
% absolute fast fourier transformation of the segmentHam
zz2 = abs( fft(segmentHam));
% Creates a segment which conatins the samples upto the nyquist
% theory (fs/2)
magSegHam = zz2(1:round((nPointsXsegment/2)-1));
% obtaining the smoothed spectrum of the vowel
SmoothSpec = smooth( log10( magSegHam ), 200 );
% setting f0 to 150hz
f0= 150; 
% Vector of f0, 2f0, 3f0...fs/2
f = (f0:f0:fs/2)';
% Amp values at the given places in the freq(f) vector
a = SmoothSpec(f)';
% length of signal(in seconds)
duration=5;  
% length(in samples)
nSamples=duration*fs; 	    
% a vector of linearly spaced numbers from 0 to d with the length of nSamples
% to be used as the constant t in the summation equation
t = linspace(0, duration, nSamples);
% creating an empty vector to the length of the number of points 
% in the vowel sound 
y=zeros(1,nSamples);
    % Loop to sum the sine waves for the synthesised vowel
    for i=1:length(f)
        % implementation of the formula
        y=y+a(i).*sin(2*pi*f(i)*t);
    end;
% Plays the synthesised sound
soundsc(y,fs)

end




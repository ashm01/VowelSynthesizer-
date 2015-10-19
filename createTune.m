function createTune (v1, v2, v3, v4, v5, tempo)
%CREATETUNE Creates a tune using vowel sounds parsed through and synthesise 
%           those sounds to specific notes and contaginate those notes to produce a 
%           piece of music
%       createTune (V1,v2,v3,v4,v5) takes the 5 vowels sounds and produces
%       a piece of music with a default tempo of 2 beats per second.
% 
%       createTune (V1,v2,v3,v4,v5,tempo) takes the 5 vowels sounds and produces
%       a piece of music with a tempo of how many beats per second the tempo 
%       argument states.
% 
%   V1 =  vector of audio data representing a vowel sound
%   V2 =  vector of audio data representing a vowel sound
%   V3 =  vector of audio data representing a vowel sound
%   V4 =  vector of audio data representing a vowel sound
%   V5 =  vector of audio data representing a vowel sound         
%   TEMPO = integer value which represents the number of beats per second

%If statement which the checks the number of arguments that have been given
%If there are zero arguments parsed then an error message is returned
if nargin == 0 
    %Determining the string given when this error occurs
    error ('no parameters given!');
%Checking whether there is 5 argument being parsed through   
elseif nargin == 5
    %Using the validateattributes function to check the data that is parsed
    %is of the appropiate type. Ensuring the vowels are numeric arrays of finite
    %real numbers.
    validateattributes(v1, {'numeric'},{'real','finite','nonnan'});
    validateattributes(v2, {'numeric'},{'real','finite','nonnan'});
    validateattributes(v3, {'numeric'},{'real','finite','nonnan'});
    validateattributes(v4, {'numeric'},{'real','finite','nonnan'});
    validateattributes(v5, {'numeric'},{'real','finite','nonnan'});
    %As only one the vowel sounds are parsed which means we havent got a value for
    %the tempo. we set the variable n to the default value of 2 beats per second.
    tempo = 2;
%Checking whether if 6 arguments have been parsed through to the function    
elseif nargin == 6
     %Using the validateattributes function to check the data that is parsed
    %is of the appropiate type. Ensuring the vowels are numeric arrays of finite
    %real numbers.
    validateattributes(v1, {'numeric'},{'real','finite','nonnan'});
    validateattributes(v2, {'numeric'},{'real','finite','nonnan'});
    validateattributes(v3, {'numeric'},{'real','finite','nonnan'});
    validateattributes(v4, {'numeric'},{'real','finite','nonnan'});
    validateattributes(v5, {'numeric'},{'real','finite','nonnan'});
    %Ensuring tempo is strictly a poisitive finite integer scalar value
    validateattributes...
    (tempo, {'numeric'},{'finite','positive','scalar','nonnan'});
%Throws an error for every other number of arguments that are parsed through     
else 
    %Determining the string given when this error occurs
    error ('wrong number of parameters');
%Terminates the IF function    
end
%Frequency of sample
fs = 10000;
% Creating a cell array containing the vowel sounds which were parsed
% through
vowels = {v1 v2 v3 v4 v5};
% for loop to iterate through each vowel sound in the cell array and..
for i =1:length(vowels)
    % Creating the beginning and end points of the segment of the vowel
    start = round(0.8*fs);
    stop = round(1.9*fs);
    % Determining the number of samples in the given segment
    nPointsSegment = stop - start+1;
    % Creating the actual segment of vowel data
    vowelSegment = vowels{i}(start:stop);
    % Creates a new segment which has beened been put through the hamming process 
    segmentHam = hamming(nPointsSegment).* vowelSegment;
    % absolute fast fourier transformation of the segmentHam
    zz = abs( fft(segmentHam));
    % Creates a segment which conatins half the samples of zz (nyquist
    % theory fs/2)
    magSegHam = zz(1:round((nPointsSegment/2)-1));
    % obtaining the smoothed spectrum of each vowel in the cell array
    vowels{i} = smooth( log10( magSegHam ), 200 );
end 

% Frequencies of each note that will be used in my piece of music rounded
% to the nearest whole number
F4 = 349;
A4 = 440;
G4 = 392;
D4 = 293;
B3 = 233;
C4 = 261;
SIL = 0;
% An array of notes in the order of my piece of music and the corresponding
% beat durations
notes = [F4 A4 G4 F4 D4 B3 D4 C4 F4 G4 F4 SIL A4 F4];
duration = [1 0.5 1 0.5 1 1 1 1 1 0.5 0.5 1 0.5 0.5];
% vector of random numbers between 1 and 5 to deteremine which vowel sound
% will be used to create the specific note in the piece of music
r = randi(5,length(notes),1)';
% Loop to iterate through all the notes using a random vowel each time to
% create the sound
for j=1:length(notes)
    
    % Vector of f0, 2f0, 3f0...fs/2
    freq = notes(j):notes(j):(fs/2);
    % Amp values at the given frequencies
    amps = vowels{r(j)}(freq)';
    % length of note(in seconds)
    d=(duration(j)/tempo); 
    % length(in samples) 
    nSamples=d*fs; 	   
    % a vector of nSamples linearly spaced numbers from 0 to d to be used
    % as the constant t in the summation equation
    t = linspace(0, d, nSamples); 
    % creating an empty vector to the length of the number of points 
    % in the vowel sound in position j of the cell array
    y{j}=zeros(1,nSamples);
        % Loop to sum the sine waves for each note in the piece of music
        for i=1:length(freq)
            % implementation of the sine wave summation formula
            y{j}=y{j}+amps(i).*sin((2*pi*freq(i)*t));
        end;
              
end
% horizantly concatinates all the synthesised notes into one piece
tune = horzcat(1, y{:});
% plays the tune
soundsc(tune, fs)
end





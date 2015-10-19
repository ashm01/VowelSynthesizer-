function plotVowel (X)
%plotVowel   Plots the a segment of the audio signal parsed against time
%       plotVowel (X) takes the vowel sound and produces a plot of the
%       of the signal against the length of the signal in seconds
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

%Determing the segment of the signal to anaylise
X1 = X(8000:9200);
%Initialising N to the length of X1
N = length(X1);
%Frequency 
F = 10000;
% creating the vector which represents time
t = linspace(0, N/F, N);
% plotting t against the segment of the signal
figure
plot (t, X1)
%manually setting the axis
axis([0, 0.12, -0.58, 1]);
grid on;
%Labelling the axis
xlabel('Time (s)');
ylabel('Amplitude');
zoom xon;


end
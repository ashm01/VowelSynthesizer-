function notationData(A, E, I, O, U)
fs = 10000;
vowels = {A E I O U};

for i =1:length(vowels)
    
    XStart = round(0.8*fs);
    XEnd = round(1.9*fs);
    nPointsXsegment = XEnd - XStart+1;
    Xsegment = vowels{i}(XStart:XEnd);
    segmentHam = hamming(nPointsXsegment).* Xsegment;
    zz2 = abs( fft(segmentHam));
    magSegHam = zz2(1:round((nPointsXsegment/2)-1));
    vowels{i} = smooth( log10( magSegHam ), 200 );
end 


F4 = 349;
A4 = 440;
G4 = 392;
D4 = 293;
B3 = 233;
C4 = 261;
SIL = 0;

notes = [F4 A4 G4 F4 D4 B3 D4 C4 F4 G4 F4 SIL A4 F4];
duration = [1 0.5 1 0.5 1 1 1 1 1 0.5 0.5 1 0.5 0.5];
tempo = 2; %beats per second
r = randi(5,length(notes),1)';

for j=1:length(notes)
    

    f = notes(j):notes(j):(fs/2);
    a = vowels{r(j)}(f)';

    d=(duration(j)/tempo);  	% length of signal(in seconds)
    nSamples=d*fs; 	% length(in samples)    

    t = linspace(0, d, nSamples);  	
    y{j}=zeros(1,nSamples);
    
        for i=1:length(f),
            y{j}=y{j}+a(i).*sin((2*pi*f(i)*t));
        end;
        
        
end
tune = horzcat(1, y{:});
soundsc(tune, fs)
end
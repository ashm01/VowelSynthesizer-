% estimated formants (F1 nand F2) for each vowel sounds [A1 A2 A3] etc
AF1 = [980 950 1050]; 
EF1 = [550 500 510]; 
IF1 = [330 300 285];
OF1 = [480 500 520]; 
UF1 = [250 270 260];
AF2 = [2600 2700 2800]; 
EF2 = [1650 1600 1630]; 
IF2 = [2100 2200 2080]; 
OF2 = [2410 2500 2550]; 
UF2 = [1500 1500 1550];
% Using TEXT fucntion to plot the character along the data
text(AF1,AF2,'A','fontname','arial','color','red')
text(EF1,EF2,'E','fontname','arial','color','blue')
text(IF1,IF2,'I','fontname','arial','color','green')
text(OF1,OF2,'O','fontname','arial','color','black')
text(UF1,UF2,'U','fontname','arial','color','magenta')
grid on;
% Manually set axis limits and labels
xlim([0 1200])
ylim([1200 3000])
xlabel('Formant F1');
ylabel('Formant F2');

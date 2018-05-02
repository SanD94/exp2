function Exp2(pNo)

initPTB;

testTrial = 10;
taskTrial = 45;


screens = Screen('Screens');

screenNumber = max(screens);            

white = WhiteIndex(screenNumber);
black = BlackIndex(screenNumber);
gray = (black + white)/2;


[window, windowRect] = PsychImaging('OpenWindow', screenNumber, gray);
  

% Setup the text type for the window
Screen('TextFont', window, 'Consolas');  
Screen('TextSize', window, 50);                               
Screen('TextStyle', window, 1);

                             
[xCenter, yCenter] = RectCenter(windowRect);
                              

WriteDescription(window, 'Bu calismada size 45 adet bir kelime ve bir rakamdan olusan obekler gosterilecektir. Bu obekler ekranin ortasinda teker teker belirecektir. Devam etmek icin herhangi bir tusa basiniz!');
WriteDescription(window, 'Sizin goreviniz ekranda obekteki harf SESLI ise SOLdaki tusa, harf SESSIZ ise SAGdaki tusa basmaktir. Ekranda her bir harf belirdigi zaman, ekranin tepesinde SOLda SESLI ve SAGda SESSIZ yazilarini goreceksiniz. Bunlar hangi tusa basmanizi size hatirlatmak amaciyla buraya konmustur. Devam etmek icin herhangi bir tusa basiniz!');
WriteDescription(window, 'Hazir oldugunuzda, alistirma asamasina gecmek icin bosluk tusuna basiniz.');


%% Trial Configurations

testTimeResults = zeros(2, testTrial);
testResults = false(2, testTrial);

taskTimeResults = zeros(2, taskTrial);
taskResults = false(2, taskTrial); 

[testTimeResults(1, :), testResults(1, :)] = ...
    TaskSwitching('test', 1, 0, testTrial, window);


WriteDescription(window, 'Alistirmalar sona erdi. Simdi deneyin asil kismina gececegiz. Eger herhangi bir sorunuz varsa deney gorevlisine simdi sorunuz. Yoksa devam etmek icin ya sag ya da sol tusuna basiniz!');
WriteDescription(window, 'Lutfen sol elinizin isaret parmagini "sol; tusuna ve sag elinizin isaret parmagini da "sag; tusuna yerlestirin. Baslamak icin bu iki tustan birine basabilirsiniz!');

[taskTimeResults(1, :), taskResults(1, :)] = ...
    TaskSwitching('task', 1, 10, taskTrial, window);


WriteDescription(window, 'Bu deneyin ilk kismi (sesli-sessiz calismasi) sona erdi. Bir sonraki calisma icin herhangi bir tusa basiniz!');
WriteDescription(window, 'Simdiki calismada yine 20 tane bir harf ve bir rakamdan olusan obekler goreceksiniz. Bu obekler teker teker ekranin ortasinda belirecek. Devam etmek icin bir tusa basiniz!');
WriteDescription(window, 'Sizin goreviniz eger rakam TEK SAYI ise SOLdaki tusa, rakam CIFT SAYI ise SAGdaki tusa basmaktir. Bu calisma icin harflere dikkat etmenize gerek yok. Her bir sunumda TEK ve CIFT kelimeleri ekranin ust koselerinde de belirecekler. Bu kelimeler size TEK SAYI icin SOL ve CIFT SAYI icin SAG tusa basmanizi hatirlatmak icin belirecek. Devam etmek icin herhangi bir tusa basiniz!');

[testTimeResults(2, :), testResults(2, :)] = ...
    TaskSwitching('test', 2, 55, testTrial, window);


WriteDescription(window, 'Alistirma kismi sona erdi. Simdi asil deneye gececegiz. Herhangi bir sorunuz varsa, lutfen simdi deney gorevlisine sorunuz. Yoksa deneye baslamak icin herhangi bir tusa basiniz!');
WriteDescription(window, 'SOL isaret parmaginizin SOL tusta ve SAG isaret parmaginizin da SAG tusta olmasi cok onemli. Lutfen parmaklarinizi yerlestirin. Deneye baslamak icin SAG ya da SOL tusuna basiniz!');

[taskTimeResults(2, :), taskResults(2, :)] = ...
    TaskSwitching('task', 2, 65, taskTrial, window);

%% First part ends


WriteDescription(window, 'Deneyin bu kismi sona erdi. Lutfen deney gorevlisine haber veriniz.');

%% Second part begins 
insightResults = InsightProblems(window, white);
%% End Code
sca;
                             
save([num2str(pNo) '.mat']);

end
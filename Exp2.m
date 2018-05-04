function Exp2(pNo)

initPTB;

if mod(pNo, 2)
    testTrial = 10;
    taskTrial = 20;
else
    testTrial = 10;
    taskTrial = 45;
end


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

                             
[~, ~] = RectCenter(windowRect);
                              

WriteDescription(window, ['Bu calismada size ' num2str(taskTrial) ' adet bir kelime ve bir rakamdan olusan obekler gosterilecektir. Bu obekler ekranin ortasinda teker teker belirecektir. Devam etmek icin herhangi bir tusa basiniz!']);
WriteDescription(window, 'Sizin goreviniz ekranda obekteki harf SESSIZ ise SOLdaki tusa, harf SESLI ise SAGdaki tusa basmaktir. Ekranda her bir harf belirdigi zaman, ekranin tepesinde SOLda SESSIZ ve SAGda SESLI yazilarini goreceksiniz. Bunlar hangi tusa basmanizi size hatirlatmak amaciyla buraya konmustur. Devam etmek icin herhangi bir tusa basiniz!');
WriteDescription(window, 'Hazir oldugunuzda, alistirma asamasina gecmek icin bosluk tusuna basiniz.');


%% Trial Configurations

testTimeResults = zeros(2, testTrial);
testResults = false(2, testTrial);

taskTimeResults = zeros(2, taskTrial);
taskResults = false(2, taskTrial); 

[testTimeResults(1, :), testResults(1, :)] = ...
    TaskSwitching('test', 1, 0, testTrial, window);


WriteDescription(window, 'Alistirmalar sona erdi. Simdi deneyin asil kismina gececegiz. Eger herhangi bir sorunuz varsa deney gorevlisine simdi sorunuz. Yoksa devam etmek icin ya sag ya da sol tusuna basiniz!');
WriteDescription(window, 'Lutfen sol elinizin isaret parmagini "sol" tusuna ve sag elinizin isaret parmagini da "sag" tusuna yerlestirin. Baslamak icin bu iki tustan birine basabilirsiniz!');

[taskTimeResults(1, :), taskResults(1, :)] = ...
    TaskSwitching('task', 1, testTrial, taskTrial, window);


WriteDescription(window, 'Bu deneyin ilk kismi (sesli-sessiz calismasi) sona erdi. Bir sonraki calisma icin herhangi bir tusa basiniz!');
WriteDescription(window, ['Simdiki calismada yine ' num2str(taskTrial) ' tane bir harf ve bir rakamdan olusan obekler goreceksiniz. Bu obekler teker teker ekranin ortasinda belirecek. Devam etmek icin bir tusa basiniz!']);
WriteDescription(window, 'Sizin goreviniz eger rakam TEK SAYI ise SOLdaki tusa, rakam CIFT SAYI ise SAGdaki tusa basmaktir. Bu calisma icin harflere dikkat etmenize gerek yok. Her bir sunumda TEK ve CIFT kelimeleri ekranin ust koselerinde de belirecekler. Bu kelimeler size TEK SAYI icin SOL ve CIFT SAYI icin SAG tusa basmanizi hatirlatmak icin belirecek. Devam etmek icin herhangi bir tusa basiniz!');

[testTimeResults(2, :), testResults(2, :)] = ...
    TaskSwitching('test', 2, testTrial+taskTrial, testTrial, window);


WriteDescription(window, 'Alistirma kismi sona erdi. Simdi asil deneye gececegiz. Herhangi bir sorunuz varsa, lutfen simdi deney gorevlisine sorunuz. Yoksa deneye baslamak icin herhangi bir tusa basiniz!');
WriteDescription(window, 'SOL isaret parmaginizin SOL tusta ve SAG isaret parmaginizin da SAG tusta olmasi cok onemli. Lutfen parmaklarinizi yerlestirin. Deneye baslamak icin SAG ya da SOL tusuna basiniz!');

[taskTimeResults(2, :), taskResults(2, :)] = ...
    TaskSwitching('task', 2, 2*testTrial+taskTrial, taskTrial, window);

%% Switch Part
if mod(pNo, 2)
    testTrial = 10;
    taskTrial = 40;
    testSwitchResults = zeros(1, testTrial);
    testSwitchTimes = zeros(1, testTrial);
    
    taskSwitchResults = zeros(1, taskTrial);
    taskSwitchTimes = zeros(1, taskTrial);
    
    WriteDescription(window, ['Simdiki asamada yine ' num2str(taskTrial) ' tane bir harf ve bir rakamdan olusan obekler goreceksiniz. Bu obekler ekranin ortasinda teker teker belirecek. Bundan onceki asamalarda yalnizca harfin ya da rakamin ozelligine dikkat ediyordunuz. Simdi her iki turden de sorular cevaplayacaksiniz.']);
    WriteDescription(window, 'Lutfen obeklerin renklerine dikkat ediniz. Yesil renkli obeklerde harf kuralini (sesli-sessiz), kirmizi renkli obekler ise rakam kuralini(tek-cift) kullanmaniz beklenmektedir. Ayrica ekranin ust kisminda beliren hatirlatici kelimeler de harfe mi yoksa rakama mi dikkat etmeniz gerektigini gosterecektir.');
    WriteDescription(window, 'Ekranin ust koselerinde SESLI ya da SESSIZ yaziliysa SESSIZ harfler icin SOL tusa, SESLI harfler icin SAG tusa basacaksiniz. Ust kisimda TEK ve CIFT yazili oldugunda, rakam TEK ise SOL tusa, rakam CIFT ise SAG tusa basacaksiniz. Oncelikle biraz alistirma yapalim.');
    
    [testSwitchTimes, testSwitchResults ] = ...
        TaskSwitching('test', 3, 0, testTrial, window);
    
    WriteDescription(window, 'Alistirmalar sona erdi. Simdi ASIL deneye gececegiz. Sorunuz var mi?');
    WriteDescription(window, 'Bu defa obekler 40 kez gosterilecek. Lutfen sol isaret parmaginizi SOL tusuna ve sag isaret parmaginizi SAG tusuna yerlestiriniz. Sorulari HIZLI ve DOGRU bir sekilde cevaplandirmaya calisiniz. Sag ya da Sol tusuna basarak deneye baslayabilirsiniz.');
    [taskSwitchTimes, taskSwitchResults ] = ...
        TaskSwitching('task', 3, testTrial, taskTrial, window);
end

%% First part ends
WriteDescription(window, 'Deneyin bu kismi sona erdi. Lutfen deney gorevlisine haber veriniz.');

%% Second part begins 
insightResults = InsightProblems(window, white);
%% End Code
sca;
                             
save([num2str(pNo) '.mat']);

end
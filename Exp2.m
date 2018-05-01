initPTB;

testTrial = 1;
taskTrial = 1;


screens = Screen('Screens');

screenNumber = max(screens);            

white = WhiteIndex(screenNumber);
black = BlackIndex(screenNumber);
gray = (black + white)/2;


[window, windowRect] = PsychImaging('OpenWindow', screenNumber, gray);
  

% Setup the text type for the window
Screen('Preference', 'TextEncodingLocale', 'UTF-8');
Screen('TextFont', window, 'Consolas');  
Screen('TextSize', window, 50);                               
Screen('TextStyle', window, 1);


[xCenter, yCenter] = RectCenter(windowRect);
                              

descriptions = [
    "Bu çalışmada size 45 adet bir harf ve bir rakamdan oluşan öbekler gösterilecektir. Bu öbekler ekranın ortasında teker teker belirecektir. Devam etmek için herhangi bir tuşa basınız!",
    "Sizin göreviniz ekranda öbekteki harf SESLİ ise SAĞdaki tuşa, harf SESSİZ ise SOLdaki tuşa basmaktır. Ekranda her bir harf belirdiği zaman, ekranın tepesinde SAĞda SESLİ ve SOLda SESSİZ yazılarını göreceksiniz. Bunlar hangi tuşa basmanızı size hatırlatmak amacıyla buraya konmuştur. Devam etmek için herhangi bir tuşa basınız!",
    "Hazır olduğunuzda, alıştırma aşamasına geçmek için boşluk tuşuna basınız.",
    ];

WriteDescriptions(window, descriptions);
 


%% Trial Configurations

testTimeResults = zeros(2, testTrial);
testResults = false(2, testTrial);

taskTimeResults = zeros(2, taskTrial);
taskResults = false(2, taskTrial); 

[testTimeResults(1, :), testResults(1, :)] = ...
    TaskSwitching('test', 1, testTrial, window);

descriptions = [
    "Alıştırmalar sona erdi. Şimdi deneyin asıl kısmına geçeceğiz. Eğer herhangi bir sorunuz varsa deney görevlisine şimdi sorunuz. Yoksa devam etmek için ya sağ ya da sol tuşuna basınız!",
    "Lütfen sağ elinizin işaret parmağını 'sol' tuşuna ve sağ elinizin yüzük parmağını da 'sağ' tuşuna yerleştirin. Başlamak için bu iki tuştan birine basabilirsiniz!",
    ];

WriteDescriptions(window, descriptions);
      
[taskTimeResults(1, :), taskResults(1, :)] = ...
    TaskSwitching('task', 1, taskTrial, window);

descriptions = [
    "Bu deneyin ilk kısmı (sesli-sessiz çalışması) sona erdi. Bir sonraki çalışma için herhangi bir tuşa basınız!",
    "Şimdiki çalışmada yine 20 tane bir harf ve bir rakamdan oluşan öbekler göreceksiniz. Bu öbekler teker teker ekranın ortasında belirecek. Sizin göreviniz eğer rakam TEK SAYI ise SOLdaki tuşa, rakam ÇİFT SAYI ise SAGdaki tuşa basmaktır. Devam etmek için bir tuşa basınız!",
    "Bu çalışma için harflere dikkat etmenize gerek yok. Her bir sunumda TEK ve ÇİFT kelimeleri ekranın ust köşelerinde de belirecekler. Bu kelimeler size TEK SAYI için SOL ve ÇİFT SAYI için SAG tuşa basmanızı hatırlatmak için belirecek. Devam etmek için herhangi bir tuşa basınız!",
    ];

WriteDescriptions(window, descriptions);

[testTimeResults(2, :), testResults(2, :)] = ...
    TaskSwitching('test', 2, testTrial, window);

descriptions = [
    "Alıştırma kısmı sona erdi. Şimdi asil deneye geçeceğiz. Herhangi bir sorunuz varsa, lütfen şimdi deney görevlisine sorunuz. Yoksa deneye başlamak için herhangi bir tuşa basınız!",
    "SAG işaret parmağınızın SOL tuşta ve SAG yuzuk parmağınızın da SAG tuşta olması çok önemli.Lütfen parmaklarınızı yerleştirin. Deneye başlamak için SAG ya da SOL tuşuna basınız!",
    ];

WriteDescriptions(window, descriptions);

[taskTimeResults(2, :), taskResults(2, :)] = ...
    TaskSwitching('task', 2, taskTrial, window);

%% First part ends     
descriptions = [                             
    "Deneyin bu kısmı sona erdi. Lütfen deney görevlisine haber veriniz."
    ];

WriteDescriptions(window, descriptions);

%% Second part begins 
insightResults = InsightProblems(window, white);
%% End Code
sca;

save('pNo.mat');
function results = InsightProblems(window, color)
descriptions = [ 
    "\nYedi yildizi uc esit daire cizerek birbirlerinden ayiracaksiniz. Dairelerin disinda hicbir yildiz olmayacak ve her kapali alanda yalniz bir yildiz bulunacak.",
    "\nKibrit coplerinden altisinin yerini degistirerek iki kare elde ediniz.",
    "\nFiguru, sekli ve boyutu ayni olacak bicimde 4 esit parcaya ayiriniz.",
    "\nKaleminizi kaldirmadan 4 noktayi 2 duz cizgi ile nasil birlestirebilirsiniz?",
    "\nUcgen yukari yonu isaret etmektedir. uc noktanin yerini degistirerek bu ucgeni asagi yonu isaret eder hale getiriniz.",
    "\nTek bir cubugun yerini degistirerek matematiksel ifadeyi dogru hale getiriniz.",
    "\n10 daireyi her sirada 4 daire olacak sekilde 5 sira halinde (dogru halinde) diziniz.",
    ];

nextString = 'Bitti';

ifi = Screen('GetFlipInterval', window);
frameRate = round(1/ifi);
presSecs = [sort(repmat(1:120, 1, frameRate), 'descend') 0];

results = zeros(length(descriptions), 1);


for i = 1:length(descriptions)
    j = 1;
    start = Screen('Flip', window);
    while j <= length(presSecs) && ~KbCheck
        secsString = num2str(presSecs(j));
        s = strcat(secsString, descriptions(i));
        
        DrawFormattedText(window, char(s), 'center', 'center', color, 30);
        Screen('Flip', window);
        j = j + 1;
    end
    
    DrawFormattedText(window, nextString, 'center', 'center', color, 30);
    finish = Screen('Flip', window);
    
    results(i) = finish - start;
    KbStrokeWait;
end

end

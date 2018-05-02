function results = InsightProblems(window, color)
descriptions = [ 
    "\nYedi yıldızı üç eşit daire çizerek birbirlerinden ayıracaksınız. Dairelerin dışında hiçbir yıldız olmayacak ve her kapalı alanda yalnız bir yıldız bulunacak.",
    "\nKibrit çöplerinden altısının yerini değiştirerek iki kare elde ediniz.",
    "\nFigürü, şekli ve boyutu aynı olacak biçimde 4 eşit parçaya ayırınız.",
    "\nKaleminizi kaldırmadan 4 noktayı 2 düz çizgi ile nasıl birleştirebilirsiniz?",
    "\nÜçgen yukarı yönü işaret etmektedir. Üç noktanın yerini değiştirerek bu üçgeni aşağı yönü işaret eder hale getiriniz.",
    "\nTek bir çubuğun yerini değiştirerek matematiksel ifadeyi doğru hale getiriniz.",
    "\n10 daireyi her sırada 4 daire olacak şekilde 5 sıra halinde (doğru halinde) diziniz.",
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

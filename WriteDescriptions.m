function WriteDescriptions(window, descriptions)
for i=1:length(descriptions)
    DrawFormattedText(window, unicode2native(char(descriptions(i))), ...
        'center', 'center', 1, 30);
    Screen('Flip', window);
    KbStrokeWait;
end
end
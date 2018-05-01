function WriteDescriptions(window, descriptions)
for i=1:length(descriptions)
    ss = uint8(char(descriptions(i)));
    ss
    DrawFormattedText(window, ss, 'center', 'center', 1, 30);
    Screen('Flip', window);
    KbStrokeWait;
end
end
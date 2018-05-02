function WriteDescription(window, description)

DrawFormattedText(window, description, 'center', 'center', 1, 30);
Screen('Flip', window);
KbStrokeWait;

end
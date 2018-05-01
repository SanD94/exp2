function [totTime, results] = TaskSwitching(type, task, trials, window)

totTime = zeros(1, trials);
results = false(1, trials);

letters = 'CDFGHJKLMNPRSTVYZAEIOU';
sep = 17;

rightKey = KbName('RightArrow');
leftKey = KbName('LeftArrow');

for trial = 1:trials
    
    % Letter Random
    if rand() < 0.5
        letterIndex = randi(sep);
    else
        letterIndex = sep + randi(5);
    end
    
    letter = letters(letterIndex);
    number = randi([2, 9]);
    
    
    % Task Random
    if task == 1
        color = [1 0 0];
    elseif task == 2
        color = [0 1 0];
    elseif rand() < 0.5
        color = [1 0 0];
    else
        color = [0 1 0];
    end
  
    
    textString = [letter num2str(number)];                                                
    
    % Text Output in the center of the screen
    DrawFormattedText(window, textString, 'center', 'center', color);
    start = Screen('Flip', window);
    
    
    [finish, keyCode] = KbStrokeWait;
    
    if color(1) == 1
        if letterIndex <= sep && keyCode(leftKey)
            result = 1;
        elseif letterIndex > sep && keyCode(rightKey)
            result = 1;
        else
            result = 0;
        end
    else
        if mod(number,2) == 1 && keyCode(leftKey)
            result = 1;
        elseif mod(number, 2) == 0 && keyCode(rightKey)
            result = 1;
        else
            result = 0;
        end
    end
    
    results(trial) = result;
    totTime(trial) = finish - start;
    
    
    if strcmp(type, 'test')
        if result
            text = 'DOGRU';
        else
            text = 'YANLIS';
        end
        
        for i=1:20
            DrawFormattedText(window, text, 'center', 'center', 1);
            Screen('Flip', window);
        end
    end
end

end
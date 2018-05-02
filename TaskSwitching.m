function [totTime, results] = TaskSwitching(type, task, startIndex, trials, window)

totTime = zeros(1, trials);
results = false(1, trials);

letterIndex = [18,20,20,12,20,3,19,13,8,19,19,21,1,8,4,20,19,19,21,4,22,12,15,18,22,22,18,7,22,19,18,3,20,9,1,20,21,22,22,15,22,20,19,16,22,20,12,11,21,22,20,20,3,20,19,21,11,1,4,4,4,11,10,20,20,9,22,4,21,4,18,3,11,18,21,18,22,22,20,7,1,19,6,12,15,22,8,4,19,18,20,22,8,13,18,7,9,3,16,20,18,21,18,19,4,18,1,1,18,6,2,19,2,1,21,18,14,20,15,5,18,12,20,21,19,20,2,19,21,3,20,21,18,2,22,18,18,11,12,20,19,22,18,7,20,19,2,19,10,11];
numberIndex = [4,4,6,4,8,9,7,4,6,2,9,9,8,4,6,2,5,4,3,3,5,2,6,5,7,7,7,2,2,4,6,7,5,8,7,9,6,4,2,6,8,5,2,4,3,4,5,6,5,9,6,9,7,9,3,7,4,7,7,2,4,3,7,8,4,8,7,2,6,5,9,2,5,5,5,8,4,8,5,2,3,7,5,3,4,6,3,7,3,9,4,8,3,4,2,6,7,6,5,7,7,7,7,9,3,7,3,2,6,5,5,7,8,4,7,5,8,8,4,6,6,6,8,4,4,2,9,7,5,7,6,7,6,7,6,9,3,2,2,2,5,5,4,8,7,8,9,9,3,3];


letters = 'CDFGHJKLMNPRSTVYZAEIOU';
sep = 17;

rightKey = KbName('RightArrow');
leftKey = KbName('LeftArrow');


for trial = startIndex+1:trials+startIndex
    
    
    
    letter = letters(letterIndex(trial));
    number = numberIndex(trial);
    
    
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
    if color(1) == 1
        DrawFormattedText(window, 'SESSIZ', 0, 50, color);
        DrawFormattedText(window, 'SESLI', 'right', 50, color);
    else
        DrawFormattedText(window, 'TEK', 0, 50, color);
        DrawFormattedText(window, 'CIFT', 'right', 50, color);
    end
    DrawFormattedText(window, textString, 'center', 'center', color);
    start = Screen('Flip', window);
    
    
    [finish, keyCode] = KbStrokeWait;
    
    if color(1) == 1
        if letterIndex(trial) <= sep && keyCode(leftKey)
            result = 1;
        elseif letterIndex(trial) > sep && keyCode(rightKey)
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
    
    results(trial-startIndex) = result;
    totTime(trial-startIndex) = finish - start;
    
    
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
randomizer = zeros(1,45);

for i=1:150
    if rand() < 0.5
        randomizer(i) = randi(17);
    else
        randomizer(i) = 17 + randi(5);
    end
end
function pos = generate_pos(min, max)
    x = randi([min max]);
    y = randi([min max]);
    pos = [x, y];
end
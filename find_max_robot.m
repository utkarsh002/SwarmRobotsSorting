function robot = find_max_robot(robots)
    mx = -999999;
    for i = 1:numel(robots)
        if robots(i).value > mx
            mx = robots(i).value;
            robot = robots(i);
        end
    end
end
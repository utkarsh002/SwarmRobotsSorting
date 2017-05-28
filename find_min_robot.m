function robot = find_min_robot(robots)
    mn = 999999;
    for i = 1:numel(robots)
        if robots(i).value < mn
            mn = robots(i).value;
            robot = robots(i);
        end
    end
end
function adjacent = is_adjacent(robots, u, g)
    for i = 1:numel(robots(u).adjacent)
        if robots(u).adjacent(i) == g
            adjacent = true;
            break;
        else
            adjacent = false;
        end 
    end
end
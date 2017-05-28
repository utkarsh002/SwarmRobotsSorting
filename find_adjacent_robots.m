function robots = find_adjacent_robots(robots)
    for i = 1:numel(robots)
        for j = 1:numel(robots)
            if i ~= j
                if distance(robots(i).pos, robots(j).pos) <= robots(i).comm_range
                    if i == 5 && j == 7
                    %    fprintf('jggdsjg');
                    end
                    robots(i).adjacent = [robots(i).adjacent, robots(j).serial_no];
                    robots(j).adjacent = [robots(j).adjacent, robots(i).serial_no];
                end
            end
        end
    end
    for i = 1:numel(robots)
        robots(i).adjacent = unique(robots(i).adjacent);
    end
end

function dist = distance(x, y)
    dist = sqrt(sum((x-y).^2));
end
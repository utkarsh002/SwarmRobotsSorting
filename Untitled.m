while true
for i = 1:numel(robots)
visualization_helper(robots(i).pos, robots, t, i);
end
end
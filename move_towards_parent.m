function robots = move_towards_parent(u, robots, t)
    if robots(u).primary_parent ~= 1e17
        path = move_towards_goal(robots(u).pos, robots(robots(u).primary_parent).pos);
        visualization_helper(path, robots, t, u);
        robots(u).pos = path;
    end
end
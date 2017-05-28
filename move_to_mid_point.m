function robots = move_to_mid_point(u, robots, t)
    p_parent = robots(u).primary_parent;
    f_parent = robots(u).feedback_parent;
    path = move_towards_goal(robots(u).pos, (robots(p_parent).pos + robots(f_parent).pos) / 2.0);
    %visualize_single_robot(path, robots(u), t);
    visualization_helper(path, robots, t, u);
    robots(u).pos = path;
end
function f_tree = feedback_tree_robots(robots)
    f_tree = [];
    for i = 1:numel(robots)
        if robots(i).feedback_parent ~= 1e17
            f_tree = [f_tree, robots(i)];
        end
    end
end
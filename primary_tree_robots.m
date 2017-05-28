function p_tree = primary_tree_robots(robots)
    p_tree = [];
    for i = 1:numel(robots)
        if robots(i).primary_parent ~= 1e17
            p_tree = [p_tree, robots(i)];
        end
    end
end
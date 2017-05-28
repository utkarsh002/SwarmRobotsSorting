function h = plot_primary_tree(primary_tree, robots)
    h = [];
    for i = 2:numel(primary_tree)
        x = [];
        y = [];
        if primary_tree(i).primary_parent ~= 1e17
            x = [x, primary_tree(i).pos(1, 1)];
            y = [y, primary_tree(i).pos(1, 2)];
            x = [x, robots(primary_tree(i).primary_parent).pos(1,1)];
            y = [y, robots(primary_tree(i).primary_parent).pos(1,2)];
            %hold on;
            z = line(x, y);
            h = [h, z];
        end
    end
end
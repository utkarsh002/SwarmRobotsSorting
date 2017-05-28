function visualize_graph(robots)
    x = [];
    y = [];
    for i = 1:numel(robots)
        x = [x, robots(i).pos(1,1)];
        y = [y, robots(i).pos(1,2)];
    end
    figure
    plot(x, y);
end
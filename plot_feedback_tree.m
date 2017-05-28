function h = plot_feedback_tree(feedback_tree, robots)
    h = [];
    for i = 1:(numel(feedback_tree)-1)
        x = [];
        y = [];
        if feedback_tree(i).feedback_parent ~= 1e17
            x = [x, feedback_tree(i).pos(1, 1)+1.5];
            y = [y, feedback_tree(i).pos(1, 2)+1.5];
            x = [x, robots(feedback_tree(i).feedback_parent).pos(1,1)+1.50];
            y = [y, robots(feedback_tree(i).feedback_parent).pos(1,2)+1.50];
            %hold on;
            z = line(x, y,'color','k');
            h = [h, z];
        end
    end
end
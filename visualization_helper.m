function visualization_helper(path, robots, t, u)
    [r, ~] = size(path);
    for i = 1:r
        handle = [];
        text1 = [];
        for j = 1:numel(robots)
            if j == u
                if robots(j).status == 1
                    hand = rectangle('Position',[path(i, 1)-robots(j).radius,path(i, 2)-robots(j).radius, 2*robots(j).radius, 2*robots(j).radius],'curvature',[1 1],'FaceColor','red');
                    tex = text(path(i, 1) + 1.0, path(i, 2), int2str(robots(j).value), 'FontSize',10);
                else
                    hand = rectangle('Position',[path(i, 1)-robots(j).radius,path(i, 2)-robots(j).radius, 2*robots(j).radius, 2*robots(j).radius],'curvature',[1 1],'FaceColor','blue');
                    tex = text(path(i, 1) + 1.0, path(i, 2), int2str(robots(j).value),'FontSize',10);
                end
            else 
                if robots(j).status == 1
                    hand = rectangle('Position',[robots(j).pos(1, 1)-robots(j).radius,robots(j).pos(1, 2)-robots(j).radius, 2*robots(j).radius, 2*robots(j).radius],'curvature',[1 1],'FaceColor','red');
                    tex = text(robots(j).pos(1, 1) + 1.0, robots(j).pos(1, 2), int2str(robots(j).value),'FontSize',10);
                else
                    hand = rectangle('Position',[robots(j).pos(1, 1)-robots(j).radius,robots(j).pos(1, 2)-robots(j).radius, 2*robots(j).radius, 2*robots(j).radius],'curvature',[1 1],'FaceColor','blue');
                    tex = text(robots(j).pos(1, 1) + 1.0, robots(j).pos(1, 2), int2str(robots(j).value),'FontSize',10);
                end
            end
            handle = [handle, hand];
            text1 = [text1, tex];
            
        end
        visualize_single_robot(handle, text1,t);
    end
end
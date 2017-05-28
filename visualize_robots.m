function visualize_robots(robots, t)
    axis([0 100 0 100]);
    grid on;
    handle = [];
    for i = 1:numel(robots)
        if robots(i).status == 1
            hand = rectangle('Position',[robots(i).pos(1,1)-robots(i).radius,robots(i).pos(1,2)-robots(i).radius, 2*robots(i).radius, 2*robots(i).radius],'curvature',[1 1],'FaceColor','red');
        else
            hand = rectangle('Position',[robots(i).pos(1,1)-robots(i).radius,robots(i).pos(1,2)-robots(i).radius, 2*robots(i).radius, 2*robots(i).radius],'curvature',[1 1],'FaceColor','blue');
        end
        handle = [handle; hand];
    end
    show_robots(handle, t);
end

function show_robots(handle, t)
    [r, ~] = size(handle);
    M(t) = getframe;
    for i = 1:r
        delete(handle(i,:));
    end
end
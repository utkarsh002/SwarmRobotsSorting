function robots = maintain_main_path(robots)
    for i = 1:numel(robots)
        if robots(i).primary_parent ~= robots(i).feedback_parent
            robots(i).status = 1;
        else
            robots(i).status = 2;
        end
    end
end
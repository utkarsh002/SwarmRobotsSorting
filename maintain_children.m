function robots = maintain_children(robots)
    for i = 1:numel(robots)
        if (robots(i).primary_parent ~= 1e17)
            robots(robots(i).primary_parent).children(robots(i).serial_no) = 1;
        end
    end
end
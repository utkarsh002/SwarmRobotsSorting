function robots = make_feedback_tree(robots, root)
    q = [];
    q = [q, root];
    visited = containers.Map('KeyType', 'int32', 'ValueType', 'int32');
    visited(root.serial_no) = 1;
    while numel(q) ~= 0
        u = q(1);
        q(1)= [];
        %visited(u.serial_no) = 1;
        for i = 1:numel(u.adjacent)
            if isKey(visited, robots(u.adjacent(i)).serial_no) == 0
                %q = [q, robots(u.adjacent(i))];
                %visited(robots(u.adjacent(i)).serial_no) = 1;
                if (robots(u.adjacent(i)).primary_parent == u.serial_no) || (isKey(robots(u.adjacent(i)).children, u.serial_no) == 1)
                    robots(u.adjacent(i)).feedback_parent = u.serial_no;
                    if robots(u.serial_no).feedback_parent == u.adjacent(i)
                        if robots(u.adjacent(i)).primary_parent == u.serial_no
                            robots(u.serial_no).feedback_parent = robots(u.serial_no).primary_parent; 
                        end
                    end
                    visited(robots(u.adjacent(i)).serial_no) = 1;
                    q = [q, robots(u.adjacent(i))];
                end
            end
        end
    end
end
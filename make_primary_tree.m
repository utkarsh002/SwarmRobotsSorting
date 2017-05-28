function robots = make_primary_tree(robots, root)
    q = [];
    root.hop_count = 0;
    q = [q, root];
    visited = containers.Map('KeyType', 'int32', 'ValueType', 'int32');
    visited(root.serial_no) = 1;
   while numel(q) ~= 0
        u = q(1);
        q(1) = [];
        for i = 1:numel(u.adjacent) 
             if isKey(visited, robots(u.adjacent(i)).serial_no) == 0
                q = [q, robots(u.adjacent(i))];
                visited(robots(u.adjacent(i)).serial_no) = 1;   
                robots(u.adjacent(i)).primary_parent = u.serial_no;
                if (u.adjacent(i) == 7)
                   % fprintf('Parent Chosen is :%d\n', u.serial_no);
                end
                u.children(robots(u.adjacent(i)).serial_no) = 1;
                if (robots(u.adjacent(i)).hop_count > u.hop_count + 1)
                    robots(u.adjacent(i)).hop_count = u.hop_count + 1;
                end
             end
        end
        %visited(u.serial_no) = 1;
    end
end
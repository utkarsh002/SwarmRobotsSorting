function [robots, flag] = insertion(u, s, robots)
    %{
    p = robots(u).primary_parent;
    if p ~= 1e17
        if robots(u).status == 1
            s = 0;
            for i = 1:numel(robots(u).adjacent)
                if (robots(robots(u).adjacent(i)).status == 2) && (robots(robots(u).adjacent(i)).primary_parent == p)
                    s = robots(robots(u).adjacent(i)).serial_no;
                end
                
                if (s ~= 0) 
                    if (compare_robots(robots(p), robots(s)) == true) && (compare_robots(robots(s), robots(u)) == true) && (robots(p).status == 1)
                        robots(u).primary_parent = s;
                        robots(s).status = 1;
                        break;
                    end
                end
            end
        end
    end
    %}
    flag = false;
    p = robots(u).primary_parent;
    if (p ~= 1e17) && (robots(p).status == 1)
        if robots(s).primary_parent ~= 1e17 
            if (robots(s).primary_parent == p) && (robots(s).status == 2) && (compare_robots(robots(p), robots(s)) && compare_robots(robots(s), robots(u)))
                robots(u).primary_parent = s;
                %if (robots(s).primary_parent ~= robots(s).feedback_parent)
                    robots(s).status = 1;
               % end
                rand
                fprintf('Inserting\n');
                flag = true;
            end
        end
    end
end
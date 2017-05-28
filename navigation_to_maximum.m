function [robots, flag] = navigation_to_maximum(u, s, robots)
    %{
    if robots(u).status == 2
        tmp = false;
        while tmp == false;
             p =robots(u).primary_parent;
             if p ~= 1e17
                 s = 0;
                 for i = 1:numel(robots(u).adjacent)
                     if robots(robots(u).adjacent(i)).primary_parent ~= 1e17
                         if (robots(robots(u).adjacent(i)).status == 1) && (robots(robots(u).adjacent(i)).primary_parent == p)
                            s = robots(u).adjacent(i);
                         end
                     end
                     if (s ~= 0)
                        if robots(p).status == 1 && compare_robots(robots(p), robots(u)) && compare_robots(robots(s), robots(u))
                            robots(u).primary_parent = robots(s).serial_no;
                            %break;
                        elseif compare_robots(robots(p), robots(u)) && compare_robots(robots(u), robots(s))
                            robots = insertion(s, robots);
                            tmp = true;
                            break;
                        end
                     end 
                 end
                 if s == 0 || tmp == true
                     break;
                 end
             end
        end
    end
    %}
    flag = false;
    if robots(u).status == 2
            p = robots(u).primary_parent;
            if (p ~= 1e17) && (robots(p).status == 1)
                if robots(s).primary_parent ~= 1e17
                    if (robots(s).status == 1) && (robots(s).primary_parent == p) && (compare_robots(robots(p), robots(u)) && compare_robots(robots(s), robots(u)))
                        robots(u).primary_parent = s;
                        flag = true;
                    end
                    %fprintf('navigation_to_maximum\n');
                end
            end
    end
end
function [robots, flag] = deletion(u, g, robots,t)
    %{
    p = robots(u).primary_parent;
    if p ~= 1e17
        if robots(u).status == 1
            g = 0;
            for i = 1:numel(robots(u).adjacent)
                if robots(p).primary_parent ~= 1e17
                    if (robots(p).primary_parent == robots(robots(u).adjacent(i)).serial_no) && (robots(robots(u).adjacent(i)).status == 1)
                        g = robots(robots(u).adjacent(i)).serial_no;
                        %break;
                    end
                    
                    if g ~= 0
                        if (compare_robots(robots(p), robots(g)) || compare_robots(robots(u), robots(p))) && (robots(p).status == 1)
                            robots(u).primary_parent = g;
                            robots(p).status = 2;
                            break;
                        end
                    end
                end
            end

            %if g ~= 0
            %    if (compare_robots(robots(p), robots(g)) || compare_robots(robots(u), robots(p))) && (robots(p).status == 1)
            %        robots(u).primary_parent = g;
            %    end
            %end
        end
    end
    %}
    flag = false;
    p = robots(u).primary_parent;
    if (p ~= 1e17) && (robots(p).status == 1)
        if (robots(p).primary_parent ~= 1e17)
            if (robots(p).primary_parent == g) && (compare_robots(robots(p), robots(g)) || compare_robots(robots(u), robots(p))) && (robots(g).status == 1)
                robots(u).primary_parent = g;
                robots(p).status = 2;
                visualization_helper(robots(p).pos, robots, t, p);
                flag = true;
                rand
                fprintf('deleting\n');
            end
        end
    end
end
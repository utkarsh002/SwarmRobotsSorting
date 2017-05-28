function [robots, flag] = navigation_to_minimum(u, g, robots)
    %{
    if robots(u).status == 2
       p = robots(u).primary_parent;
       if p ~= 1e17
           g = 0;
           for i = 1:numel(robots(u).adjacent)
               if robots(p).primary_parent ~= 1e17
                   if (robots(robots(u).adjacent(i)).status == 1) && (robots(p).primary_parent == robots(robots(u).adjacent(i)).serial_no)
                        g = robots(u).adjacent(i);
                   end
                   if g ~= 0
                       if (robots(p).status == 1) && (compare_robots(robots(u), robots(p)))
                           robots(u).primary_parent = g;
                       elseif compare_robots(robots(g), robots(p)) && compare_robots(robots(p), robots(u))
                           robots(u).status = 1;
                       end  
                   end
               end
           end  
       end
   end
   %}
    flag = false;
    p = robots(u).primary_parent;
    if (p ~= 1e17) && (robots(p).status == 1) && (robots(u).status == 2)
        if robots(p).primary_parent ~= 1e17
            if (robots(p).primary_parent == g) && (robots(g).status == 1) && compare_robots(robots(u), robots(p))
                robots(u).primary_parent = g;
                flag = true;
            end
            %fprintf('navigation_to_minimum\n');
        end
    end
end
clear;
clear all;
close all;
n = 15; %number of robots
%rng(seedValue);
radius = 0.5;
comm_range = 50;
val_map = containers.Map('KeyType', 'int32', 'ValueType', 'int32');
pos_map_x = containers.Map('KeyType', 'int32', 'ValueType', 'int32');
pos_map_y = containers.Map('KeyType', 'int32', 'ValueType', 'int32');

%Robot array creation
robots = Robot.empty(n,0);
%position = [10 10; 20 30;30 20;40 50;50 40;60 70;70 60; 80 90;90 80;95 95];
position = [87 9; 95 95; 10 10; 54 100; 92 16; 46 9; 66 69; 17 61; 80 32; 2 34];
val = [82,97,8, 83, 23, 75, 27, 53, 17, 47];
%intializing properties of robots
for i = n:-1:1
    value = generate_value(1, 100);
    %value = val(i);
    
    if isKey(val_map, value) == 1
        while isKey(val_map, value) == 1
            value = generate_value(1, 100);
        end
    else
        val_map(value) = 1;
    end
    
    pos = generate_pos(1, 100);
    %pos = position(i,:);
    
    if isKey(pos_map_x, pos(1)) == 1 && isKey(pos_map_y, pos(2)) == 1
        while isKey(pos_map_x, pos(1)) == 1 && isKey(pos_map_y, pos(2)) == 1
            pos = generate_pos(1, 100);
        end
    else 
        pos_map_x(pos(1)) = 1;
        pos_map_y(pos(2)) = 1;
    end
    
    robots(i) = Robot(value, i, comm_range, pos, radius);
end
t = 1;
[~, ind] = sort([robots.value]);
for i = 2:numel(ind)
    robots(ind(i)).radius = robots(ind(i - 1)).radius + 0.002;
end
%robots = find_adjacent_robots(robots);

min_robot = find_min_robot(robots);
max_robot = find_max_robot(robots);
%robots = make_primary_tree(robots, min_robot);
%robots = make_feedback_tree(robots, max_robot);
%creating initial graph of robots
robots(min_robot.serial_no).pos = [10, 10];
robots(max_robot.serial_no).pos = [95, 95];
robots = find_adjacent_robots(robots);
robots = make_primary_tree(robots, min_robot);
prev_pos = [];
for i = 1:n
    prev_pos = [prev_pos; robots(i).pos];
end
visualize_robots(robots, t);
while true
    hold on;
    %{
    for i = 1:numel(robots)
        robots(i).adjacent = [];
        %robots(i).status = 0;
        remove(robots(i).children, keys(robots(i).children));
    end
    %}
    %robots = find_adjacent_robots(robots);
    %min_robot = find_min_robot(robots); %robot with minimum value
    %max_robot = find_max_robot(robots); %robot with maximum value
    %robots = make_primary_tree(robots, min_robot);
    primary_tree = [];
    primary_tree = primary_tree_robots(robots);
    primary_tree = [min_robot, primary_tree];
    robots = make_feedback_tree(robots, max_robot);
    feedback_tree = [];
    feedback_tree = feedback_tree_robots(robots);
    feedback_tree = [feedback_tree, max_robot];
    h1 = plot_primary_tree(primary_tree, robots);
    h2 = plot_feedback_tree(feedback_tree, robots);
    for i = 1:numel(robots)
        if ((robots(i).primary_parent ~= robots(i).feedback_parent) && (robots(i).primary_parent ~= 1e17) && (robots(i).feedback_parent ~= 1e17)) || (robots(i).serial_no == min_robot.serial_no) || (robots(i).serial_no == max_robot.serial_no) 
            robots(i).status = 1;
            
            for j = 1:numel(robots(i).adjacent)
                [robots, flag] = insertion(i, robots(i).adjacent(j), robots);
                %robots = maintain_main_path(robots);
                if flag == true
                    continue;
                end
                
                [robots, flag] = deletion(i, robots(i).adjacent(j), robots, t);
                %robots = maintain_main_path(robots);
                if flag == true
                    continue;
                end
              
            end
           
            if robots(i).primary_parent ~= 1e17 && robots(i).feedback_parent ~= 1e17
                robots = move_to_mid_point(i, robots, t);
            end
        else
            robots(i).status = 2;
            
            for j = 1:numel(robots(i).adjacent)
                [robots, flag] = navigation_to_minimum(i, robots(i).adjacent(j), robots);
                %robots = maintain_main_path(robots);
                if flag == true
                    continue;
                end
                [robots, flag] = navigation_to_maximum(i, robots(i).adjacent(j), robots);
                %robots = maintain_main_path(robots);
                if flag == true
                    continue;
                end
                
            end
            
            if (robots(i).primary_parent ~= 1e17 && robots(i).feedback_parent ~= 1e17)
                robots = move_towards_parent(i, robots, t);
            end
        end
    end
    main_path = main_path_robots(robots);
    delete(h1);
    delete(h2);
    
    for i = 1:numel(robots)
        robots(i).adjacent = [];
        %robots(i).status = 0;
        remove(robots(i).children, keys(robots(i).children));
    end
    robots = find_adjacent_robots(robots);
    robots = maintain_children(robots);
    cnt = 0;
    for i =1:numel(robots)
        if robots(i).status == 1
            cnt = cnt + 1;
        end
    end
    
    cnt1 = 0;
    if cnt == n
        for i =1:numel(robots)
            if robots(i).primary_parent ~= 1e17 && robots(i).feedback_parent ~= 1e17
                p_parent = robots(i).primary_parent;
                f_parent = robots(i).feedback_parent;
                mid = mid_points(robots(p_parent).pos, robots(f_parent).pos);
                if euclidean(mid, robots(i).pos) <= 0.61
                    cnt1 = cnt1 + 1;
                end
            end
        end
    end
    
    if cnt1 == n - 2
        break;
    end
    prev_pos = [];
    for i = 1:n
        prev_pos = [prev_pos; robots(i).pos];
    end
    hold off;
end
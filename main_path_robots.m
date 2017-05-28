function main_path = main_path_robots(robots)
    main_path = [];
    for i = 1:numel(robots)
        if (robots(i).status == 1)
            main_path = [main_path, robots(i)];
            %robots(i).status = 1;
        else 
            %robots(i).status = 2;
        end
    end
end
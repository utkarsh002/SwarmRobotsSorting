function less = compare_robots(u, v)
    if u.value < v.value
        less = true;
    elseif u.value == v.value
        if u.serial_no < v.serial_no
            less = true;
        else
            less = false;
        end
    else
        less = false;
    end
end
function path = move_towards_goal(A, B)
    %path = [];
    act = A;
    %while distance(act, B) < 0.1
     %   path = [path; act];
    act = straight_line(act, B);
    %end
    path = act;
end

function dist = distance(u, v)
    dist = sqrt(sum((u-v).^2));
end

function action = straight_line(A, B)
    action = A + (0.6 * 1 * ((B - A) / (norm(B-A))));
end
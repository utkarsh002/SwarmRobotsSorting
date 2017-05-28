function dist = euclidean(u, v)
    dist = sqrt(sum((u-v).^2));
end
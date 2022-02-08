function category = classifypoints(file, points)

% load variables
load(file, 'W2', 'W3', 'W4', 'b2', 'b3', 'b4');
% get numbers of points
[~, n] = size(points);

% initial category with all -1, which means error.
category = -ones(n, 1);
for i = 1:n
    x = points(:, i);
    % Forward pass
    a2 = activate(x,W2,b2);
    a3 = activate(a2,W3,b3);
    a4 = activate(a3,W4,b4);
    % category based on a4's value
    if a4(1) >= a4(2)
        category(i) = 1;
    else
        category(i) = 0;
    end
end

end
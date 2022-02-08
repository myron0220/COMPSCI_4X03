function cs = newton(xs, ys)
    % assume xs and ys are column vectors with the same size.
    % return a column vector that contains all coefficients. e.g. c_0 = cs(1)
    [num_of_points, ~] = size(xs);
    n = num_of_points - 1;
    % initialize
    dp = zeros(n+1, n+2);
    for i = 1:n+1
        dp(i, 1) = xs(i);
        dp(i, 2) = ys(i);
    end
    % calculate (1,2), (2,2), (3,2) ... (n+1, 2), (1,3), (2,3)...
    for j = 3:n+2
        for i = j - 1:n+1
            dp(i, j) = (dp(i, j-1) - dp(i-1, j-1)) / (dp(i, 1) - dp(i - j + 2, 1));
        end
    end
    res = dp(:, 2:n+2);
    % c_0 = cs(1), c_1 = cs(2), ...
    cs = diag(res);
end
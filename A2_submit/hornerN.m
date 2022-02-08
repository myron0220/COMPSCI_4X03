function yx = hornerN(xx, xs, cs)
    % assume input are col vectors
    % xx - the points for interpoation
    % xs - the actual points already have
    % cs - the coefficient sequences return by newton.m
    % yx - return the interpolation vals (col vectors corresponding to xx)
    [m, ~] = size(xx);
    [num_of_points, ~] = size(xs);
    n = num_of_points - 1;
    res = zeros(m, n+1);
    res(:, n+1) = cs(n+1);
    for k = n:-1:1
        res(:,k) = cs(k)*ones(m,1) + (xx - xs(k)*ones(m,1)).*res(:,k+1);
    end
    yx = res(:,1);
end


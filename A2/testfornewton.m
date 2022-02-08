% function cs = newton(xs, ys)
% assume xs and ys are column vectors with the same size.
% return a row vector that contains all coefficients. e.g. c_0 = cs(1)
xs = [1,2,4,3]';
ys = [1,3,3,5]';
cs = newton(xs, ys)

% function s = hornerN(xx, xs, cs)
% assume input are row vectors
% xx - the points for interpoation
% xs - the actual points already have
% cs - the coefficient sequences return by newton.m
xx = [1,2,4,3]';
yx = hornerN(xx, xs, cs)






clear all; close all;
n = 20;
% degree = 
a = -1; b = 1;
% equally spaced nodes
xs = linspace(a,b,n+1)';
f = @(x) abs(x);

% function cs = newton(xs, ys)
% assume xs and ys are column vectors with the same size.
% return a column vector that contains all coefficients. e.g. c_0 = cs(1)
cs = newton(xs, f(xs));

xx = linspace(a, b, 41)';
% function yx = hornerN(xx, xs, cs)
% assume input are col vectors
% xx - the points for interpoation
% xs - the actual points already have
% cs - the coefficient sequences return by newton.m
% yx - return the interpolation vals (col vectos corresponding to xx)
yx = hornerN(xx, xs, cs);

% plot
plot(xx, f(xx), xx, yx);
legend('f(x)', 'p(x)');
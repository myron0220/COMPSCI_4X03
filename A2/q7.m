clear all; close all;
n = 20;
% degree = 
a = -pi; b = pi;
% equally spaced nodes
x = linspace(a,b,n+1);
f = @(x) sin(x);
p = polyfit(x,f(x), n);
% calculate error
xx = linspace(a, b, 41);
error = abs(f(xx) - polyval(p, xx));

% plot a
% plot(xx, f(xx), xx, polyval(p, xx));
% legend('f(x)', 'p(x)');
% plot b
plot(xx, error);
legend('error');
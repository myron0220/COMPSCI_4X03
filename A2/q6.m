clear all; close all;
n = 20;
% degree = 
a = -1; b = 1;
% equally spaced nodes
x = linspace(a,b,n+1);
f = @(x) abs(x);
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




% a
% plot(xx, f(xx), xx, polyval(p, xx));
% legend('f(x)', 'p(x)');
% hold on;

% scatter(xx, f(xx), 'blue', 'o');
% hold on;
% scatter(xx, polyval(p, xx), 'red', 'x');
% legend('f(x)', 'p(x)');

% b
% plot(xx, error);
% legend('error');

% scatter(xx, f(xx), 'blue', 'o');
% hold on;
% scatter(xx, polyval(p, xx), 'red', 'x');
% legend('f(x)', 'p(x)');
% scatter(xx, error, 'green', '.');
% legend('f(x)', 'p(x)', 'error');

%c






% error = abs(f(xx)- polyval(p,xx));
% h  = (b-a)/n;
% M = 15/16;
% ons = ones(length(xx), 1);
% error_bound =  M / (4*(n+1)) * h^(n+1)
% semilogy(xx, error, xx, error_bound*ons)
% legend('error', 'error bound')
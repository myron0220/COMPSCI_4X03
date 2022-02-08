clear all; close all;
n = 20;
% degree = 
a = -1; b = 1;
% Chebyshev nodes
i = 0:n;
x = cos((2*i+1)/(2*n+2) * pi);
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

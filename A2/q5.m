clear all; close all;
n = 3;
% degree = 2;
a = 0; b = 0.3;
x = linspace(a,b,n+1);
f = @(x) sqrt(x+1);
p = polyfit(x,f(x), n);

xx = linspace(0, 0.3, 1000);
error = abs(f(xx)- polyval(p,xx));

approx1 = polyval(p,0.05)
error1 = abs(f(0.05) - approx1)
approx2 = polyval(p,0.15)
error2 = abs(f(0.15) - approx2)

h  = (b-a)/n;
M = 15/16;
ons = ones(length(xx), 1);
error_bound =  M / (4*(n+1)) * h^(n+1)
semilogy(xx, error, xx, error_bound*ons)
legend('error', 'error bound')


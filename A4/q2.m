clf;
clear;
clc;

% (a)
f = @(x) (x - 2) .^ 9;
g = @(x) x.*(x.*(x.*(x.*(x.*(x.*(x.*(x.*(x - 18) + 144) - 672) + 2016) - 4032) + 5376) - 4608) + 2304) - 512;
z = @(x) x.^9 - 18*x.^8 + 144*x.^7 - 672*x.^6 + 2016*x.^5 - 4032*x.^4 + 5376*x.^3 - 4608*x.^2 + 2304*x - 512;

xs = linspace(1.92, 2.08, 161);
figure (1)
plot(xs, f(xs));
xlabel("x");
ylabel("y");
title("direct");

figure (2)
plot(xs, g(xs));
xlabel("x");
ylabel("y");
title("horner")

% (b)
root = bisection(g, 1.92, 2.08, 1e-6);
fprintf("root is %6.10f\n", root);

% (c)

% (d)
r1 = fsolve(z, 1.9)
r2 = fsolve(f, 1.9)





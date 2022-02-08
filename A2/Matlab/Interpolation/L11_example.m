clear all; close all;
x = [1; 2; 4];
y = [1; 3; 3];
%interpolating polynomial in Newton's form
p = @(x) 1 + 2 * (x - 1) - 2 / 3 * (x - 1) .* (x - 2);

%plot points and polynomial
plot(x, y, 'o', 'MarkerSize', 12)
hold on
xx = linspace(min(x), max(x));
plot(xx, p(xx))

%add new pont
np = [3, 5];
x = [x; np(1)];
y = [y; np(2)];
%new polynomial
p1 = @(x) p(x) - 2 / 3 * (x - 1) .* (x - 2) .* (x - 4);

%plot new point
plot(np(1), np(2), 'r*', 'MarkerSize', 12);
%and polynomial
xx = linspace(min(x), max(x));
plot(xx, p1(xx));
legend('orig points', 'orig polyn.', 'new point', 'new polyn.', 'Location', 'NorthWest');
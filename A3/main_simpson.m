clc;
% input
f = @(x) sin(x) .^ 2;
a = 0;
b = 6*pi;
tol = 1e-10;

% example tut6 exercise7-5.2.2
n_min = (2/45 * (b-a)^5 / tol)^(1/4);
n_min = ceil(n_min);

% calculate
r_expected = quad(f, a, b, 1e-2*tol);
[r1, c1] = simpson(f, a, b, n_min);
error1 = abs(r1 - r_expected);
[r2, ~, c2] = adaptive_simpson(f, a, b, tol, 0, inf, 0);
error2 = abs(r2 - r_expected);
c1 >= 100 * c2;
fplot(f, [a, b]);
fprintf('composite Simpson error: %10d\n', error1);
fprintf('C1: %10d\n', c1);
fprintf('adaptive Simpson error: %10d\n', error2);
fprintf('C2: %10d\n', c2);


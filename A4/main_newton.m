% ------------- (a) ----------------
clear;
% varible number = 2, function number = 2
F = @(x) [x(1)+x(2).*(x(2).*(5-x(2))-2)-13;
            x(1)+x(2).*(x(2).*(1+x(2))-14)-29];
% jacobian([x(1)+x(2).*(x(2).*(5-x(2))-2)-13;
% x(1)+x(2).*(x(2).*(1+x(2))-14)-29]);
J = @(x) [1, - x(2).*(2.*x(2) - 5) - x(2).*(x(2) - 5) - 2;
            1,  x(2).*(2.*x(2) + 1) + x(2).*(x(2) + 1) - 14];
inital_guess = [15; -2];
rNewton = newtonSysEq(F, J, inital_guess, 1e-6);
rSolver = fsolve(F, inital_guess);
fprintf("For system(a): Newton method: x1 = %.6f x2 = %.6f\n", rNewton);
fprintf("For system(a): Matlab solver: x1 = %.6f x2 = %.6f\n", rSolver);

% ------------- (b) ----------------
clear;
% varible number = 4, function number = 3
% jacobian([x1.^2 + x2.^2 + x3.^2 - 5;
%           x1 + x2 - 1;
%           x1 + x3 - 3]);
F = @(x) [x(1).^2 + x(2).^2 + x(3).^2 - 5;
            x(1) + x(2) - 1;
            x(1) + x(3) - 3];
J = @(x) [2*x(1), 2*x(2), 2*x(3); 1, 1, 0; 1, 0, 1];
inital_guess = [(1+sqrt(3))/2; (1-sqrt(3))/2; sqrt(3)];
rNewton = newtonSysEq(F, J, inital_guess, 1e-6);
rSolver = fsolve(F, inital_guess);
fprintf("For system(b): Newton method: x1 = %.6f x2 = %.6f\n x3 = %.6f\n", rNewton);
fprintf("For system(b): Matlab solver: x1 = %.6f x2 = %.6f\n x3 = %.6f\n", rSolver);

% ------------- (c) ----------------
clear;
% varible number = 4, function number = 4
% jacobian([x1+10*x2;
%           sqrt(5)*(x3 - x4);
%           (x2 - x3).^2;
%           sqrt(10)*(x1 - x4).^2]);
F = @(x) [x(1)+10*x(2);
          sqrt(5)*(x(3) - x(4));
          (x(2) - x(3)).^2;
          sqrt(10)*(x(1) - x(4)).^2];
J = @(x) [
                     1,          10,           0,                       0;
                     0,           0,     5^(1/2),                -5^(1/2);
                     0, 2*x(2) - 2*x(3), 2*x(3) - 2*x(2),                       0;
10^(1/2)*(2*x(1) - 2*x(4)),           0,           0, -10^(1/2)*(2*x(1) - 2*x(4))
];

inital_guess = [1;2;1;1];
rNewton = newtonSysEq(F, J, inital_guess, 1e-6);
rSolver = fsolve(F, inital_guess);
fprintf("For system(c): Newton method: x1 = %.6f x2 = %.6f x3 = %.6f x4 = %.6f\n", rNewton);
fprintf("For system(c): Matlab solver: x1 = %.6f x2 = %.6f x3 = %.6f x4 = %.6f\n", rSolver);

% ------------- (d) ----------------
clear;
% varible number = 2, function number = 2
% jacobian([1e4.*x1.*x2 - 1;
%           exp(1).^-x1 + exp(1).^-x2 - 1.0001]);
F = @(x) [1e4*x(1)*x(2) - 1;
          exp(1)^-x(1) + exp(1)^-x(2) - 1.0001];
J = @(x) [1e4 * x(2), 1e4 * x(1); -exp(1)^-x(1), -exp(1)^-x(2)];
inital_guess = [0; 0];
rNewton = newtonSysEq(F, J, inital_guess, 1e-6);
rSolver = fsolve(F, inital_guess);
fprintf("For system(d): Newton method: x1 = %.6f x2 = %.6f\n", rNewton);
fprintf("For system(d): Matlab solver: x1 = %.6f x2 = %.6f\n", rSolver);

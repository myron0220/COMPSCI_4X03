n = 20;
a = -1; b = 1;
% equally spaced nodes
x = linspace(a,b,n+1);
f = @(x) abs(x);

cs = newton(x,f(x))
xx = linspace(a, b, 41);
vals = hornerN(xx, x, cs)

plot(xx, f(xx), xx, vals);
legend('f(x)', 'p(x)');


% for test
% xs = [1;2;4;3];
% ys = [1;3;3;5];
% f = @(x) 1 + 2*(x-1) - 2/3*(x-1)*(x-2) - 2/3*(x-1)*(x-2)*(x-4)
% f(1/2)
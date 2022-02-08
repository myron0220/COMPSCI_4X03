clc;
clear;

%derivative of f
df = @(x) exp(x) + x.*exp(x);

f = @(x) x .* exp(x);
g_1 = @(x, h) (f(x+h) - f(x)) ./ h;
g_2 = @(x, h) (f(x+h) - f(x-h)) ./ (2*h);
error1 = @(x0, h) abs(df(x0) - g_1(x0, h));
error2 = @(x0, h) abs(df(x0) - g_2(x0, h));

k = 1:1:16;
x0 = ones(size(k));
h = 10 .^ (-k);
error1 = error1(x0, h);
error2 = error2(x0, h);

loglog(h,error1);
hold on;
loglog(h,error2);
legend('error1 = abs(f(x0) - g_1(x0, h))', 'error2 = abs(f(x0) - g_2(x0, h))');
xlabel('h');
ylabel('error');

[min_error1,min_ind] = min(error1);
corresponding_h_error1 = h(min_ind);
fprintf('The minimum error1 is %e, which can be achieved by h = %e.\n', min_error1, corresponding_h_error1);

[min_error2,min_ind] = min(error2);
corresponding_h_error2 = h(min_ind);
fprintf('The minimum error2 is %e, which can be achieved by h = %e.\n', min_error2, corresponding_h_error2);


x = [-20; -15; -10; -5; -1; 1; 5; 10; 15; 20];
n = length(x);
approx1 = zeros(n, 1);
approx2 = zeros(n, 1);
approx3 = zeros(n, 1);
accurate = exp(x);

for i = 1:length(x)
    approx1(i) = expsum1(x(i));
    approx2(i) = expsum2(x(i));
    approx3(i) = expsum3(x(i));
end;

f = fopen("expsum.out", "w");
print_errors(f, "expsum1", x, accurate, approx1);
print_errors(1, "expsum1", x, accurate, approx1);

print_errors(f, "expsum2", x, accurate, approx2);
print_errors(1, "expsum2", x, accurate, approx2);

print_errors(f, "expsum3", x, accurate, approx3);
print_errors(1, "expsum3", x, accurate, approx3);
fclose(f);


function approx = expsum1(x)
approx = 1;
term = x;
n = 1;
while approx + term ~= approx
    approx = approx + term;
    n = n + 1;
    term = term * x / n;
end
end

function [approx] = expsum2(x)
if x < 0, approx = 1 / expsum1(-x);
else approx = expsum1(x);
end
end

function [approx] = expsum3(x)
approx = 1;
n = 1;
term = x;
sum_pos = 1;
sum_neg = 0;

while approx + term ~= approx
    if term < 0 sum_neg = sum_neg + term;
    else sum_pos = sum_pos + term;
    end
    approx = sum_pos + sum_neg;
    n = n + 1;
    term = term * x / n;
end
 end

function print_errors(file, msg, x, accurate, approx)

absError = abs(accurate-approx);
relError = absError./abs(accurate);

fprintf(file, "%s \n", msg);
fprintf(file, "   x        accurate              approx.          abs. error    rel. error\n");
fprintf(file, ' %5.1f   %14.12e   %14.12e    % 9.2e    % 9.2e\n', ...
    [x'; accurate'; approx'; absError'; relError']);
fprintf(file, "\n");
end

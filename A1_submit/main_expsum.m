xs = [-20,-15,-5,-1,1,5,15,20];

% expsum1 results
fprintf('expsum1 result\n');
fprintf('   x     accurate value       approx.value     abs.error rel.error\n');
for i = 1:length(xs)
    x = xs(i);
    accurate_value = exp(x);
    approximate_value = expsum1(x);
    abs_error = abs(approximate_value - accurate_value);
    rel_error = abs_error / abs(accurate_value);
    fprintf("%5.1f  %.12e  %.12e  %.2e  %.2e \n", x, accurate_value, approximate_value, abs_error, rel_error);
end
fprintf("\n");

% expsum2 results
fprintf('expsum2 result\n');
fprintf('   x     accurate value       approx.value     abs.error rel.error\n');
for i = 1:length(xs)
    x = xs(i);
    accurate_value = exp(x);
    approximate_value = expsum2(x);
    abs_error = abs(approximate_value - accurate_value);
    rel_error = abs_error / abs(accurate_value);
    fprintf("%5.1f  %.12e  %.12e  %.2e  %.2e \n", x, accurate_value, approximate_value, abs_error, rel_error);
    
end
fprintf("\n");

% expsum3 results
fprintf('expsum3 result\n');
fprintf('   x     accurate value       approx.value     abs.error rel.error\n');
for i = 1:length(xs)
    x = xs(i);
    accurate_value = exp(x);
    approximate_value = expsum3(x);
    abs_error = abs(approximate_value - accurate_value);
    rel_error = abs_error / abs(accurate_value);
    fprintf("%5.1f  %.12e  %.12e  %.2e  %.2e \n", x, accurate_value, approximate_value, abs_error, rel_error);
    
end
fprintf("\n");

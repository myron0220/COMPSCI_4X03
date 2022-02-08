i = 1:1:10000;
input = 1 ./ i;

acc_value = accSum(input);

dec_value = decSum(input);
dec_error = abs(dec_value - acc_value);

inc_value = incSum(input);
inc_error = abs(inc_value - acc_value);

kahan_value = kahanSum(input);
kahan_error = abs(kahan_value - acc_value);


fprintf('decreasing order      %.4e\n', dec_error);
fprintf('increasing order      %.4e\n', inc_error);
fprintf('Kahan''s sum           %.4e\n', kahan_error);

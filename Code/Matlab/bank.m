a = exp(1.0)-1;  
for i = 1:25
    a = i * a - 1;
end
fprintf('%e\n', a);

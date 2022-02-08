clc
a = -1.10714946411818e+17;
b = -8.039634349988262e-01;
c = 1.107149464118181e+17;
fprintf('%e\n', a+b+c)
fprintf('%e\n', (a+b)+c)
fprintf('%e\n', a+(b+c))
fprintf('%e\n', (a+c)+b)
fprintf('%e\n', a+(c+b))

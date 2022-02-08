clear all;
x = [1; 2; 4];
y = [1; 3; 3];

A = [x.^0 x.^1 x.^2];
c = A\y;
p = @(x) c(1) + c(2)*x +c(3)*x.^2;

xx = [1:0.1:4];


figure
plot(x,y, 'o')
hold on
plot(xx,p(xx))


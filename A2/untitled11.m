clear all; close all
n = 6;
%n = 7;
degree = 4;
a = 0; b = 1;
x = linspace(a,b,n+1);
y = cos(x);
p = polyfit(x,y, degree);
xx = linspace(a,b,1000);
error = abs(cos(xx)- polyval(p,xx));
h  = (b-a)/degree;
error_bound =  1/(4*(degree+1))*h^(degree+1)
ons = ones(length(xx),1);

semilogy(xx, error, xx,error_bound*ons, xx, 1e-7*ons)
legend('error', 'error bound', '1e-7',"Location","southeast")
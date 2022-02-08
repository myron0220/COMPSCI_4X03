
clear all; close all;
x0 = -0.5; n = 100;
x(1) = x0;
for n =0:n
    x(n+2) = 2^(n+1)*(sqrt(1+2^(-n)*x(n+1))-1);
end
semilogy([1:length(x)], abs(x-log(x0+1)))

for n =0:n
    x(n+2) = 2*x(n+1)/(sqrt(1+2^(-n)*x(n+1))+1);
end
hold on
semilogy([1:length(x)], abs(x-log(x0+1)));
legend('error in $x_{n+1} = 2^{n+1}\left(\sqrt{1+2^{-n}x_n}-1\right)$',...
    'error in $x_{n+1}  = 2 {x_n}/({\sqrt{1+2^{-n}x_n}+1})$',...
    'interpreter','latex', 'Location', 'NorthWest')
  xlabel('n')
  ylabel('error')
set(gca, 'FontSize', 12);
print('-depsc2', 'p64e23.eps')


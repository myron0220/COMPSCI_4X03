function plot_prod_points(n)
%Given n+1 points, x0, x1, ..., xn in the interval [-1,1]
%plot the product |(s-x0)(s-x1)...(s-xn)| for s varying
%in [-1,1]
% We plot for uniformly spaced points and Chebyshev nodes

clf;

%Chebyshev nodes
i = [0:n]';
xch = cos((2*i+1)./(2 * n + 2)*pi);

%uniformly spaced nodes
xun = linspace(-1, 1, n+1);

%select s at spacing 0.01
s = -1:0.0051:1;

semilogy(s, prod_points(s, xun), s, prod_points(s, xch), s, 2.^(-n)*ones(length(s)), 'k--')
legend('uniform points', 'Chebyshev points', '2^{-n}')
title('|(s-x_0)(s-x_1)...(s-x_n)|');
xlabel('s')
set(gca,'FontSize', 14);

    function p = prod_points(s, x)
        for i = 1:length(s)
            p(i) = abs(prod(s(i) - x));
        end
    end
end
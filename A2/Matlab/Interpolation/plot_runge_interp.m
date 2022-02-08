function plot_runge_interp(num_points, mode)
% Plots interpolation of Runge's function on [-1,1]
% num_points is the number of points
% mode = 1 uniform nodes, polynomial interpolation
% mode = 2 Chebyshev nodes, polynomial interpolation
% mode = 3 uniform nodes, spline interpolation

clf

Runge = @(x) 1 ./ (1 + 25 * x .* x);
n = num_points - 1; % degree of polynomial
a = -1; b = 1; % interval

if mode == 1 || mode == 3
    x = linspace(a, b, num_points);
else
   if mode == 2
    i = [0:n]';
    x = cos((2 * i + 1)./(2 * n + 2)*pi);
   end
end

xx = a:0.01:b;

y = Runge(x); % evaluate the function at x
if mode == 1 || mode == 2
    p = polyfit(x, y, n);
    yy = polyval(p, xx);
else
    yy = spline(x,y, xx);
end
    
%evaluate the polynomial at points spaced at 0.01



plot(x, y, 'go', xx, yy, 'b', xx, Runge(xx), 'm');  
legend('data points', 'polyn. interp.', '1/(1+25x^2)');
if mode == 1 
    title(sprintf('Runge function, polynomial interpolation,  %d uniformly spaced points', num_points));
end
if mode == 2
    title(sprintf('Runge function, polynomial interpolation, %d Chebyshev points', num_points));
end
if mode == 3
    title(sprintf('Runge function, spline interpolation %d uniformly spaced points', num_points));
end

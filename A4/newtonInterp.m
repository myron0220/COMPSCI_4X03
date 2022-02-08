function y = newton_interp(xs,ys,x)
% assume xs and ys are column vectors with the same size.
% return a y that is the interpolation result based on input x.
n = length(xs);
a(1) = ys(1);
for k = 1 : n - 1
   d(k, 1) = (ys(k+1) - ys(k))/(xs(k+1) - xs(k));
end
for j = 2 : n - 1
   for k = 1 : n - j
      d(k, j) = (d(k+1, j - 1) - d(k, j - 1))/(xs(k+j) - xs(k));
   end
end
for j = 2 : n
   a(j) = d(1, j-1);
end
Df(1) = 1;
c(1) = a(1);
for j = 2 : n
   Df(j)=(x - xs(j-1)) .* Df(j-1);
   c(j) = a(j) .* Df(j);
end
y=sum(c);
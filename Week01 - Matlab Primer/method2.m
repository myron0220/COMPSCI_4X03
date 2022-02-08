function y = method2(h,x,K)
y = zeros(1,3);
for n = 1:3
    y(n) = h'*x((n+1):(n+K));
end
end
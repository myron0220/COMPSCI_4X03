function y = method1(h,x,K)
y = zeros(1,3);
for n = 1:3
    for k = 1:K
        y(n) = y(n)+h(k)*x(n+k);
    end
end
end
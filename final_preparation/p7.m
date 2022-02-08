A = [1,0,0;2,3,0;4,5,6];
b = [1;2;3];
[n, ~] = size(A);
x = zeros([3, 1]);
for k = 1 : n
    for i = k+1 : n
        mik = A(i,k) / A(k, k)
        b(i) = b(i) - mik * b(k)
    end
end
for k = 1 : n
    x(k) = b(k) / A(k, k);
end


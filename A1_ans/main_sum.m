n = 10000;
N = [1:n];
A  = 1./N;

accurate = sum(1./vpa(N));

fprintf('decreasing order %.4e\n', abs(accurate-sum_inorder(A)));
fprintf('increasing  order %.4e\n', abs(accurate-sum_inorder(fliplr(A))));
fprintf('Kahan''s sum       %.4e\n', abs(accurate-sumkahan(A)));


function sum = sum_inorder( A )
sum = 0;
for i=1:length(A)
    sum = sum+A(i);
end
end


function sum = sumkahan( A )
n = length(A);
sum = 0;
c = 0;
for i=1:n
    y = A(i)-c;
    t = sum+y;
    c = (t-sum)-y;
    sum = t;
end
end

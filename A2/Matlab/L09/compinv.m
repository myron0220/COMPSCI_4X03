function Ainv = compinv(A)
% Computes the inverse of A 
% We assume A is square and nonsingular

% For column i of the inverse, Ainv(:,i), solve A*Ainv(:,i) = e
% where e is the i-th unit vector
[n,~] = size(A);
e = zeros(n,1);
for i = 1:n
   e(i) = 1;
   Ainv(:,i) = A\e; 
   e(i) = 0;
end
end
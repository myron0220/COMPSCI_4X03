function Ainv = compinvLU(A)
% Computes the inverse of A using its LU decomposition.
% We assume A is square and nonsingular

% Perform the LU factorization of A
[L,U,P] = lu(A);  % P*A = L*U
% For column i of the inverse, A(:,i), solve
% A*x = e,  where e is the ith unit vector
% Since P*A = L*U, P*A*x = P*e, L*U*x = P*e. 
% Solve L*y = P*e for y and then solve U*x = y for x
[n,~] = size(A);
e = zeros(n,1);
for i = 1:n
   e(i) = 1;
   y = L\(P*e);       % solve  L*y = P*e
   Ainv(:,i) = U\y;   % solve  U*Ainv(:,i) = y
   e(i) = 0;
end
end
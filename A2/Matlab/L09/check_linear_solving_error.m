function [rel_error, condA, rel_residual] = check_linear_solving_error(A)
% Check the error in solving A*x = b
% A is an nxn matrix
% Set x = ones(n,1) and b = A*x 
% x is accurate solution to A*x = b
% Solve A*y = b and return 
% relative solution error, cond(A), and relative residual

[n, ~] = size(A);
x = ones(n,1);
b = A*x;
%x is an accurate solution to A*x = b;
%solve A*y = b
y = A\b;
rel_error = norm(x-y)/norm(x);
residual = b-A*y;
condA = cond(A);
rel_residual = norm(residual)/norm(b);
end
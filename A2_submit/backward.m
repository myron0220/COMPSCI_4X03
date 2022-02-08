function x = backward(B, b, ipivot)
    % To solve Ax = b, we write first P*A*x = L*U*x = L*y = P*b. 
    % Solve L*y = P*b for y and then U*x = y for x
    [n, ~] = size(B);
    L = tril(B, -1) + eye(size(B));
    U = triu(B, 0);
    y = L\b(ipivot(1:n)); 
    x = U\y; 
end
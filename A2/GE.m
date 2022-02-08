function B = GE(A)
    [n, ~] = size(A);
    L = eye(n);
    for k = 1:n - 1
        M = eye(n);
        % for j=k+1:n
        j = k + 1:n;
        % lj,k = A(j, k) ./ A(k, k);
        M(j, k) = - A(j, k) ./ A(k, k);
        M_inv = -tril(M, -1) + eye(n);
        A = M * A;
        L = L * M_inv;
    end
    U = A;
    B = tril(L, -1) + triu(U, 0);
end

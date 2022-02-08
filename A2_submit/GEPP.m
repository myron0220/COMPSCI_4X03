function [B, ipivot] = GEPP(A)
    [n, ~] = size(A);
    P = 1:n;
    L = eye(n);
    for k = 1:n - 1
        M = eye(n);
        % pick max row
        [~, max_ind] = max(abs(A(P(k:n),k)));
        % fake swap
        P_col = 1:n;
        P_col(k) = max_ind + k - 1;
        P_col(max_ind + k - 1) = k;        
        temp = P(k);
        P(k) = P(max_ind + k - 1);
        P(max_ind + k - 1) = temp;
        % for j=k+1:n
        j = k + 1:n;
        % lj,k = A(j, k) ./ A(k, k);
        M(j, k) = - A(P(j), k) ./ A(P(k), k);
        A(P(1:n), :) = M * A(P(1:n), :);
        L = L * inv(M(:, P_col(1:n)));
    end
    L = L(P(1:n), :);
    U = A(P(1:n), :);
    B = tril(L, -1) + triu(U, 0);
    ipivot = P;
end
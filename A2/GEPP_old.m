function [B, ipivot] = GEPP(A)
    [n, ~] = size(A);
    P = 1:n;
    L = eye(n);
    % ------ for test ---------
%     org_A = A(P(1:n), :)
    % ------ for test ---------
    for k = 1:n - 1
        M = eye(n);
        % pick max row
        [~, max_ind] = max(abs(A(P(k:n),k)));
        % ------ for test ---------
%         A(P(1:n), :)
        % ------ for test ---------
        % swap
        % N for recording swap
%         N = eye(n);
%         temp2 = N(P(k),:);
%         N(P(k),:) = N(P(max_ind + k - 1),:);
%         N(P(max_ind + k - 1),:) = temp2;

        temp = P(k);
        P(k) = P(max_ind + k - 1);
        P(max_ind + k - 1) = temp;

        % for j=k+1:n
        % ------ for test ---------
%         A(P(1:n), :)
        % ------ for test ---------
        j = k + 1:n;
        % lj,k = A(j, k) ./ A(k, k);
        M(j, k) = - A(P(j), k) ./ A(P(k), k);
%         M
        M_inv = -tril(M, -1) + eye(n);
%         M_inv = -tril(M, -1) + eye(n);
        %                  A1
        A(P(1:n), :) = M * A(P(1:n), :);
        L = L * M_inv;
    end
    % ------ for test ---------
%       final_A = A(P(1:n), :)
    % ------ for test ---------
    U = A(P(1:n), :);
%     U
    B = tril(L, -1) + triu(U, 0);
    ipivot = P;
end
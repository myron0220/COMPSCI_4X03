function A = gauss_elim_vectorized(A)
    [n, ~] = size(A);

    for k = 1:n - 1
        % for i=k+1:n
        i = k + 1:n;
        m = A(i, k) ./ A(k, k);
        % for j=k+1:n
        j = k:n;
        A(i, j) = A(i, j) - m * A(k, j);
        % end
        %  end
       % A(k + 1:n, k) = 0;

    end

clear;clc;
n = 200;
m = 5;
fprintf('      A div b       no pivioting              pivoting           cond(A)\n')
for i = 1:m
    A = rand(n, n);
    x = ones(n, 1);
    b = A * x;
    
    % matlab
    x_matlab = A \ b;
    
    % GE
    B = GE(A);
    x_GE = backward(B, b, 1:n);
    
    % GEPP
    [B, ipivot] = GEPP(A);
    x_GEPP = backward(B, b, ipivot);
    
    % calculate and plot
    rel_err_matlab = norm(x_matlab - x)/norm(x);
    rel_err_no_p = norm(x_GE - x)/norm(x);
    rel_err_p = norm(x_GEPP - x)/norm(x);
    condA = cond(A);
    fprintf('%d     %.2e      %.2e                  %.2e           %.2e\n', ...
        i, rel_err_matlab, rel_err_no_p, rel_err_p, condA);
end







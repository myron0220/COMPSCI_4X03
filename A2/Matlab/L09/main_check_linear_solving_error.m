clear all
n = 12; 
A = hilb(n); %nxn Hilber matrix
[rel_error, condA, rel_residual] = check_linear_solving_error(A);

fprintf("\ncond(A)              = %.1e\n", condA);
fprintf("relative residual  = %.1e \n", rel_residual);
fprintf("digits lost\n <~ log10(condA) = %.1f \n", log10(condA));
fprintf("||x-y||/||x||         = % .1e <=  cond(A)*||r||/||b|| = % .1e\n", ...
    rel_error, condA*rel_residual)
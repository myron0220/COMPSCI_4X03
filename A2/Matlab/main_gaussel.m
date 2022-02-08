clear all;
A1 = [1 -1 3; 0 2 -3; 0 0 -6.5];
gauss_elim(A1)

A2 = [ 1 2 4 5; 1 1 0 0 ; 2 0 1 0 ; 3 0 0 1]
B = gauss_elim(A2)

A3 = [ 1 0 0 3; 0 1 0 2; 0 0 1 1; 5 4 2 1];
B = gauss_elim(A3)

%time gauss_elim and gauss_elim_vectorized
n  = 500;
A4 = rand(n,n);
tic;
B = gauss_elim(A4);
time_gauss_elim = toc;

tic;
B = gauss_elim_vectorized(A4);
time_gauss_elim_vectorized = toc;

fprintf("time gauss_elim                         %.1e\n", time_gauss_elim);
fprintf("time gauss_elim_vectorized      %.1e\n", time_gauss_elim_vectorized);


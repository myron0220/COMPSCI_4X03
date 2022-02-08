% Time compinv and compinvLU

N = [100 200 400 600];
fprintf("    n       no LU           LU        Matlab inv \n")
for i = 1:length(N)
    n = N(i);
    A = rand(n,n);
    tic; 
    A1 = compinv(A);
    time1(i) = toc;
    
    tic; 
    A2 = compinvLU(A);
    time2(i) = toc;
    
    tic; 
    A3 = inv(A);
    time3(i) = toc;
     
    fprintf(" %5d   %.2e    %.2e   %.2e\n", n, time1(i), time2(i), time3(i))
end


    
    
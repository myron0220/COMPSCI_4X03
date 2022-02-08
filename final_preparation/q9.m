f = @(n) pi^5/180 * 1/(n-1)^4;
for k = 2 : 10000
 if (abs(f(k)) <= 1e-6)
     break;
 end
end
k

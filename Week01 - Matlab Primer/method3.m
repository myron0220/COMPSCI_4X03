function y = method3(h,x,K)
X = [x(2:K+1),x(3:K+2),x(4:K+3)];
y = h'*X;
end
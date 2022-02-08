fprintf("matlab\n")
A = [2 4 -2; 1 3 4; 5 2 0];
b = [6 -1 2]';
x = A\b
fprintf("\n")

fprintf("GEPP\n")
A = [2 4 -2; 1 3 4; 5 2 0];
b = [6 -1 2]';
[B, ipivot] = GEPP(A)
backward(B, b, ipivot)


fprintf("GE\n")
A = [2 4 -2; 1 3 4; 5 2 0];
b = [6 -1 2]';
B = GE(A)
backward(B, b, 1:size(B,1))

% M1 = [1,0,0;-0.2,1,0;-0.4,0,1]
% M2 = [1,0,0;0,1,0;0,-0.8125,1]
% L = inv(M1) * inv(M2)
% final_A = [5,2,0;0,3.2,-2;0,0,5.625]
% LtimesU = L * final_A
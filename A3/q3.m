A = [1 0 0 0; 0 1 0 0; 0 0 1 0; 0 0 0 1; 1 -1 0 0; 1 0 -1 0; 1 0 0 -1; 
     0 1 -1 0; 0 1 0 -1; 0 0 1 -1];
b = [2.95;1.74;-1.45;1.32;1.23;4.45;1.61;3.21;0.45;-2.75];
x = A \ b;
fprintf('x1 = %6f\n', x(1));
fprintf('x2 = %6f\n', x(2));
fprintf('x3 = %6f\n', x(3));
fprintf('x4 = %6f\n', x(4));
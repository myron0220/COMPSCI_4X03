T = readtable('nbody.dat');
T = T{:,:};


[m, n] = size(T);
fprintf('              a            b           c          d          e\n');

for s = 2 : 3 : n-2
    x = T(:, s);
    y = T(:, s+1);
    z = T(:, s+2);
    A = [y.^2, x.*y, x, y, ones(m, 1)];
    bb = x.^2;
    res = A \ bb;
    a = res(1);
    b = res(2);
    c = res(3);
    d = res(4);
    e = res(5);

    switch s
        case 2
            fprintf('Jupiter  %10f  %10f  %10f  %10f  %10f\n', a, b, c, d, e);
        case 5
            fprintf('Saturn   %10f  %10f  %10f  %10f  %10f\n', a, b, c, d, e);
        case 8
            fprintf('Uranus   %10f  %10f  %10f  %10f  %10f\n', a, b, c, d, e);
        case 11
            fprintf('Neptune  %10f  %10f  %10f  %10f  %10f\n', a, b, c, d, e);
        case 14
            fprintf('Pluto    %10f  %10f  %10f  %10f  %10f\n', a, b, c, d, e);
    end

%     plot(x,y);
%     hold on;
%     [xs, ys] = meshgrid(min(x)-1:0.1:max(x)+1, min(y)-1:0.1:max(y)+1);
%     contour(xs, ys, a*ys.^2+b*xs.*ys+c*xs+d*ys+e-xs.^2, [0, 0], 'k--', 'LineWidth', 1);
end


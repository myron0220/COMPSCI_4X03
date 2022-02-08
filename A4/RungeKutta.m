function y = RungeKutta(a, b, N, f, y0)
    [num_f, ~] = size(y0);
    y = zeros([num_f, N]);
    h = (b - a) / N;
    
    Y1 = y0;
    Y2 = y0 + h/2 * f(a, Y1);
    Y3 = y0 + h/2 * f(a + h/2, Y2);
    Y4 = y0 + h * f(a + h/2, Y3);
    y(:,1) = y0 + h/6 * (f(a, Y1) + 2*f(a + h/2, Y2) + 2*f(a + h/2, Y3) + f(a + h, Y4));
    for i = 1 : N-1
        ti = a + i * h;
        Y1 = y(:,i);
        Y2 = y(:,i) + h/2 * f(ti, Y1);
        Y3 = y(:,i) + h/2 * f(ti + h/2, Y2);
        Y4 = y(:,i) + h * f(ti + h/2, Y3);
        y(:,i + 1) = y(:,i) + h/6 * (f(ti, Y1) + 2*f(ti + h/2, Y2) + 2*f(ti + h/2, Y3) + f(ti + h, Y4));
    end
end


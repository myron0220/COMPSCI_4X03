function [r, c1] = simpson(f, a, b, n)
% Composite simpson
    % for count
    c1 = 0;
    % for count

    h = (b-a)/n;

    r = 0;
    r = r + feval(f, a);
    r = r + feval(f, b);
    % for count
    c1 = c1 + 2;
    % for count
    for i = 1 : (n/2-1)
%         t_i = a + i*h;
        t_2i = a + (2*i)*h;
        t_2iminus1 = a + (2*i - 1)*h;
        r = r + (2 * feval(f, t_2i) + 4 * feval(f, t_2iminus1));
        % for count
        c1 = c1 + 2;
        % for count
    end
    i = n/2;
    t_2iminus1 = a + (2*i - 1)*h;
    r = r + 4 * feval(f, t_2iminus1);
    % for count
    c1 = c1 + 1;
    % for count
    r = h/3 * r;
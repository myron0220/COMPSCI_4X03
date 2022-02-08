% p5 (a)
hs = [];
e_mids = [];
e_tras = [];
e_sims = [];

f = @(x) exp(1) .^ (- (x.^2));
a = 0;
b = 1;
for i = 1 : 10
    n = 2 ^ i;

    h = (b - a) / n;
    hs = [hs ; h];

    r_mid = 2/sqrt(pi) * midpoint( f, a, b, n );
    r_tra = 2/sqrt(pi) * trapezoid( f, a, b, n );
    [r_sim, ~] = simpson(f, a, b, n);
    r_sim = 2/sqrt(pi) * r_sim;
    e_mid = abs(r_mid - erf(1));
    e_tra = abs(r_tra - erf(1));
    e_sim = abs(r_sim - erf(1));
    e_mids = [e_mids ; e_mid];
    e_tras = [e_tras ; e_tra];
    e_sims = [e_sims ; e_sim];
    loglog(hs, e_mids, 'o');
    hold on;
    loglog(hs, e_tras, '+');
    hold on;
    loglog(hs, e_sims, '*');
    legend('midpoint', 'trapezoid', 'simpson');
    xlabel("log10 (h)");
    ylabel("log10 (error)");
    hold off;
end

% p5 (b)
[m, ~] = size(hs);
A = [ones(m,1), log(hs)];

% estimate for midpoint
b_mid = log(e_mids);
x_mid = A \ b_mid;
c_mid = exp(1) .^ x_mid(1);
k_mid = x_mid(2);
% for test
% hhh = @(h) 3.48e-02 * h .^ 2.00;
% loglog(hs, hhh(hs));
fprintf('midpoint %.2e*h^%.2f\n', c_mid, k_mid);

% estimate for trapezoid
b_tra = log(e_tras);
x_tra = A \ b_tra;
c_tra = exp(1) .^ x_tra(1);
k_tra = x_tra(2);
fprintf('trapezoid %.2e*h^%.2f\n', c_tra, k_tra);

% estimate for simpson
b_sim = log(e_sims);
x_sim = A \ b_sim;
c_sim = exp(1) .^ x_sim(1);
k_sim = x_sim(2);
fprintf('simpson %.2e*h^%.2f\n', c_sim, k_sim);



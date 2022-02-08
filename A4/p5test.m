lambda = 1e9;
y0 = 1;
tspan = [0 0.5];
% opts = odeset('Jacobian',-lambda,'Stats','on');
opts = odeset('Stats','on');
subplot(2,2,1)
tic, ode15s(@(t,y) -lambda*y, tspan, y0, opts), toc
title('ode15s');

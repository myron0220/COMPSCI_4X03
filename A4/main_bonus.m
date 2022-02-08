% translate p6 part 1
tspan0to5 = [0, 5];
tspan = [0, 321.8122];
y0 = [1;0;0;0;0;0;0;0.0057];

% ----------------- (a) -----------------
% solve using ode15s
[t, y] = ode15s(@f, tspan, y0);
[t0to5, y0to5] = ode15s(@f, tspan0to5, y0);

% plot
subplot(4,2,1);
plot(t0to5, y0to5(:,1));
title("y(1) on [0,5]");

subplot(4,2,2);
plot(t0to5, y0to5(:,2));
title("y(2) on [0,5]");

subplot(4,2,3);
plot(t0to5, y0to5(:,3));
title("y(3) on [0,5]");

subplot(4,2,4);
plot(t0to5, y0to5(:,4));
title("y(4) on [0,5]");

subplot(4,2,5);
plot(t, y(:,5));
title("y(5)");

subplot(4,2,6);
plot(t, y(:,6));
title("y(6)");

subplot(4,2,7);
plot(t0to5, y0to5(:,7));
title("y(7) on [0,5]");

subplot(4,2,8);
plot(t0to5, y0to5(:,8));
title("y(8) on [0,5]");


% ----------------- (b) -----------------
% general setting
options = odeset('RelTol',1e-6, 'AbsTol', 1e-6, 'Stats', 'off');

fprintf("                                                         number of\n");
fprintf("                      ------------------------------------------------------------------------------------\n");
fprintf("solver    CPU time    steps    failed steps    function evaluations   LU decompositions   nonlinear solves\n");

% ode23s
tic;
[t, y, stats] = ode23s(@f, tspan, y0, options);
time = toc;
fprintf("ode23s    %.4f    %.4e   %.4e    %.4e             %.4e           %.4e\n", time, stats(1), stats(2), stats(3), stats(5), stats(6));

% ode15s
tic;
[t, y, stats] = ode15s(@f, tspan, y0, options);
time = toc;
fprintf("ode15s    %.4f    %.4e   %.4e    %.4e             %.4e           %.4e\n", time, stats(1), stats(2), stats(3), stats(5), stats(6));

% ode45
tic;
[t, y, stats] = ode45(@f, tspan, y0, options);
time = toc;
fprintf("ode45     %.4f    %.4e   %.4e    %.4e             %.4e           ---------\n", time, stats(1), stats(2), stats(3), stats(5));









% translate p6 part 2
function dydt = f(t,y)
  dydt = zeros([8,1]);
  dydt(1) = -1.71*y(1) + 0.43*y(2) + 8.32*y(3) + 0.0007;
  dydt(2) = 1.71*y(1) - 8.75*y(2);
  dydt(3) = -10.03*y(3) + 0.43*y(4) + 0.035*y(5);
  dydt(4) = 8.32*y(2) + 1.71*y(3) - 1.12*y(4);
  dydt(5) = -1.745*y(5) + 0.43*y(6) + 0.43*y(7);
  dydt(6) = -280*y(6)*y(8) + 0.69*y(4) + 1.71*y(5) - 0.43*y(6) + 0.69*y(7);
  dydt(7) = 280*y(6)*y(8) - 1.81*y(7);
  dydt(8) = -280*y(6)*y(8) + 1.81*y(7);
end
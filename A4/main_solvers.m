% translate p4 part 1
% y_1 = u_1
% y_2 = u_1'
% y_3 = u_2
% y_4 = u_2'

tspan = [0 1000];
y0 = [0.994; 0; 0; -2.001585106379082522420537862224];

% general setting
options = odeset('RelTol',1e-10, 'AbsTol', 1e-10, 'Stats', 'off');

fprintf("                                        number of\n");
fprintf("                      ---------------------------------------------\n");
fprintf("solver    CPU time    steps    failed steps    function evaluations\n");

% ode23
tic;
[t, y, stats23] = ode23(@f, tspan, y0, options);
time23 = toc;
fprintf("ode23     %.4f    %.4e   %.4e    %.4e\n", time23, stats23(1), stats23(2), stats23(3));

% ode45
tic;
[t, y, stats45] = ode45(@f, tspan, y0, options);
time45 = toc;
fprintf("ode45     %.4f    %.4e   %.4e    %.4e\n", time45, stats45(1), stats45(2), stats45(3));

% ode78
tic;
[t, y, stats78] = ode78(@f, tspan, y0, options);
time78 = toc;
fprintf("ode78     %.4f    %.4e   %.4e    %.4e\n", time78, stats78(1), stats78(2), stats78(3));

% ode89
tic;
[t, y, stats89] = ode89(@f, tspan, y0, options);
time89 = toc;
fprintf("ode89     %.4f    %.4e   %.4e    %.4e\n", time89, stats89(1), stats89(2), stats89(3));

% ode113
tic;
[t, y, stats113] = ode113(@f, tspan, y0, options);
time113 = toc;
fprintf("ode113    %.4f    %.4e   %.4e    %.4e\n", time113, stats113(1), stats113(2), stats113(3));

% for plot test
% plot(y(:,1), y(:,3));
% xlabel('u1');
% ylabel('u2');

% translate p4 part 2
% y_1 = u_1
% y_2 = u_1'
% y_3 = u_2
% y_4 = u_2'
function dydt = f(t,y)
  dydt = zeros([4,1]);
  mu = 0.012277471;
  mu_ = 1 - mu;
  dominator1 = - (mu_) / ((y(1) + mu)^2 + y(3)^2)^1.5;
  dominator2 = - (mu) / ((y(1) - mu_)^2 + y(3)^2)^1.5;
  dydt(1) = y(2);
  dydt(2) = y(1) + 2*y(4) + dominator1 * (y(1) + mu) + dominator2 * (y(1) - mu_);
  dydt(3) = y(4);
  dydt(4) = y(3) - 2*y(2) + dominator1 * y(3) + dominator2 * y(3);
end






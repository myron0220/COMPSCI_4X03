% translate p4 part 1
% y_1 = u_1
% y_2 = u_1'
% y_3 = u_2
% y_4 = u_2'
y0 = [0.994; 0; 0; -2.001585106379082522420537862224];

a = 0;
b = 17.1;

% plot four figures
clf;

figure (1);
stepsize = 100;
y = RungeKutta(a, b, stepsize, @f, y0);
u1s = y(1, :);
u2s = y(3, :);
plot(u1s, u2s);
title("stepsize = 100")

figure (2);
stepsize = 1000;
y = RungeKutta(a, b, stepsize, @f, y0);
u1s = y(1, :);
u2s = y(3, :);
plot(u1s, u2s);
title("stepsize = 1000")

figure (3);
stepsize = 10000;
y = RungeKutta(a, b, stepsize, @f, y0);
u1s = y(1, :);
u2s = y(3, :);
plot(u1s, u2s);
title("stepsize = 10000")

figure (4);
stepsize = 20000;
y = RungeKutta(a, b, stepsize, @f, y0);
u1s = y(1, :);
u2s = y(3, :);
plot(u1s, u2s);
title("stepsize = 20000")

% for test
% figure (5);
% tspan = [a, b];
% options = odeset('RelTol',1e-10, 'AbsTol', 1e-10);
% [t, y] = ode23(@f, tspan, y0, options);
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
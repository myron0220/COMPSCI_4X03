% translate p8 part 1
% y_1 = S
% y_2 = I
% y_3 = R
tspan = [0, 200];
y0 = [999; 1; 0];

% R0S0 = 0.9
[t, y] = ode45(@f1, tspan, y0);
figure (1)
plot(t, y(:,1));
hold on;
plot(t, y(:,2));
hold on;
plot(t, y(:,3));
xlabel('t');
ylabel('S, I, R');
legend("S", "I", "R");
title("R0S0 = 0.9")

% R0S0 = 1
[t, y] = ode45(@f2, tspan, y0);
figure (2)
plot(t, y(:,1));
hold on;
plot(t, y(:,2));
hold on;
plot(t, y(:,3));
xlabel('t');
ylabel('S, I, R');
legend("S", "I", "R");
title("R0S0 = 1")

% R0S0 = 3
[t, y] = ode45(@f3, tspan, y0);
figure (3)
plot(t, y(:,1));
hold on;
plot(t, y(:,2));
hold on;
plot(t, y(:,3));
xlabel('t');
ylabel('S, I, R');
legend("S", "I", "R");
title("R0S0 = 3")

% R0S0 = 5
[t, y] = ode45(@f4, tspan, y0);
figure (4)
plot(t, y(:,1));
hold on;
plot(t, y(:,2));
hold on;
plot(t, y(:,3));
xlabel('t');
ylabel('S, I, R');
legend("S", "I", "R");
title("R0S0 = 5")

% translate p8 part 2
% y_1 = S
% y_2 = I
% y_3 = R
function dydt = f1(t,y)
  dydt = zeros([3,1]);
  gamma = 1/14;
  % try multiple values for e
  % beta = e / (14*999);
  beta = 0.9 / (14*999);
  dydt(1) = -beta * y(1) * y(2);
  dydt(2) = beta * y(1) * y(2) - gamma * y(2);
  dydt(3) = gamma * y(2);
end

function dydt = f2(t,y)
  dydt = zeros([3,1]);
  gamma = 1/14;
  % try multiple values for e
  % beta = e / (14*999);
  beta = 1 / (14*999);
  dydt(1) = -beta * y(1) * y(2);
  dydt(2) = beta * y(1) * y(2) - gamma * y(2);
  dydt(3) = gamma * y(2);
end

function dydt = f3(t,y)
  dydt = zeros([3,1]);
  gamma = 1/14;
  % try multiple values for e
  % beta = e / (14*999);
  beta = 3 / (14*999);
  dydt(1) = -beta * y(1) * y(2);
  dydt(2) = beta * y(1) * y(2) - gamma * y(2);
  dydt(3) = gamma * y(2);
end

function dydt = f4(t,y)
  dydt = zeros([3,1]);
  gamma = 1/14;
  % try multiple values for e
  % beta = e / (14*999);
  beta = 5 / (14*999);
  dydt(1) = -beta * y(1) * y(2);
  dydt(2) = beta * y(1) * y(2) - gamma * y(2);
  dydt(3) = gamma * y(2);
end
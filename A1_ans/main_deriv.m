

clear; close all;

f = @(x) x.*exp(x);
%derivative of f
df = @(x) exp(x) + x.*exp(x);

% Generate an array with h's
n = 16;
powers = [1:n];
h = 10.^(-powers);

%accurate values
x = 1;
accurate = df(x);
 
% If we approximate using (f(x+h)-f(x))/h
approx1 = (f(x+h)-f(x))./h;
  
% the error is 
errors1 = abs(accurate-approx1);

% If we approximate using (f(x+h)-f(x-h))/2h
approx2 = (f(x+h)-f(x-h))./(2*h);
  
% the error is 
errors2 = abs(accurate-approx2);


% Plot the errors
loglog(h, errors1, '--*r')
hold on
loglog(h, errors2, '--ob')
legend('first order', 'second order')
xlabel('h');

% The minimum is achieved at 
[~, i] = min(errors1);
h1 = h(i)

[~, i] = min(errors2);
h2 = h(i)

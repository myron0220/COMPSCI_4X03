% print

% q2_cal(1.490116119384766e-09);

% q2_cal(0.5*sqrt(eps_machine));
% q2_cal(0.01*sqrt(eps(1)));

sqrt_eps_machine = sqrt(eps(1))
fprintf(['\x03B5            |x_1 - 1|   |x_2 - \x03B5|/\x03B5 ' ...
     '     cond(A)\n']);
q2_cal(0.001*sqrt(eps_machine));
q2_cal(0.01*sqrt(eps_machine));
q2_cal(0.1*sqrt(eps_machine));
q2_cal(1.0*sqrt(eps_machine));




% q2_cal(1.490116119384766e-08);
% q2_cal(1.490116119384766e-07);
% when approaching sqrt(e_mach), we loss about the same precision as the machine epsilon, which means the
% result is not reliable.


% eps1 = sqrt(eps(1));
% epss = [1.490116119384766e-08, 1.490116119384766e-07, 1.490116119384766e-09, 2e-08];

function q2_cal(eps)
    A = [1, 1+eps; 1-eps, 1];
    b = [1+(1+eps)*eps; 1];
    x = A \ b;
    col1 = eps;
    col2 = abs(x(1) - 1);
    col3 = abs(x(2) - eps) / eps;
    col4 = cond(A);
    fprintf('%.2e     %.2e     %.2e       %.2e\n', col1, col2, col3, col4);
end

% function q2_cal(eps)
%     A = [1, 1+eps; 1-eps, 1];
%     b = [1+(1+eps)*eps; 1];
%     x = A \ b;
%     col1 = eps;
%     col2 = x(1);
%     col3 = x(2);
%     col4 = cond(A);
%     fprintf('%.2e     %.2e     %.2e       %.2e\n', col1, col2, col3, col4);
% end




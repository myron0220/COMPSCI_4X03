function p = newtonSysEq(F,J,x0,tol)
% f - (column vector) the functions of the system
% J - (variable number x function number) the Jacobian of the system
% x0 - (column vevtor) initial guess
% tol - tolerance
xk=x0;
xknew=x0-J(x0)\(F(x0));
while norm(xknew-xk)>tol
    xk=xknew;
    xknew=xk-J(xk)\F(xk);
end
p=xknew;
end
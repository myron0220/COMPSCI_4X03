function r = trapezoid( f, a, b, n )
% Composite trapezoid

     h = (b-a)/n;
     
     r = 0.5*(feval(f,a)+feval(f,b));

     for i = 1 : n-1 
        x = a + i*h;
        r = r + feval(f, x);
     end

     r = r*h;
     

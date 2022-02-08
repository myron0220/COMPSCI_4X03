function r = midpoint( f, a, b, n )
% Composite midpoint

     h = (b-a)/n;

     r = 0;     
     for i = 0 : n-1
        x = a + h*(i+0.5);
        r = r + feval( f,  x );
     end

     r = h*r;
     

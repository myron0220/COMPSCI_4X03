function [r, level, c2 ] = adaptive_simpson( f, a, b, tol, level, level_max, c2 )
     global xpoints
     level = level+1;
     h = b-a;
     c = (a+b)/2;
     
     ab = feval(f,a) + feval(f,b);
     cc = feval(f, c);

     one = h*( ab + 4*cc  )/6;

     d = (a+c)/2;
     e = (c+b)/2;
     
     xpoints = unique([xpoints, a, b, c, d, e]);
     two = h*( ab + 4*feval(f,d) + 2*cc + 4*feval(f,e)  )/12;

     
     c2 = c2+5;

     if level >= level_max 
           r = two;
           disp('max level reached');
     else 
           if abs(two-one) <= 15*tol 
               r = two + (two-one)/15;
           else
              [left,  level, c2] = adaptive_simpson( f, a, c, tol/2, level, level_max, c2 );
              [right, level, c2] = adaptive_simpson( f, c, b, tol/2, level, level_max, c2 );           
              r = left + right;
           end
     end

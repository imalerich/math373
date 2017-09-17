function [P F] = muller(f, p0, p1, p2, tol, MaxIter)

iter = 0;

P = [p0 p1 p2];
F = [f(p0) f(p1) f(p2)];

while 1
    iter = iter + 1;
    if iter>MaxIter
        break;
    end
    
    h1 = p1-p0;
    h2 = p2-p1;
    delta1 = (f(p1)-f(p0))/h1;
    delta2 = (f(p2)-f(p1))/h2;
    d = (delta2-delta1)/(h2+h1);
    
    b = delta2+h2*d;
    D = sqrt(b^2-4*f(p2)*d);
    
    if abs(b-D) < abs(b+D)
        E = b+D;
    else
        E = b-D;
    end
    
    h = -2*f(p2)/E;
    p = p2+h;
    
    P = [P p];
    F = [F f(p)];
    
    if abs(h)<tol
        break;
    end
     
    p0= p1;
    p1= p2;
    p2= p;
    
end
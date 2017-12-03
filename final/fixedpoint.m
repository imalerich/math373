function [P G] = fixedpoint(g, p0, tol, MaxIter)

iter = 0;

P = [p0];
G = [g(p0)];

while 1
    iter = iter + 1;
    if iter>MaxIter
        break;
    end
    
    p = g(p0);
    
    P = [P p];
    G = [G g(p0)];
    
    if abs(p-p0)<tol
        break;
    end
    
    p0 = p;
    
end
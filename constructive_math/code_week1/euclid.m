% Use like
% euclid(30, 15)
% euclid(30, 20)
% euclid(30, 7)

function [h] = euclid(a,b)
assert(a == floor(a))
assert(b == floor(b))
assert(a >= b)
oldr = a;
newr = b;
while newr>0
    [q,r]=division(oldr,newr); 
    fprintf('%d = %d x %d + %d\n', oldr, q, newr, r);
    oldr=newr; 
    newr=r; 
end
h=oldr;
end

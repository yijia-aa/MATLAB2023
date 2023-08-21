function r=gcd(a,b)
    if a<b
        c=a;a=b;b=c;
    end
 
    q=floor(a/b);r=a-q*b;
    while r ~= 0
        a=b;b=r;
        q=floor(a/b);r=a-q*b;
    end
    r=b;
end
function lis = n_fibonacci(n)

lis = [];

if n == 1
    lis(1)=1;
elseif n == 2
        lis(1)=1;
        lis(2)=1;
else 
    for i = 3:n
        lis(1)=1;
        lis(2)=1;
        lis(i) = lis(i-2)+lis(i-1);
    end
end

lis;



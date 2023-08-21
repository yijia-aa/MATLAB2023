%% Yijia Chen Balliol Problem Sheet 4
% Q3
n = 0;
tol = 10^(-7);
phi = (1+sqrt(5))/2;
ratio = n_approximation(n, n_fibonacci(n+2)); 
% because F(n) is the (n+1)th Fibonacci number, F(n+1) is the (n+2)th
differ = abs(ratio-phi);
y = [];
y(1) = differ;
z(1) = ratio-phi;
while (differ > tol)
    n = n+1;
    ratio = n_approximation(n, n_fibonacci(n+2));
    differ = abs(ratio-phi);
    y(n+1)=differ;
    z(n+1)=ratio-phi;
end
ratio

% Q4
figure(1), clf
x = linspace(1,n+1,n+1);
plot(x,z,'Marker','*')
xlim([1 n+1])
ylim([-0.7 0.5])
title('Error of approximation')
xlabel('value of n')
ylabel('error')


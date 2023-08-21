% Yijia Chen _ Problem Sheet 1
%% Q1
syms x
fplot(exp(sin(x^2)),[0,2*pi]);
hold on

%% Q2
xlabel('x')
ylabel('y')
title('Yijia Chen, Balliol')

%% Q3
y = @(x) exp(sin(x.^2));
y(0)
y(sqrt(pi))
y(1.473)

%% Q4
a = linspace(0,2*pi,10);
ya = y(a);
plot(a,ya,'g--')

b = linspace(0,2*pi,20);
yb = y(b);
plot(b,yb,'r:')

c = linspace(0,2*pi,500);
yc = y(c);
plot(c,yc,'kx')

%% Q5
legend('y1','y2','y3','y4')

%% Q6

for n = 10:10:80 % for n = 10, 20 ... 80 
    y = 2; % set the value for y
    for i = 1:n % for i = 1, 2, ... n
        y = sqrt(y); % so here the 'for' loop repeatedly takes square root of y for n times
    end
    for i = 1:n
        y = y^2; % this loop takes y to the power of 2 for n times
    end % supposedly we should get back y = 2 in the end
    disp(abs(y-2)); % we check how much the computed answer deviates from the actual value y=2
end

% The more computations we do on y, the greater the truncation error in our end result.

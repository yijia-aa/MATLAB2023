%% Yijia Chen Balliol Problem Sheet 3

%% Q1
syms u(t)
ode = (t+1)^2 * diff(u,t,2)-3*(t+1)*diff(u,t)+t == 1;
d1 = diff(u,t);
y1 = dsolve(ode,u(0)==1,d1(0)==1)
pretty(y1)

%% Q2 
syms v(t)
%% (t+1)^2 * diff(v,t) - 3*(t+1)*v = 1-t

%% Q3
[t,sol] = ode_example;
plot(t,sol(:,1),'b')

title('ode example')
xlabel('t')
ylabel('u')
legend('y-dsolve')


%% Q4
hold on
h = fplot(y1,[0,1],'r*');
title('Yijia Chen Balliol College')
xlabel('t')
ylabel('u')
legend('y-dsolve','y-numerical')

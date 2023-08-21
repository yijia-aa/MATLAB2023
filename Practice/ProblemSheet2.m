%% Yijia Chen Problem Sheet 2
%% Q1
%(a)
syms x
f = 5*x^2+3*x-4;
g = -4*x^2+6*x+5;
h1 = fplot(x,f,[-2,2]);
set(h1,'color','r')
hold on
h2 = fplot(x,g,[-2,2]);
set(h2,'color','b')

%(b)
eqn1 = f == g;
sol = solve(eqn1,x)

%(c)
double(abs(int(g-f,x,sol(1),sol(2))))

%% Q2
%(a)
grid10 = linspace(sol(1),sol(2),10);
newf = g-f;
value10 = subs(newf,x,grid10);
double(trapz(grid10(2)-grid10(1),value10))

%(b)
grid100 = linspace(sol(1),sol(2),100);
value100 = subs(newf,x,grid100);
double(trapz(grid100(2)-grid100(1),value100))

%% Q3
height10 = grid10(2)-grid10(1);
sum10 = 0;
for i = 1:9
    sum10 = sum10 + 1/2*height10*(value10(i)+value10(i+1));
end
disp(double(sum10))

height100 = grid100(2)-grid100(1);
sum100 = 0;
for i = 1:99
    sum100 = sum100 + 1/2*height100*(value100(i)+value100(i+1));
end
disp(double(sum100))









%% Exercise A1

% assign values to constants
h = 0.1;
N = 1500;
r = 1/2;
a = 1/3;

% create zero matrix to store values
S = zeros(1,1500);
I = zeros(1,1500);
R = zeros(1,1500);

% initialise values for I(0), S(0), and R(0)
I(1) = 1e-1; 
S(1) = 1 - I(1);
R(1) = 0;

for n = 1:N-1
    S(n+1) = S(n) - r * S(n) * I(n) * h;
    I(n+1) = r * S(n) * I(n) * h - a * I(n) + I(n);
    R(n+1) = a * I(n) * h + R(n);
end

plot(S,'r');
hold on 
plot(I,'g');
hold on
plot(R,'b');
title('SIR model by explicit Euler scheme');
legend('S','I','R');
xlabel('Number of iterations');
ylabel('Percentage of population');

%for n = 1:N
%    if n == N && S(n)+I(n)+R(n) == 1
%        disp('S+I+R=1 for all n')
%    elseif S(n)+I(n)+R(n) == 1
%        break
%    else 
%        disp('error: S+I+R is not equal to 1')
%    end
%end


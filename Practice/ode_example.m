function [t,sol]=ode_example() % Function name must be the same as filename.
y0=[1;1];                  % Specify initial conditions.
limits=[0,1];             % Input limits of integration. 
[t,sol] = ode45(@my_system,limits,y0); % Command to numerically solve the system 'my_system'
% Plots the first column of sol against t.
end

             

function dU=my_system(t,U) % Name of the system we wish to solve

% dU is an nx1 vector, where n is the number of equations in the system.
dU=zeros(2,1);       

% Below is the system du/dt = a*u - d*u*v, dv/dt = -b*v + c*u*v.
% Note that u and v are given as entries of the 2x1 column vector, U.

dU(1)=U(2);
dU(2)=(1-t+3*(t+1)*U(2))/(t+1)^2;
end
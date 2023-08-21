%% Q3
function [t,sol]=ode_template() 
y0=[1,1];                  
limits=[0,1];            
[t,sol] = ode45(@my_system,limits,y0);
plot(t,sol(:,1))
end

function dU=my_system(t,U) 
dU=zeros(2,1);       

dU(1)=U(2);
dU(2)=(1-t+3*(t+1)*U(2))/(t+1)^2;
end
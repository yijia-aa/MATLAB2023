% This function takes the input of an integer 'n' and ouputs a 1-by-2n 
% array 'y'.
% The kth element in the array y is equal to the value of the integral in
% (4.1) with f(x) = x^k, where k = 0,1, 2, ..., 2n-1, using (4.3)

function y = evaluate_integral(n)

% Initialise an empty array y.
y = zeros(1,2*n);

% Use a 'for' loop to iterate through all even values of k
for i = 0:n-1 % because 0 is the first even number, and 2n-2 is the last
    k = 2*i; % correspond to the case when k is even
    y(k+1) = (factorial(k)*sqrt(pi))/(2^(k)*factorial(k/2)); 
    % we need to index y(k+1) because when y(1) is the case when k = 0
end

% We do not need to calculate the case when k is odd because the integral
% equls 0 and I've already created a 1-by-2n zero array.

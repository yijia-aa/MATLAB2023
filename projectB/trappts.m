% This function takes the input of three integers 'n', 'a,'b' and ouputs 
% two 1-by-n arrays, 'x', the nodes, and 'w', the corresponding weights,
% using the composite trapisium rule.

function [x,w] = trappts(n,a,b)

% Initialise an empty array for the nodes.
x = [];
for j = 1:n
    x(j) = a + (j-1)*(b-a)/(n-1); % assign value to each node
end

% Initialise a array of ones for the weights.
w = ones(1,n);
w = w .* (b-a)/(n-1); % first assign all elements in w the same value
w(1) = (b-a)/(2*(n-1)); % then change w(1) and w(n) to a different value
w(n) = (b-a)/(2*(n-1));

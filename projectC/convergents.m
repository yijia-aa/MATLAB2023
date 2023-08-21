% This function takes in any list a, likely being generated from the 
% funciton 'continued_fraction', and outputs three lists, p_k, q_k, 
% and the convergents r_k = p_k / q_k

function [p,q,r] = convergents(a)

    % Find the length of array a, which should also be the length of p and q. 
    m = length(a);
    % Initialise p and q.
    p = zeros(1, m);
    q = zeros(1, m);
    
    % Assign initial values p_0, q_0, p_1 and q_1.
    p(1) = a(1);
    p(2) = a(1) * a(2) + 1;
    q(1) = 1;
    q(2) = a(2);
    % Due to the indexing convention, p(i) here is actually p_(i-1).
    
    % Calculate p_k and q_k 
    for i = 3:m
        p(i) = a(i)*p(i-1)+p(i-2);
        q(i) = a(i)*q(i-1)+q(i-2);
    end
    
    % Find convergents.
    r = p ./ q;
end


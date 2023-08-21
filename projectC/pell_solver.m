% The function takes in two values, l, the maximum m that I want to try,
% and D, the integer in Pell's Equation.
% It then outputs a tuple (x,y) that is a solution to Pell's equation 
% x^2 - Dy^2 = 1.

% Note that two variables are used instead of one, because we can't make
% sure the pattern repeats within any length... If the initial guess of l 
% does not work, NaN will be the output, which means we have to try a larger
% l. 

function [x,y] = pell_solver(l,D)

    % First, find the array of coefficients
    a = get_cont_frac(sym(sqrt(D)),l);

    % Find the a_m in a that is equal to 2*a_0.
    for i = 2:l+1
        if a(i) == 2 * a(1)
            m = i - 1;
            break
        end
        m = NaN; % If you found m = NaN, then a larger l is needed.
    end

    % Find the convergents, arrays of p_n and q_n.
    [p,q,~] = convergents(a);

    % If m is even, x = p_{m-1} = the mth element in the array of p, and 
    % y = q_{m-1} = the mth element in the array of q.
    if mod(m,2) == 0
        x = p(m);
        y = q(m);
    else 
    % If m is odd, rewrite m as 2*m the values of p and q follows.
        m = 2*m;
        x = p(m);
        y = q(m);
    end

end


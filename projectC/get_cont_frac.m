% The function takes in two values: n, the maximum number of
% iterations / calculate up to a_n; and x, the real number that will be
% written as a continued fraction. 
% It then outputs an array consisting of a_i, i = 0,1,2...n, in (5.1).

function a = get_cont_frac(x,m)

    % Find a_0.
    a = floor(sym(x));
    
    % Note: sym(x) is used and it does not significantly slow down the
    % programme, so it can be kept for small n. 
    
    
    % Find a_1, a_2, ... a_n
    for i = 2:m+1
        x = 1 / (sym(x) - a(i-1)); % change the value of x in each iteration
        if x == Inf
            break
        % If x == Inf, then sym(x) - a(i-1) == 0, which means sym(x) == a(i-1)
        % is an integer. So the continued fraction is finite and should end.
        end
        a(i) = floor(sym(x));
    end
end


% vecnewton(F, J, x0, tol)
% Use like
% vecnewton(@(x) [x(1)^2 - x(2) - 1; x(1) - x(2)^2 + 1], @(x) [2*x(1), -1; 1, -2*x(2)], [1; 1], 1e-6)
% This system has multiple roots. Try using different initial guesses, like [-1; -1], [-1; 1], and [1; -1]

function [x] = vecnewton(F, J, x0, tol)
    x = x0;
    iterations = 0;
    fprintf('Iteration %2d: ||F(x)|| = %f\n', iterations, norm(F(x)));
    while norm(F(x)) > tol
        deltax = -J(x)\F(x);
        x = x + deltax;
        iterations = iterations + 1;
        fprintf('Iteration %2d: ||F(x)|| = %f ||delta x|| = %f\n', iterations, norm(F(x)), norm(deltax));
    end
end

% Use like
% newton(@(x) (x-4)*(x-1)*(x+3), @(x) 3*x^2 - 4*x - 11, 2.352836327, 1e-6)
% and try the slightly different initial guess
% newton(@(x) (x-4)*(x-1)*(x+3), @(x) 3*x^2 - 4*x - 11, 2.352836323, 1e-6)

% To see an example that fails, try
% newton(@(x) x^3 - 2*x + 2, @(x) 3*x^2 - 2, 0, 1e-6)

function[x, iterations] = newton(f, df, x0,tol)
format long;
iterations = 0;
x=x0;
funvalue = f(x);
fprintf('Iteration %2d: x = %f, f(x) = %f\n', iterations, x, funvalue);
while abs(funvalue) > tol
    iterations = iterations + 1;
    x = x - funvalue/df(x);
    funvalue = f(x); 
    fprintf('Iteration %2d: x = %f, f(x) = %f\n', iterations, x, funvalue);
end
end

% Use like
% fixedpt(@(x) (x+1)/x, 1.1, 1e-4)
% for an example that converges well, or
% fixedpt(@(x) sin(x), 0.1, 1e-4)
% for one that does not.

function[x, iterations] = fixedpt(g, x0, tol)
  format long;
  iterations = 0;
  fprintf('Iteration %2d: fixed point = %f\n', iterations, x0);
  xold = x0;
  x = g(xold);
  iterations = iterations+1;
  fprintf('Iteration %2d: fixed point = %f\n', iterations, x);
  while abs(x-xold)>tol
      xold = x;
      x = g(xold);
      iterations = iterations+1;
      fprintf('Iteration %2d: fixed point = %f\n', iterations, x);
  end
end

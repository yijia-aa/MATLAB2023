% Use like
% steffensen(@(x) (x+1)/x, 1.1, 1e-4)
% for an example that converges well, or
% steffensen(@(x) sin(x), 0.1, 1e-4)
% for one that does not.

function[gx, iterations] = steffensen(g, xstart, tol)
  format long;
  iterations = 0;
  fprintf('Iteration %2d: fixed point = %f\n', iterations, xstart);
  x = xstart;
  gx = g(x);
  iterations = iterations + 1;
  while abs(gx - x) > tol
      x0 = x;
      x1 = gx;
      x2 = g(x1);
      iterations = iterations + 1;

      % We wrote it like
      %x = (x0*x2 - x1^2)/(x2 - 2*x1 + x0);
      % in the slides. But the following formula
      % has much better numerical properties
      % in floating-point arithmetic.
      x = x0 - (x1-x0)^2 / (x2 - 2*x1 + x0);
      fprintf('Iteration %2d: fixed point = %f\n', iterations, x);

      gx = g(x);
      iterations = iterations + 1;
  end
end

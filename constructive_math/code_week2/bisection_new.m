% Use like
% bisection_new(@(x) x - cos(x), 0, 1, 1e-4)

function[c, iterations] = bisection_new(f, a, b, tol)
  assert(f(a)*f(b) < 0)
  format long;
  iterations = 0;
  while (abs(b-a))^(iterations) > tol
      iterations = iterations + 1;
      c = (a*f(b)-b*f(a))/(f(b)-f(a));
      fprintf('Iteration %2d: root ≈ %f\n', iterations, c);
    if f(c) == 0
        break
    elseif f(c)*f(a)<0 
        b = c;
    else
        a = c;
    end
  end
end

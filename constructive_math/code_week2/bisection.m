% Use like
% bisection(@(x) x - cos(x), 0, 1, 1e-4)

function[c, iterations] = bisection(f, a, b, tol)
  assert(f(a)*f(b) < 0)
  format long;
  iterations = 0;
  while abs(b-a)/2 > tol 
      iterations = iterations + 1;
      c = (a+b)/2;
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

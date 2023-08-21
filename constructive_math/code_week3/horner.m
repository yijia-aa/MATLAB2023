% Use like
% horner([12 -11 -2 1], 0, 1e-6)

function[x] = horner(a, x0, tol)
% a is a vector of length n+1 containing the coefficients with
% constant term first, the coefficient of the linear term second,
% then quadratic etc. Here n is the polynomial degree.
% x0 is the starting value for the Newton iteration.

x = x0;
n = length(a)-1;
iterations = 0;

while 1
    b=a(n+1);           % compute b_n
    c=b;                % compute c_{n-1}
    b=b*x + a(n);       % compute b_{n-1}
  for r=n-2:-1:0        % steps of -1 down to zero
      c=c*x + b;        % compute c_r
      b=b*x + a(r+1);   % compute b_r
  end
  fprintf('Iteration %2d: x = %f, f(x) = %f\n', iterations, x, b);
  if abs(b)<tol 
      return            % convergence test
  else
      x=x-b/c;  % Newton update
  end
  iterations = iterations + 1;
end

end

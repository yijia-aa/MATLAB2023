% This function takes the input of an integer 'n' and ouputs two 1-by-n 
% arrays, 'x', the nodes, and 'w', the corresponding weights, using the
% Gauss Hermite rule. 

function [x,w] = gausshermite(n)

% Initialise a n-by-n zero matrix T.
T = zeros(n);

% Create the symmetric tridiagonal matrix T
for j = 1:n-1
    T(j,j+1) = sqrt(j/2);
    T(j+1,j) = sqrt(j/2);
end

% Find the eigenvectors, which are the columns of the invertible matrix V,
% and the eigenvalues, which are on the main diagonal of a diagonal 
% matrix D. 
[V,D] = eig(T);

% Normalise each eigen vector so that all of them have modulus 1.
for i = 1:n
    a = 0;
    for k = 1:n
        a = a + V(k,i)^2; % the squre of modulus of the ith eigenvector
    end
    V(:,i) = V(:,i)/sqrt(a); 
end

% Initialise two empty arrays x and w
x = [];
w = [];

% Find the n nodes from eigenvalues and the n weights from the square of
% the first entry of the eigenvectors
for j = 1:n
    x(j) = D(j,j);
    w(j) = (V(1,j))^2 * sqrt(pi);
end


% Note: all numerical values are stored in doubles, as calculations in
% syms take much longer time, rendering the function overly slow for
% Exercise 3.
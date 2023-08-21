%% Project C - continued fractions
% Candidate number: 1075844

%% Exercise C1

% Initialise the command window and clear existing figures.
clear
clf

type get_cont_frac.m
% Use the function to calculate continued fractions for any real number.

% Calculate and display the coefficients in the continued fractions with 
% n = 14 for the given numbers.
a1 = get_cont_frac(exp(1),14)
a2 = get_cont_frac(pi,14)
a3 = get_cont_frac((1+sqrt(5))/2,14)
a4 = get_cont_frac(sqrt(2),14)
a5 = get_cont_frac(3.0578,14)


%% Exercise C2

type convergents.m

% Calculate and display convergents for each of the numbers in C1.
% Only the ratio r_k = p_k / q_k is needed. But for the 3rd number, phi, 
% the list of q_n is required for part C3. 
[~,~,r1] = convergents(a1); r1
[~,~,r2] = convergents(a2); r2
[~,q3,r3] = convergents(a3); r3
[~,~,r4] = convergents(a4); r4
[~,~,r5] = convergents(a5); r5

type errors_plot_14.m

% Use the function to plot semilogy graphs of n for each number
figure(1)
errors_plot_14(exp(1))

figure(2)
errors_plot_14(pi)

figure(3)
errors_plot_14((1+sqrt(5))/2)

figure(4)
errors_plot_14(sqrt(2))

figure(5)
errors_plot_14(3.0578)

%% Exercise C2 last part, alternatively: 
type errors_plot.m

% The rationale behind is 'I dont know how big my n should be'. Instead of
% using n = 14, this function would plot semilogy of absolute errors
% against n up to the absolute error is less than or equal to  1e-12.


%% Exercise C3

% Calculate a new matrix with its entries equal to 1/(sqrt(5)*(q_n)^2).
new_q3 = sym(1 ./ ((q3 .^ 2) .* sqrt(5)));

figure(3);
hold on
% Again, I want to start from n = 0.
n = 0:14;
semilogy(n,new_q3)
legend('phi-p_{n}/q_{n}','1/(sqrt(5)*(q_{n})^2)')

% Hence we can see from the graph that the two curves almost overlap,
% which means the convergents of phi are almost exactly 1/(sqrt(5)*(q_n)^2)


%% Exercise C4

a6 = get_cont_frac(sqrt(19),14)
% The sequence of repeated numbers are: [2,1,3,1,2,8].
% a_0 = 4 and the last number in the repeated sequence is indeed 2*4=8.


%% Exercise C5

type pell_solver.m

% Calculate solutions for D = 19 and D = 17.
[x_19,y_19] = pell_solver(10,19)
[x_17,y_17] = pell_solver(10,17)

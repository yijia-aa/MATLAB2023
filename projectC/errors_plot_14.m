% This function takes in a real number x and outputs a semilogy plot of
% absolute errors (between x and the convergent) against n. 

function errors_plot_14(x)
    
    % Compute the continued fraction of x up to a_14.
    % Find the convergent for each n = 0,1,...14
    a = get_cont_frac(sym(x),14);
    [~,~,r] = convergents(a);
    
    % I want to start from n = 0.
    n = 0:length(a)-1;

    % Find aboslute errors between the convergent and x for each n.
    y = abs(sym(x)-r);
    
    % Then make a semilogy plot of absolute errors agains n.
    semilogy(n,y)
    
    % I also want my horizontal axis to display integer values only.
    curtick = get(gca, 'xTick');
    xticks(unique(round(curtick)));
    
    title(['Semilogy plot of errors when x = ', num2str(x), ' as a function of n'])
    xlabel('n')
    ylabel('absolute error')

end


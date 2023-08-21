% This function is similar to errors_plot_14. They only differ from the 
% value of n. 
function y = errors_plot(x)

    error = Inf;
    n = 1;
    y = [];
    
    % A while loop is used to make sure error <= 1e-12.
    while error > 1e-12
        a = get_cont_frac(sym(x),n);
        [~,~,r] = convergents(a);
        error = abs(r(end)- sym(x));
        y(end+1) = error;
        n = n + 1;
    end
    
    z = linspace(0,length(y)-1,length(y));
    semilogy(z,y)
    curtick = get(gca, 'xTick');
    xticks(unique(round(curtick)));
    title(['Semilogy plot of errors when x = ', num2str(x), ' as a function of n'])
    xlabel('n')
    ylabel('absolute error')

end
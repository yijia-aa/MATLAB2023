function t = time_to_freedom(x,r1,r2)
% r1 = interest rate, r2 = saving increasing rate
    total_saving = 0;
    year = 0;
    
    while total_saving < 10000000
        year = year+1;
        total_saving = total_saving * (1+r1) + x * (1+r2)^(year);     
    end

    t = year;
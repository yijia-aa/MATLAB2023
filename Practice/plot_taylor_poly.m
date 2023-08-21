function plot_taylor_poly(f,a,maxdeg,xlim)

figure(1), clf
h = fplot(f,xlim);
set(h,'linewidth',2,'linestyle','--')
leg{1}=char(f);
hold on
for i = 1:maxdeg
    tay = taylor(f,'ExpansionPoint',a,'Order',i);
    h = fplot(tay,xlim);
    set(h,'color',[i/maxdeg 0 0])
    leg{i+1}=['taylor' num2str(i-1)];
end
title('partial taylor series')
legend(leg)
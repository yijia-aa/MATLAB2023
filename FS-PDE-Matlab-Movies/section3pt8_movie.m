figure(1);
set(gcf,'Position',[0 0 1080 730],'Color','w');

v = VideoWriter('section3pt8_movie.mp4','MPEG-4');
v.Quality = 100;
v.FrameRate = 30;
open(v);

L     = 1;
kappa = 1;
x     = linspace(0,L,1001);

box on; 
hold on;
grid on;
axis([0 1 0 3]);
plot(x,exp(cos(pi*x/L)).*cos(sin(pi*x/L)),'k-','Linewidth',1.5);
hold on;
t = 10.^((-4:0.05:0)');
for m=1:length(t)
    T=1;
    for n=1:5
        T=T+1/factorial(n)*cos(n*pi*x/L)*exp(-n^2*pi^2*kappa*t(m)/L^2);
    end
    P = plot(x,T,'r-','Linewidth',1.25);
    a = get(gca,'XTickLabel');
    set(gca,'XTickLabel',a,'fontsize',18);
    a = get(gca,'YTickLabel');
    set(gca,'YTickLabel',a,'fontsize',18);
    xlabel('x/L','FontSize',24,'FontWeight','normal');
    ylabel('T/T^*','FontSize',24,'FontWeight','normal');
    title('Section 3.8 Example','FontSize',24);
    tP  = text('Position',[0.75 2.75],'String',['log (\kappa t/L^2) = ',num2str(log10(t(m)),'%4.2f')],...
           'FontSize',24,'Color','k');
    frame = getframe(gcf);
    writeVideo(v,frame);
    delete(P);
    delete(tP);    
end

close(v);
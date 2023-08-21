figure(1);
set(gcf,'Position',[0 0 1080 730],'Color','w');

v = VideoWriter('section3pt7_movie.mp4','MPEG-4');
v.Quality = 100;
v.FrameRate = 30;
open(v);

T0    = 1;
T1    = 2;
L     = 1;
kappa = 1;
x     = linspace(0,L,1001);

box on; 
hold on;
grid on;
axis([0 1 0 2]);
plot([0 0],[0 1],'k-','Linewidth',1.5);
hold on;
plot([0 1],[0 0],'k-','Linewidth',1.5);
plot([1 1],[0 2],'k-','Linewidth',1.5);
t = 10.^((-6:0.05:1)');
for m=1:length(t)
    T=T0*(1-x/L)+T1*x/L;
    for n=1:1024
        T=T+2/pi*1/n*(-T0+(-1)^n*T1)*sin(n*pi*x/L)*exp(-n^2*pi^2*kappa*t(m)/L^2);
    end
    P = plot(x,T,'r-','Linewidth',1.25);
    a = get(gca,'XTickLabel');
    set(gca,'XTickLabel',a,'fontsize',18);
    a = get(gca,'YTickLabel');
    set(gca,'YTickLabel',a,'fontsize',18);
    xlabel('x/L','FontSize',24);
    ylabel('T/T^*','FontSize',24);
    title('Section 3.7 Example','FontSize',24);
    tP  = text('Position',[0.05 1.8],'String',['log(\kappa t/L^2) = ',num2str(log10(t(m)),'%4.2f')],...
           'FontSize',24,'Color','k');
    frame = getframe(gcf);
    writeVideo(v,frame);
    delete(P);
    delete(tP);    
end

close(v);
figure(1);
set(gcf,'Position',[0 0 1080 730],'Color','w');

v = VideoWriter('section3pt5_movie.mp4','MPEG-4');
v.Quality = 100;
v.FrameRate = 30;
open(v);

L     = 1;
L1    = 0.2;
L2    = 0.4;
kappa = 1;
x     = linspace(0,L,1001);

figure(1);
set(gcf,'Position',[0 0 1200 848],'Color','w');

box on; 
hold on;
grid on;
axis([0 1 0 1]);
plot(x,(x>=L1).*(x<=L2),'k-','LineWidth',1.25);
t = 10.^((-6:0.05:0)');
for m=1:length(t)
    T=zeros(size(x));
    for n=1:1024
        T=T+2/pi*1/n*(cos(n*pi*L1/L)-cos(n*pi*L2/L))*sin(n*pi*x/L)*exp(-n^2*pi^2*kappa*t(m)/L^2);
    end
    P = plot(x,T,'r-','Linewidth',1.25);
    a = get(gca,'XTickLabel');
    set(gca,'XTickLabel',a,'fontsize',18);
    a = get(gca,'YTickLabel');
    set(gca,'YTickLabel',a,'fontsize',18);
    xlabel('x/L','FontSize',24);
    ylabel('T/T^*','FontSize',24);
    title('Section 3.5 Example','FontSize',24);
    tP  = text('Position',[0.725 0.85],'String',['log (\kappa t/L^2) = ',num2str(log10(t(m)),'%4.2f')],...
           'FontSize',24,'Color','k');
    frame = getframe(gcf);
    writeVideo(v,frame);
    delete(P);
    delete(tP);    
end

close(v);
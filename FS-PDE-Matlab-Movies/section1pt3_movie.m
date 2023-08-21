figure(1);
set(gcf,'Position',[0 0 1080 730],'Color','w');

v = VideoWriter('section1pt3_movie.mp4','MPEG-4');
v.Quality = 100;
v.FrameRate = 30;
open(v);

x=pi*linspace(0,1,1001);
plot(x/pi,exp(cos(x)).*sin(sin(x)),'k-','Linewidth',2);
hold on;

for t=0:0.01:3
    T=zeros(size(x));
    for n=1:5
        T=T+sin(n*x).*exp(-n^2*t)/factorial(n);
    end
    P = plot(x/pi,T,'r-','Linewidth',2);
    box on;
    grid on;
    axis([0 1 0 1.5]);
    a = get(gca,'XTickLabel');
    set(gca,'XTickLabel',a,'fontsize',18);
    a = get(gca,'YTickLabel');
    set(gca,'YTickLabel',a,'fontsize',18);
    xlabel('x/\pi','FontSize',24);
    ylabel('T(x,t)','FontSize',24);
    title('Section 1.3 Example','FontSize',24);
    tP  = text('Position',[0.85 1.25],'String',['t = ',num2str(t,'%4.2f')],...
           'FontSize',24,'Color','k');
    frame = getframe(gcf);
    writeVideo(v,frame);
    delete(P);
    delete(tP); 
end

close(v);
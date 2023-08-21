figure(1);
set(gcf,'Position',[0 0 1080 730],'Color','w');

v = VideoWriter('section4pt10_movie_b.mp4','MPEG-4');
v.Quality = 100;
v.FrameRate = 60;
open(v);

x  = linspace(-3,3,1001);
Y1 =  @(X,t) ((X+t).^2-1).*(-1-t<X).*(X<-1+t) + ...
             4*X*t.*(-1+t<=X).*(X<=1-t) + ...
             (1-(X-t).^2).*(1-t<X).*(X<1+t);
Y2 =  @(X,t) ((X+t).^2-1).*(-1-t<X).*(X<1-t) + ...
             (1-(X-t).^2).*(-1+t<=X).*(X<1+t);
         
for t = 0:0.01:1
    P=plot(x,Y1(x,t),'r-','Linewidth',1.75);
    axis([-3 3 -1.5 1.5]);
    axis on;
    box on;
    grid on;
    xlabel('x/L','FontSize',24);
    ylabel('y/\epsilon','FontSize',24);
    title('Section 4.10 Example 2','FontSize',24);
	a = get(gca,'XTickLabel');
    set(gca,'XTickLabel',a,'fontsize',18);
    a = get(gca,'YTickLabel');
    set(gca,'YTickLabel',a,'fontsize',18);
    tP  = text('Position',[-2.5 1.25],'String',['ct/L = ',num2str(t,'%4.2f')],...
               'fontsize',24,'Color','k');
    
    frame = getframe(gcf);
    writeVideo(v,frame);
    delete(P);
    delete(tP);

end

for t = 1:0.01:3
    P=plot(x,Y2(x,t),'r-','Linewidth',1.75);
    axis([-3 3 -1.5 1.5]);
    axis on;
    box on;
    grid on;
    xlabel('x/L','FontSize',24);
    ylabel('y/\epsilon','FontSize',24);
    title('Section 4.10 Example 2','FontSize',24);
	a = get(gca,'XTickLabel');
    set(gca,'XTickLabel',a,'fontsize',18);
    a = get(gca,'YTickLabel');
    set(gca,'YTickLabel',a,'fontsize',18);
    tP  = text('Position',[-2.5 1.25],'String',['ct/L = ',num2str(t,'%4.2f')],...
               'fontsize',24,'Color','k');
    
    frame = getframe(gcf);
    writeVideo(v,frame);
    delete(P);
    delete(tP);

end

close(v);
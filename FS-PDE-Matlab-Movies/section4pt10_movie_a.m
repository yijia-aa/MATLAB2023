figure(1);
set(gcf,'Position',[0 0 1080 730],'Color','w');

v = VideoWriter('section4pt10_movie_a.mp4','MPEG-4');
v.Quality = 100;
v.FrameRate = 60;
open(v);

L = 1;
c = 1;
x = L*linspace(-5,5,1001);
Y =  @(X,t) 0.5*(cos(pi*(X+c*t)/2/c)).^4.*(X+c*t>-L).*(X+c*t<L) + ...
            0.5*(cos(pi*(X-c*t)/2/c)).^4.*(X-c*t>-L).*(X-c*t<L);

plot(x,Y(x,0),'k-','Linewidth',2);

for t = 0:0.01:3
    P=plot(x,Y(x,t),'r-','Linewidth',1.75);
%     plot(-L-c*t,Y(-L-c*t,t),'ro','MarkerSize',5,'MarkerFaceColor','r');
%     plot(-L+c*t,Y(-L+c*t,t),'ro','MarkerSize',5,'MarkerFaceColor','r');
%     plot(L-c*t,Y(L-c*t,t),'ro','MarkerSize',5,'MarkerFaceColor','r');
%     plot(L+c*t,Y(L+c*t,t),'ro','MarkerSize',5,'MarkerFaceColor','r');
    axis([-3 3 0 1]);
    axis on;
    box on;
    grid on;
    xlabel('x/L','FontSize',24);
    ylabel('y/\epsilon','FontSize',24);
    title('Section 4.10 Example 1','FontSize',24);
	a = get(gca,'XTickLabel');
    set(gca,'XTickLabel',a,'fontsize',18);
    a = get(gca,'YTickLabel');
    set(gca,'YTickLabel',a,'fontsize',18);
    tP  = text('Position',[-2.5 0.9],'String',['ct/L = ',num2str(t,'%4.2f')],...
               'fontsize',24,'Color','k');
    
    frame = getframe(gcf);
    writeVideo(v,frame);
    delete(P);
    delete(tP);

end

close(v);
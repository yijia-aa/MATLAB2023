figure(1);
set(gcf,'Position',[0 0 1080 730],'Color','w');

v = VideoWriter('section4pt9_movie.mp4','MPEG-4');
v.Quality = 100;
v.FrameRate = 60;
open(v);

f = @(X) exp(-2*X.^2);
x = (-10:0.01:10)';
t = (-2.5:0.01:2.5)';

for m = 1:length(t)
    P = plot(x,f(x-t(m))-f(-x-t(m)),'r-','LineWidth',1.5);
    box on; grid on;
    axis([-5 5 -1.5 1.5]) 
    xlabel('x/L','FontSize',24);
    ylabel('y/h','FontSize',24);
    title('Section 4.9 Example','FontSize',24);
    a = get(gca,'XTickLabel');
    set(gca,'XTickLabel',a,'fontsize',18);
    a = get(gca,'YTickLabel');
    set(gca,'YTickLabel',a,'fontsize',18);
    tP  = text('Position',[3.25 1.25],'String',['ct/L = ',num2str(t(m),'%4.2f')],...
       'FontSize',24,'Color','k');

    frame = getframe(gcf);
    writeVideo(v,frame);
    delete(P);
    delete(tP);
end

close(v);
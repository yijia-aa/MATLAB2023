figure(1);
set(gcf,'Position',[0 0 1080 730],'Color','w');

v = VideoWriter('section4pt4_movie_guitar.mp4','MPEG-4');
v.Quality = 100;
v.FrameRate = 60;
open(v);

L=1;
c=1;
h=1.0;
x = linspace(0,L,501);
t = (0:0.01/2:2)';

for m = 1:length(t)
    
y = zeros(size(x));
for n=1:256
    y=y+8*h/(pi^2*n^2)*sin(n*pi/2)*sin(n*pi*x/L)*cos(n*pi*c*t(m)/L);
end
P = plot(x,y,'r-','LineWidth',1.5');
axis([0 1 -1 1])
box on;
grid on;
xlabel('x/L','FontSize',24);
ylabel('y/h','FontSize',24);
title('Section 4.4 Example: Guitar','FontSize',24);
a = get(gca,'XTickLabel');
set(gca,'XTickLabel',a,'fontsize',18);
a = get(gca,'YTickLabel');
set(gca,'YTickLabel',a,'fontsize',18);

frame = getframe(gcf);
writeVideo(v,frame);
delete(P);

end

close(v);
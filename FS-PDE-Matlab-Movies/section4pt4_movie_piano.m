figure(1);
set(gcf,'Position',[0 0 1080 730],'Color','w');

v = VideoWriter('section4pt4_movie_piano.mp4','MPEG-4');
v.Quality = 100;
v.FrameRate = 60;
open(v);

c  = 1;
L  = 1;
L1 = 0.3;
L2 = 0.5;
h  = 1.0;
x = linspace(0,L,501);
t = (0:0.01/2:2)';

for m = 1:length(t)
    
y = zeros(size(x));
for n=1:256
    y=y+2/(pi^2*n^2)*(cos(n*pi*L1/L)-cos(n*pi*L2/L))*sin(n*pi*x/L)*sin(n*pi*c*t(m)/L);
end
P = plot(x,y,'r-','LineWidth',1.5');
axis([0 1 -0.15 0.15])
box on;
grid on;
xlabel('x/L','FontSize',24);
ylabel('y/h','FontSize',24);
title('Section 4.4 Example: Piano','FontSize',24);
a = get(gca,'XTickLabel');
set(gca,'XTickLabel',a,'fontsize',18);
a = get(gca,'YTickLabel');
set(gca,'YTickLabel',a,'fontsize',18);

frame = getframe(gcf);
writeVideo(v,frame);
delete(P);

end

close(v);
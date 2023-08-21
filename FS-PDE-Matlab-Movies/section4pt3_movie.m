figure(1);
set(gcf,'Position',[0 0 1080 730],'Color','w');
sgtitle('Section 4.3 Normal Modes','FontSize',24);

v = VideoWriter('section4pt3_movie.mp4','MPEG-4');
v.Quality = 100;
v.FrameRate = 30;
open(v);

x = pi*linspace(0,1,1001);
t = 2*pi*(0:0.01:2)';

subplot(2,2,1)
plot(x/pi,sin(x),'k-','Linewidth',1.25);
hold on;
plot(x/pi,-sin(x),'k--','Linewidth',1.25);
axis([0 1 -1 1]);
box on;
grid on;
set(gca,'xticklabel',[]);
set(gca,'yticklabel',[]);

subplot(2,2,2)
plot(x/pi,sin(2*x),'k-','Linewidth',1.25);
hold on;
plot(x/pi,-sin(2*x),'k--','Linewidth',1.25);
axis([0 1 -1 1]);
box on;
grid on;
set(gca,'xticklabel',[]);
set(gca,'yticklabel',[]);

subplot(2,2,3)
plot(x/pi,sin(3*x),'k-','Linewidth',1.25);
hold on;
plot(x/pi,-sin(3*x),'k--','Linewidth',1.25);
axis([0 1 -1 1]);
box on;
grid on;
set(gca,'xticklabel',[]);
set(gca,'yticklabel',[]);

subplot(2,2,4)
plot(x/pi,sin(4*x),'k-','Linewidth',1.25);
hold on;
plot(x/pi,-sin(4*x),'k--','Linewidth',1.25);
axis([0 1 -1 1]);
box on;
grid on;
set(gca,'xticklabel',[]);
set(gca,'yticklabel',[]);

for m = 1:length(t)

subplot(2,2,1)
P1 = plot(x/pi,sin(x)*sin(t(m)),'r-','Linewidth',1.25);
box on;
grid on;
set(gca,'xticklabel',[]);
set(gca,'yticklabel',[]);

subplot(2,2,2)
P2 = plot(x/pi,sin(2*x)*sin(2*t(m)),'r-','Linewidth',1.25);
box on;
grid on;
set(gca,'xticklabel',[]);
set(gca,'yticklabel',[]);

subplot(2,2,3)
P3 = plot(x/pi,sin(3*x)*sin(3*t(m)),'r-','Linewidth',1.25);
box on;
grid on;
set(gca,'xticklabel',[]);
set(gca,'yticklabel',[]);

subplot(2,2,4)
P4 = plot(x/pi,sin(4*x)*sin(4*t(m)),'r-','Linewidth',1.25);
box on;
grid on;
set(gca,'xticklabel',[]);
set(gca,'yticklabel',[]);

frame = getframe(gcf);
writeVideo(v,frame);
delete(P1);
delete(P2);
delete(P3);
delete(P4);

end

close(v);
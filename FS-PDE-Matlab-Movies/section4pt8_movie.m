figure(1);
set(gcf,'Position',[0 0 1080 730],'Color','w');

sgtitle('Section 4.8 Example','FontSize',24);

v = VideoWriter('section4pt8_movie.mp4','MPEG-4');
v.Quality = 100;
v.FrameRate = 30;
open(v);

alpha = 1;
L     = pi;
x     = L*linspace(-1,1,1001);
fun   = @(z) z*tan(z)-alpha;

subplot(2,2,1)
theta = fzero(fun,[0.1,pi/2-0.1]);
omega = theta/L;
plot(x/L,sin(omega*(L-abs(x))),'k-','Linewidth',1.25);
hold on;
plot(x/L,-sin(omega*(L-abs(x))),'k--','Linewidth',1.25);
box on;
grid on;
axis([-1 1 -1 1]);

subplot(2,2,2)
theta = fzero(fun,[pi/2+0.1,3*pi/2-0.1]);
omega = theta/L;
plot(x/L,sin(omega*(L-abs(x))),'k-','Linewidth',1.25);
hold on;
plot(x/L,-sin(omega*(L-abs(x))),'k--','Linewidth',1.25);
box on;
grid on;
axis([-1 1 -1 1]);

subplot(2,2,3)
theta = fzero(fun,[3*pi/2+0.1,5*pi/2-0.1]);
omega = theta/L;
plot(x/L,sin(omega*(L-abs(x))),'k-','Linewidth',1.25);
hold on;
plot(x/L,-sin(omega*(L-abs(x))),'k--','Linewidth',1.25);
box on;
grid on;
axis([-1 1 -1 1]);

subplot(2,2,4)
theta = fzero(fun,[5*pi/2+0.1,7*pi/2-0.1]);
omega = theta/L;
plot(x/L,sin(omega*(L-abs(x))),'k-','Linewidth',1.25);
hold on;
plot(x/L,-sin(omega*(L-abs(x))),'k--','Linewidth',1.25);
box on;
grid on;
axis([-1 1 -1 1]);

%%%%%%%%%%%%%%

theta1 = fzero(fun,[0.1,pi/2-0.1]);
omega1 = theta1/L;

t = 2*pi*(0:0.01/2:1)'/omega1;

for m = 1:length(t)
    
subplot(2,2,1)
theta = fzero(fun,[0.1,pi/2-0.1]);
omega = theta/L;
P1 = plot(x/L,sin(omega*(L-abs(x)))*cos(omega*t(m)),'r-','Linewidth',1.25);
box on;
grid on;
xticks([-1 -0.5 0.0 0.5 1.0]);
xlabel('x/L','FontSize',24);
ylabel('y/A','FontSize',24);
a = get(gca,'XTickLabel');
set(gca,'XTickLabel',a,'fontsize',18);
a = get(gca,'YTickLabel');
set(gca,'YTickLabel',a,'fontsize',18);

subplot(2,2,2)
theta = fzero(fun,[pi/2+0.1,3*pi/2-0.1]);
omega = theta/L;
P2 = plot(x/L,sin(omega*(L-abs(x)))*cos(omega*t(m)),'r-','Linewidth',1.25);
box on;
grid on;
xticks([-1 -0.5 0.0 0.5 1.0]);
xlabel('x/L','FontSize',24);
ylabel('y/A','FontSize',24);
a = get(gca,'XTickLabel');
set(gca,'XTickLabel',a,'fontsize',18);
a = get(gca,'YTickLabel');
set(gca,'YTickLabel',a,'fontsize',18);

subplot(2,2,3)
theta = fzero(fun,[3*pi/2+0.1,5*pi/2-0.1]);
omega = theta/L;
P3 = plot(x/L,sin(omega*(L-abs(x)))*cos(omega*t(m)),'r-','Linewidth',1.25);
box on;
grid on;
xticks([-1 -0.5 0.0 0.5 1.0]);
xlabel('x/L','FontSize',24);
ylabel('y/A','FontSize',24);
a = get(gca,'XTickLabel');
set(gca,'XTickLabel',a,'fontsize',18);
a = get(gca,'YTickLabel');
set(gca,'YTickLabel',a,'fontsize',18);

subplot(2,2,4)
theta = fzero(fun,[5*pi/2+0.1,7*pi/2-0.1]);
omega = theta/L;
P4 = plot(x/L,sin(omega*(L-abs(x)))*cos(omega*t(m)),'r-','Linewidth',1.25);
box on;
grid on;
xticks([-1 -0.5 0.0 0.5 1.0]);
xlabel('x/L','FontSize',24);
ylabel('y/A','FontSize',24);
a = get(gca,'XTickLabel');
set(gca,'XTickLabel',a,'fontsize',18);
a = get(gca,'YTickLabel');
set(gca,'YTickLabel',a,'fontsize',18);

frame = getframe(gcf);
writeVideo(v,frame);
delete(P1);
delete(P2);
delete(P3);
delete(P4);
end

close(v);




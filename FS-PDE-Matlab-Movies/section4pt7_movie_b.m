figure(1);
set(gcf,'Position',[0 0 1080 730],'Color','w');

v = VideoWriter('section4pt7_movie_b.mp4','MPEG-4');
v.Quality = 100;
v.FrameRate = 60;
open(v);

x = linspace(0,1,1001);
t = 2*pi*linspace(0,5,501);

for m = 1:length(t)

p = 1;
y = sin(p*t(m)).*(1-x);
y = y-(p*t(m).*cos(p*t(m))+sin(p*t(m))).*sin(p*pi*x)/pi/p;
hold on;
for n = 2:32 % \ne p
    y = y+2*p/(pi*n*(n^2-p^2))*(p*sin(p*t(m))-n*sin(n*t(m))).*sin(n*pi*x);
end

P = plot(x,y,'r-','LineWidth',1.5);
axis([0 1 -10 10]);
axis on;
box on;
grid on;
xlabel('x/L','FontSize',24);
ylabel('y/h','FontSize',24);
title('Section 4.7 Example: \omega=\omega_1','FontSize',24);
a = get(gca,'XTickLabel');
set(gca,'XTickLabel',a,'fontsize',18);
a = get(gca,'YTickLabel');
set(gca,'YTickLabel',a,'fontsize',18);

frame = getframe(gcf);
writeVideo(v,frame);
delete(P);

end

close(v);
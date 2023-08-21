figure(1);
set(gcf,'Position',[0 0 1080 730],'Color','w');

v = VideoWriter('section4pt7_movie_a.mp4','MPEG-4');
v.Quality = 100;
v.FrameRate = 60;
open(v);

w = 0.5; % w = omega
x = linspace(0,1,1001);
t = 2*pi*linspace(0,2,201);

for m = 1:length(t)

y = sin(w*t(m)).*(1-x);
for n = 1:256
    y = y+2*w/(pi*n*(n^2-w^2))*(w*sin(w*t(m))-n*sin(n*t(m))).*sin(n*pi*x);
end
P = plot(x,y,'r-','LineWidth',1.5);
axis([0 1 -2 2]);
axis on;
box on;
grid on;
xlabel('x/L','FontSize',24);
ylabel('y/h','FontSize',24);
title('Section 4.7 Example: \omega=\omega_1/2','FontSize',24);
a = get(gca,'XTickLabel');
set(gca,'XTickLabel',a,'fontsize',18);
a = get(gca,'YTickLabel');
set(gca,'YTickLabel',a,'fontsize',18);

frame = getframe(gcf);
writeVideo(v,frame);
delete(P);

end

close(v);
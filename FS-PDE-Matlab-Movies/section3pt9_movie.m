figure(1);
set(gcf,'Position',[0 0 1080 720],'Color','w');

x  = linspace(0,1,1001); % x/L
t  = linspace(0,3,601);
T  =  @(X,tau,a) imag(cosh(a*(1+1i)*(1-X))*exp(2*pi*1i*tau)...
                    /a/(1+1i)/sinh(a*(1+1i)));

v = VideoWriter('section3pt9_movie.mp4','MPEG-4');
v.Quality   = 100;
v.FrameRate = 60;
open(v);

for n=1:length(t)
    
    mytitleText = ['Section 3.9 Example, \omega t/2\pi = ',num2str(t(n),'%4.2f')];
    P = sgtitle(mytitleText,'Fontsize',24,'FontWeight','normal');%,'FontWeight','bold');
    
    subplot(2,2,1)
    a  = 0.1; % L\nu
    P1 = plot(x,T(x,t(n),a),'r-','Linewidth',1.75);
    hold on;
    axis([0 1 -50 50]);
    axis on;
    box on;
    grid on;
    ax = gca;
    ax.FontSize = 14;
    xlabel('x/L','Fontsize',18,'FontWeight','normal');
    ylabel('T_p(x,t)/T^*','Fontsize',18,'FontWeight','normal');
    title('$\nu = 0.1$','Interpreter','latex','Fontsize',18,'FontWeight','normal');
%     tP1  = text('Position',[0.825 0.75*50],'String',['\frac{\omega t}{2\pi} = ',num2str(t(n),'%4.2f')],...
%                'fontsize',18,'Color','k');
    
    subplot(2,2,2)
    a  = 1; % L\nu
    P2 = plot(x,T(x,t(n),a),'r-','Linewidth',1.75);
    hold on;
    axis([0 1 -1 1]);
    axis on;
    box on;
    grid on;
    ax = gca;
    ax.FontSize = 14;
    xlabel('x/L','Fontsize',18,'FontWeight','normal');
    ylabel('T_p(x,t)/T^*','Fontsize',18,'FontWeight','normal');
    title('$\nu = 1$','Interpreter','latex','Fontsize',18,'FontWeight','normal');
%     tP2  = text('Position',[0.825 0.75],'String',['\frac{\omega t}{2\pi} = ',num2str(t(n),'%4.2f')],...
%                'fontsize',18,'Color','k');      

    subplot(2,2,3)
    a  = 10; % L\nu
    P3 = plot(x,T(x,t(n),a),'r-','Linewidth',1.75);
    hold on;
    axis([0 1 -0.1 0.1]);
    axis on;
    box on;
    grid on;
    ax = gca;
    ax.FontSize = 14;
    xlabel('x/L','Fontsize',18,'FontWeight','normal');
    ylabel('T_p(x,t)/T^*','Fontsize',18,'FontWeight','normal');
    title('$\nu = 10$','Interpreter','latex','Fontsize',18,'FontWeight','normal');
%     tP3  = text('Position',[0.825 0.75*0.1],'String',['\frac{\omega t}{2\pi} = ',num2str(t(n),'%4.2f')],...
%                'fontsize',18,'Color','k');             

    subplot(2,2,4)
    a  = 100; % L\nu
    P4 = plot(x,T(x,t(n),a),'r-','Linewidth',1.75);
    hold on;
    axis([0 1 -0.01 0.01]);
    axis on;
    box on;
    grid on;
    ax = gca;
    ax.FontSize = 14;
    xlabel('x/L','Fontsize',18,'FontWeight','normal');
    ylabel('T_p(x,t)/T^*','Fontsize',18,'FontWeight','normal');
    title('$\nu = 100$','Interpreter','latex','Fontsize',18,'FontWeight','normal');
%     tP4  = text('Position',[0.825 0.75*0.01],'String',['\frac{\omega t}{2\pi} = ',num2str(t(n),'%4.2f')],...
%                'fontsize',18,'Color','k');         
           
    frame = getframe(gcf);
    writeVideo(v,frame);
    delete(P1);
%    delete(tP1);
    delete(P2);
%    delete(tP2);
    delete(P3);
%    delete(tP3);
    delete(P4);
%    delete(tP4);
    delete(P);
    
end

close(v);
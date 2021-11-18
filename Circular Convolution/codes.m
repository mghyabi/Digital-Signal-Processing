%% p2

xa = [1 1 1 1];
ha = [1 2 3];
N=4;
ya = circonv(xa,ha,N);

disp('circonv(x,h,N)')
disp(['x = [' num2str(xa) ']'])
disp(['h = [' num2str(ha) ']'])
disp(['N = ' num2str(N)])
figure
stem((1:4)-1,ya,'filled','LineWidth',1.5)
ylim([0,8])
xlabel('n')
ylabel('y_a')
set(gcf,'position',[50,50,300,200])
title('Figure 1: Circular Convolution')

xb = [1 1 1 1];
hb = [1 2 3];
yb = circonv(xb,hb,0);

disp('circonv(x,h,N)')
disp(['x = [' num2str(xb) ']'])
disp(['h = [' num2str(hb) ']'])
disp('N = 0' )
figure
stem((1:6)-1,yb,'filled','LineWidth',1.5)
ylim([0,8])
xlabel('n')
ylabel('y_b')
set(gcf,'position',[50,50,450,200])
title('Figure 2: Linear Convolution')

xc = [1 3 6 2 8];
hc = [2 9 5 3];
N=6;
yc = circonv(xc,hc,N);

disp('circonv(x,h,N)')
disp(['x = [' num2str(xc) ']'])
disp(['h = [' num2str(hc) ']'])
disp(['N = ' num2str(N)])
figure
stem((1:6)-1,yc,'filled','LineWidth',1.5)
ylim([0,120])
xlabel('n')
ylabel('y_c')
set(gcf,'position',[50,50,450,200])
title('Figure 3: Circular Convolution')

%% p4

load('MP2data')
figure
stem((1:42)-1,h,'filled','LineWidth',1.5)
ylim([-0.1,0.3])
xlim([0 45])
xlabel('n')
ylabel('h')
set(gcf,'position',[50,50,550,200])
title('Figure 4: Impulse Response h[n]')

H = fft(h,1024);
figure,
plot(linspace(-pi,pi,1024),fftshift(abs(H)))
xlim([-pi,pi])
grid on
xticks([-pi -pi/2 0 pi/2 pi])
set(gca,'XTickLabel',{'-\pi','-\pi/2','0','\pi/2','\pi'})
xlabel('\omega (rad/s)')
ylabel('|H(e^j^\omega)|')
title('fogure 5: Magnitude of H(e^j^\omega)')
ylim([0,1.2])
set(gcf,'position',[50,50,550,350])

y_ola=ola(x,h,100);
y_conv=conv(x,h);

figure,
subplot(2,1,1)
stem(0:length(x)-1,x,'filled','LineWidth',0.5,'MarkerSize',1.5)
ylim([-2.5,2.5])
xlabel('n')
ylabel('x')
title('Figure 6a: Input Signal')
subplot(2,1,2)
stem(0:length(y_ola)-1,y_ola,'filled','LineWidth',0.5,'MarkerSize',1.5)
ylim([-0.2,0.2])
xlim([0,1040])
xlabel('n')
ylabel('y')
title('Figure 6b: Convolved Signal')
set(gcf,'position',[50,50,1000,400])
error = mean((y_ola-y_conv).^2);
disp(['Average error between "conv" and "ola" = ' num2str(error)])


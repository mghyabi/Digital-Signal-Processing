%% P2
L=5;

hzoh=ones(1,5);

figure
stem(-2*L:2*L,[zeros(1,2*L) hzoh zeros(1,L+1)],'filled','LineWidth',1.5)
ylim([0,2])
xlabel('n')
ylabel('h_z_o_h')
set(gcf,'position',[50,50,550,200])
title('h_z_o_h Impulse Response')

n=-L+1:L-1;
hlin=zeros(1,numel(n));
hlin(abs(n)<=L-1)=1-abs(n(abs(n)<=L-1))/L;

figure
stem(-2*L:2*L,[zeros(1,L+1) hlin zeros(1,L+1)],'filled','LineWidth',1.5)
ylim([0,2])
xlabel('n')
ylabel('h_l_i_n')
set(gcf,'position',[50,50,550,200])
title('h_l_i_n Impulse Response')

%% P3
N=1024;
omega=linspace(-pi,pi,N);
Hzoh=fft(hzoh,N);
Mag=abs(Hzoh);
Mag=[fliplr(Mag(1:N/2)) Mag(1:N/2)];

figure,
plot(omega,Mag)
hold on
plot([-pi/L -pi/L pi/L pi/L],[0 L L 0], '--')
legend
xlim([-pi,pi])
grid on
xticks([-pi -pi/2 -pi/5 0 pi/5 pi/2 pi])
set(gca,'XTickLabel',{'-\pi','-\pi/2','-\pi/5','0','\pi/5','\pi/2','\pi'})
xlabel('\omega (rad/s)')
ylabel('|H_z_o_h(e^j^\omega)|')
title('|H_z_o_h(e^j^\omega)|')
ylim([0,6])
% legend('|H_z_o_h(e^j^\omega)|','|H_i_d_e_a_l(e^j^\omega)|')
set(gcf,'position',[50,50,550,350])

Hlin=fft(hlin,N);
Mag=abs(Hlin);
Mag=[fliplr(Mag(1:N/2)) Mag(1:N/2)];

figure,
plot(omega,Mag)
hold on
plot([-pi/L -pi/L pi/L pi/L],[0 L L 0], '--')
xlim([-pi,pi])
grid on
xticks([-pi -pi/2 -pi/5 0 pi/5 pi/2 pi])
set(gca,'XTickLabel',{'-\pi','-\pi/2','-\pi/5','0','\pi/5','\pi/2','\pi'})
xlabel('\omega (rad/s)')
ylabel('|H_l_i_n(e^j^\omega)|')
title('|H_l_i_n(e^j^\omega)|')
ylim([0,6])
set(gcf,'position',[50,50,550,350])

%hzoh i better becouse it attenuates aslower than hlin
%% P4

load('mp1DataFile.mat','data1')
xe=upsample(data1,L);

xzoh=filter(hzoh,1,xe);

xlin=filter(hlin,1,xe);

%% P5

n=-10:20;

figure,
stem(n,[zeros(1,10) xzoh(1:21)],'filled','LineWidth',1.5)
ylim([-0.5,1])
xlabel('n')
ylabel('x_z_o_h')
set(gcf,'position',[50,50,1000,200])
title('x_z_o_h Stem Plot')

figure,
stem(n,[zeros(1,6) xlin(1:25)],'filled','LineWidth',1.5)
ylim([-0.5,1])
xlabel('n')
ylabel('x_l_i_n')
set(gcf,'position',[50,50,1000,200])
title('x_l_i_n Stem Plot')

%% P6

load('mp1DataFile.mat','hsharp')

figure,
stem(-10:10,hsharp,'filled','LineWidth',1.5)
ylim([-0.5,1.5])
xlabel('n')
ylabel('h_s_h_a_r_p')
set(gcf,'position',[50,50,550,350])
title('h_s_h_a_r_p Impulse Response')

%% P7

Hsharp=fft(hsharp,N);
Mag=abs(Hsharp);
Mag=[flipud(Mag(1:N/2));Mag(1:N/2)];

figure,
plot(omega,Mag)
hold on
plot([-pi/L -pi/L pi/L pi/L],[0 L L 0], '--')
xlim([-pi,pi])
grid on
xticks([-pi -pi/2 -pi/5 0 pi/5 pi/2 pi])
set(gca,'XTickLabel',{'-\pi','-\pi/2','-\pi/5','0','\pi/5','\pi/2','\pi'})
xlabel('\omega (rad/s)')
ylabel('|H_s_h_a_r_p(e^j^\omega)|')
title('|H_s_h_a_r_p(e^j^\omega)|')
% ylim([0,6])
set(gcf,'position',[50,50,550,350])

%% P8

xsharp=filter(hsharp,1,xe);

figure,
stem(n,xlin(1:31),'filled','LineWidth',1.5)
ylim([-0.5,1])
xlabel('n')
ylabel('x_s_h_a_r_p')
set(gcf,'position',[50,50,1000,200])
title('x_s_h_a_r_p Stem Plot')

%% P10

load('mp1DataFile.mat','ideal1')

ezoh=mean((xzoh(1:81)-ideal1(1:81)).^2);
elin=mean((xlin(4:84)-ideal1(1:81)).^2);
esharp=mean((xsharp(10:90)-ideal1(1:81)).^2);

disp(['Average interpolation error for ZOH is ', num2str(ezoh)])
disp(['Average interpolation error for linear interpolation is ', num2str(elin)])
disp(['Average interpolation error for sharp filter is ', num2str(esharp)])

fm=2000;
fc=100000;
Ac=2;
Am=1; %MI=0.5
t=0:1/1001:2;
um=Am*cos(2*pi*fm*t);
uc=Ac*cos(2*pi*fc*t);
uam= (um+Ac).*cos(2*pi*fc*t);
figure();
subplot(4, 1, 1);
plot(t, uam);
title("amod=0.5");
[up,lo] = envelope(uam);
hold on;
plot(t,up,t,lo,'linewidth',1.5)
legend('DSB-Sc','upper','lower')
hold off;


Am=1.6;
um=Am*cos(2*pi*fm*t);
uc=Ac*cos(2*pi*fc*t);
uam= (um+Ac).*cos(2*pi*fc*t);
subplot(4, 1, 2);
plot(t, uam);
title("amod=0.8");
[up,lo] = envelope(uam);
hold on;
plot(t,up,t,lo,'linewidth',1.5)
legend('DSB-Sc','upper','lower')
hold off;


Am=2;
um=Am*cos(2*pi*fm*t);
uc=Ac*cos(2*pi*fc*t);
uam= (um+Ac).*cos(2*pi*fc*t);
subplot(4, 1, 3);
plot(t, uam);
title("amod=1");
[up,lo] = envelope(uam);
hold on;
plot(t,up,t,lo,'linewidth',1.5)
legend('DSB-Sc','upper','lower')
hold off;




Am=3;
um=Am*cos(2*pi*fm*t);
uc=Ac*cos(2*pi*fc*t);
uam= (um+Ac).*cos(2*pi*fc*t);
subplot(4, 1, 4);
plot(t, uam);
title("amod=1.5");
[up,lo] = envelope(uam);
hold on;
plot(t,up,t,lo,'linewidth',1.5)
legend('DSB-Sc','upper','lower')
hold off;



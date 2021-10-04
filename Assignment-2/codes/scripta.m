%a) part
fm=2000;
fc=100000;

t=0:1/1001:2;
um=cos(2*pi*fm*t);
uc=2*cos(2*pi*fc*t);
figure();
subplot(2, 1, 1);
plot(t, um);
title("Message signal");
xlabel("t");
ylabel("m(t)");
subplot(2, 1, 2);
plot(t, uc);
title("Carrier signal");
xlabel("t");
ylabel("uc(t)");

%------------------------
%b) part
udsb=um.*uc;
figure();
subplot(2, 1, 1);
plot(t, udsb);
title("DSB-SC signal");
xlabel("t");
ylabel("Udsb-sc (t)");
[up,lo] = envelope(udsb);
hold on;
plot(t,up,t,lo,'linewidth',1.5)
legend('DSB-Sc','upper','lower')
hold off;
Uf1=fft(udsb);
Uf=fftshift(Uf1);
f=0:1/1001:2;
subplot(2, 1, 2);
plot(f, real(Uf));
title("Spectrum of u(t)");
xlabel("f");
ylabel("U(f)");

%-------------------------




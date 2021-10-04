fm=2000;
fc=100000;

t=0:1/1001:2;
um=cos(2*pi*fm*t);
uc=2*cos(2*pi*fc*t);
udsb=um.*uc;

yp1=2*cos(2*pi*fc*t).*udsb;
m=lowpass(yp1, fc, 1000001);
figure();
subplot(2, 1, 1);
plot(t, m);
title("Reconstructed signal");
xlabel("t");
ylabel("m'(t)");
subplot(2, 1, 2);
plot(t, um);
title("Original signal");
xlabel("t");
ylabel("m(t)");


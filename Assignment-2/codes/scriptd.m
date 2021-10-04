fm=2000;
fc=100000;

t=0:1/1001:2;
um=cos(2*pi*fm*t);
uc=2*cos(2*pi*fc*t);
udsb=um.*uc;

figure();
theta_r=0;
df=0;
yp1=2*cos(2*pi*(fc+df)*t+theta_r).*udsb;
m=lowpass(yp1, fc, 1000001);
subplot(4, 1, 1);
plot(t, m);
title("Frequency offset=0");
xlabel("t");
ylabel("m'(t)");


theta_r=0;
df=1;
yp1=2*cos(2*pi*(fc+df)*t+theta_r).*udsb;
m=lowpass(yp1, fc, 1000001);
subplot(4, 1, 2);
plot(t, m);
title("Frequency offset=1");
xlabel("t");
ylabel("m'(t)");

theta_r=0;
df=998;
yp1=2*cos(2*pi*(fc+df)*t+theta_r).*udsb;
m=lowpass(yp1, fc, 1000001);
subplot(4, 1, 3);
plot(t, m);
title("Frequency offset=998");
xlabel("t");
ylabel("m'(t)");

theta_r=0;
df=15000;
yp1=2*cos(2*pi*(fc+df)*t+theta_r).*udsb;
m=lowpass(yp1, fc, 1000001);
subplot(4, 1, 4);
plot(t, m);
title("Frequency offset=15000");
xlabel("t");
ylabel("m'(t)");



figure();
theta_r=0;
df=0;
yp1=2*cos(2*pi*(fc+df)*t+theta_r).*udsb;
m=lowpass(yp1, fc, 1000001);
subplot(5, 1, 1);
plot(t, m);
title("Phase offset=0");
xlabel("t");
ylabel("m'(t)");


theta_r=pi/6;
df=0;
yp1=2*cos(2*pi*(fc+df)*t+theta_r).*udsb;
m=lowpass(yp1, fc, 1000001);
subplot(5, 1, 2);
plot(t, m);
title("Phase offset=pi/6");
xlabel("t");
ylabel("m'(t)");

theta_r=pi/4;
df=0;
yp1=2*cos(2*pi*(fc+df)*t+theta_r).*udsb;
m=lowpass(yp1, fc, 1000001);
subplot(5, 1, 3);
plot(t, m);
title("Phase offset=pi/4");
xlabel("t");
ylabel("m'(t)");

theta_r=pi/3;
df=0;
yp1=2*cos(2*pi*(fc+df)*t+theta_r).*udsb;
m=lowpass(yp1, fc, 1000001);
subplot(5, 1, 4);
plot(t, m);
title("Phase offset=pi/3");
xlabel("t");
ylabel("m'(t)");

theta_r=pi/2;
df=0;
yp1=2*cos(2*pi*(fc+df)*t+theta_r).*udsb;
m=lowpass(yp1, fc, 1000001);
subplot(5, 1, 5);
plot(t, m);
title("Phase offset=pi/2");
xlabel("t");
ylabel("m'(t)");

figure();
theta_r=0;
df=0;
yp1=2*cos(2*pi*(fc+df)*t+theta_r).*udsb;
m=lowpass(yp1, fc, 1000001);
subplot(3, 1, 1);
plot(t, m);
title("Frequency offset =0 Phase offset=0");
xlabel("t");
ylabel("m'(t)");


theta_r=pi/6;
df=20;
yp1=2*cos(2*pi*(fc+df)*t+theta_r).*udsb;
m=lowpass(yp1, fc, 1000001);
subplot(3, 1, 2);
plot(t, m);
title("Frequency offset =20 Phase offset=pi/6");
xlabel("t");
ylabel("m'(t)");


theta_r=pi/3;
df=998;
yp1=2*cos(2*pi*(fc+df)*t+theta_r).*udsb;
m=lowpass(yp1, fc, 1000001);
subplot(3, 1, 3);
plot(t, m);
title("Frequency offset =998 Phase offset=pi/3");
xlabel("t");
ylabel("m'(t)");


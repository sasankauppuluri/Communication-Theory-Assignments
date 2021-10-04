

fs=1001;
fc=100000;
t=0:1/fs:2;
Am=1;
Ac=2;
um=Am*sawtooth(2*pi*2000*t);
figure();
plot(t,um);
title("Saw-tooth");
uc=Ac*cos(2*pi*fc*t);
udsbsc=um.*uc;
udsbfc= (um+Ac).*cos(2*pi*fc*t);
figure();
subplot(2, 1, 1);
plot(t, udsbsc);
title("U DSB-SC");
subplot(2, 1, 2);
plot(t, udsbfc);
title("U DSB-FC");

%---------------------
Y1=fft(udsbsc);
Y=fftshift(Y1);

Z1=fft(udsbfc);
Z=fftshift(Z1);

figure();
subplot(2, 1, 1);
plot(t, real(Y));
title(" frequency spectrum of U DSB-SC");
subplot(2, 1, 2);
plot(t, real(Z));
title(" frequency spectrum of U DSB-FC");


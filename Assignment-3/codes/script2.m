fc=100;
fs=20*fc;
Am=1;
Ac=10;
Kf=100;


p1=-0.04:1/fs:(-0.02-(1/fs));
mt1=0*p1;
p2=-0.02:1/fs:(-0.01-(1/fs));
mt2=100*(p2+0.02);
p3=-0.01:1/fs:(0.01-(1/fs));
mt3=-100*p3;
p4=0.01:1/fs:(0.02-(1/fs));
mt4=100*(p4-0.02);
p5=0.02:1/fs:0.04;
mt5=0*p5;

t=[p1, p2, p3, p4, p5];
mt=[mt1 mt2 mt3 mt4 mt5];


figure();
subplot(3,1, 1);
plot(t, mt);
title("Message signal");
xlabel("t");
ylabel("m(t)");

ct=Ac*cos(2*pi*fc*t);
subplot(3,1, 2);
plot(t, ct);
title("Carrier signal");
xlabel("t");
ylabel("u_c(t)");

theta_t=2*pi*Kf*cumsum(mt)/fs;

ufm=Ac*cos(2*pi*fc*t+ theta_t);
subplot(3,1, 3);
plot(t, ufm);
title("Modulated signal");
xlabel("t");
ylabel("U_F_M(t)");

%-------------------
 %vt=-Ac*((2*pi*fc)+2*pi*Kf*mt).*sin(2*pi*fc*t+theta_t);
 
 vt=diff(ufm)*fs;
 t1=-0.04:(1/fs):(0.04-(1/fs));
 figure();
 subplot(3, 1, 1);
 plot(t1, vt);
 title("Signal after differentiation");
 xlabel("t");
 ylabel("V(t)");
 [evt,lo] = envelope(vt);
 subplot(3, 1, 2);
 plot(t1, evt);
 title("Signal after envelope detection(Rectified signal)");
 xlabel("t");
 ylabel("Env(t)");
 dc = mean(evt);
 mu = (evt - dc)/(2*pi*Ac*Kf);
 subplot(3, 1, 3);
 plot(t1, mu);
 title("Recovered signal");
 xlabel("t");
 ylabel("m_r(t)");
 
 %---------------------
 Mt1=fft(mt);
 Mt=fftshift(Mt1);
 figure();
 subplot(2, 2, 1);
 plot(t, abs(Mt));
 title("Spectrum of Message signal");
 xlabel("f");
 ylabel("M(f)"); 
  
 Ufm1=fft(ufm);
 Ufm=fftshift(Ufm1);
 subplot(2, 2, 2);
 plot(t, abs(Ufm));
 title("Spectrum of Modulated signal");
 xlabel("f");
 ylabel("U_F_M(f)"); 
 
 
 Evt1=fft(evt);
 Evt=fftshift(Evt1);
 subplot(2, 2, 3);
 plot(t1, abs(Evt));
 title("Spectrum of Rectified signal");
 xlabel("f");
 ylabel("Env(f)"); 
 
 
 Mu1=fft(mu);
 Mu=fftshift(Mu1);
 subplot(2, 2, 4);
 plot(t1, abs(Mu));
 title("Spectrum of Recovered signal");
 xlabel("f");
 ylabel("M_R(f)");



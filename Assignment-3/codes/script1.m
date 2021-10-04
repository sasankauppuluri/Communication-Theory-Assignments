fm=1000;
fc=10000;
Am=1;
Ac=10;
Kf=5000;
t= 0:(1/(100*fc)):2/fm;
mt=Am*cos(2*pi*fm*t);

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

%theta_t=2*pi*Kf*(Am*sin(2*pi*fm*t)/2*pi*fm);
theta_t=(Kf/fm)*Am*sin(2*pi*fm*t);
%theta_t=sin(2*pi*fm*t)/1000;

ufm=Ac*cos(2*pi*fc*t+ theta_t);
subplot(3,1, 3);
plot(t, ufm);
title("Modulated signal");
xlabel("t");
ylabel("U_F_M(t)");

%-------------------
 %vt=-Ac*((2*pi*fc)+2*pi*Kf*mt).*sin(2*pi*fc*t+theta_t);
 
 vt=diff(ufm)*100*fc;
 t1=0:(1/(100*fc)):(2/fm-(1/(100*fc)));
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
 ur = (evt - dc)/(2*pi*Kf*Ac);
 subplot(3, 1, 3);
 plot(t1, ur);
 title("Recovered signal");
 xlabel("t");
 ylabel("m_r(t)");
 
 %---------------------
 
 Mt1=fft(mt);
 Mt=fftshift(Mt1);
 figure();
 subplot(2, 2, 1);
 plot(t, abs(Mt));
 title("Spectrum of Recovered signal");
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
 
 Ur1=fft(ur);
 Ur=fftshift(Ur1);
 subplot(2, 2, 4);
 plot(t1, abs(Ur));
 title("Spectrum of Recovered signal");
 xlabel("f");
 ylabel("M_R(f)");
 


fm=100;
fc=1000;
fs=100000;
kf=0.06;

t=0:1/fs:0.05;

mt=sin(2*pi*fm*t);

figure();
subplot(3,1, 1);
plot(t, mt);
title("Message signal");
xlabel("t");
ylabel("m(t)");

ct=cos(2*pi*fc*t);
subplot(3,1, 2);
plot(t, ct);
title("Carrier signal");
xlabel("t");
ylabel("u_c(t)");


ufm=exp(j*(2*pi*fc*t+2*pi*kf*cumsum(mt)));
subplot(3,1, 3);
plot(t, real(ufm));
title("Modulated signal");
xlabel("t");
ylabel("U_F_M(t)");

filout=zeros(length(ufm));
vco=zeros(length(ufm));
phicap=zeros(length(ufm));
pdout=zeros(length(ufm));


phicap(1)=30; 
 
kp=0.15; 
ki=0.1;

for ii=2:length(ufm)
    
vco(ii)=conj(exp(j*(2*pi*ii*fc/fs+phicap(ii-1)))); 
pdout(ii)=imag(ufm(ii)*vco(ii)); 
filout(ii)=filout(ii-1)+(kp+ki)*pdout(ii)-ki*pdout(ii-1);
phicap(ii)=phicap(ii-1)+filout(ii);

end


figure();
subplot(3, 1, 1);
plot(t, filout);
title("PLL loop filter/integrator output");
xlabel("time");

subplot(3, 1, 2);
plot(t, real(vco));
title("VCO output");
xlabel("time");

subplot(3, 1, 3);
plot(t, pdout);
title("Phase detector output");
xlabel("time");

figure();
subplot(2, 1, 1);
plot(t(1:1000), mt(1:1000));
title("Original message signal");
xlabel("t");
ylabel("m(t)");

subplot(2, 1, 2);
plot(t(1:1000), filout(1:1000));
title("PLL loop filter/integrator output");
xlabel("time");
ylabel("m_r(t)");




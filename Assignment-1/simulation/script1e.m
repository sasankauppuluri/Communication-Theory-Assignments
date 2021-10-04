N=10;
%bs=[1, -1, -1, -1, 1, -1, 1,-1,1, 1 ]
bc=sign(-0.5 +rand(1, N));
bs=sign(-0.5 +rand(1, N));

fs=80;
fs1=2*fs;
t=0:1/fs:N+1;
uc=ones(size(t));

for(var=1:fs+1)
uc(var)=0;
end

for n=1:N
    for q=(fs*n+1):(fs*n+fs)
    uc(q)=bc(n)*uc(q);
    end
end

us=ones(size(t));

for(var=1:fs+1)
us(var)=0;
end

for n=1:N
    for q=(fs*n+1):(fs*n+fs)
    us(q)=bs(n)*us(q);
    end
end


t=0:1/fs:N+1;
fc=cos(40*pi*t);
fs=sin(40*pi*t);

up1=uc.*fc;
up2=us.*fs;
up=up1-up2;

h=rectangularPulse(0, 0.25, t);


%     theta=0;
%     t1= 0: 1/fs1 : N+1;
%     d1=(2*up).*cos(40*pi*t+theta);
%     i=conv(d1, h);  
%     figure();
%     subplot(2, 1, 1);
%     plot(t1, i);
%     subplot(2, 1, 2);
%     plot(t, uc);
%     
%     d2=(2*up).*sin(40*pi*t+theta);
%     q=conv(d2, h);
%     figure();
%     subplot(2, 1, 1);
%     plot(t1, -q);
%     subplot(2, 1, 2);
%     plot(t, us);
%     
    %---------------------
    
    theta=pi/4;
    t1= 0: 1/fs1 : N+1;
    d1=(2*up).*cos(40*pi*t+theta);
    i=conv(d1, h);  
    figure();
    subplot(2, 1, 1);
    plot(t1, i);
    subplot(2, 1, 2);
    plot(t, uc);
    
    d2=(2*up).*sin(40*pi*t+theta);
    q=conv(d2, h);
    figure();
    subplot(2, 1, 1);
    plot(t1, -q);
    subplot(2, 1, 2);
    plot(t, us);




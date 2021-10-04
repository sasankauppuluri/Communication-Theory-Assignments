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

    
    theta=pi/4;
    t1= 0: 1/fs1 : N+1;
    d1=(2*up).*cos(40*pi*t+theta);
    i=conv(d1, h);  
    %figure();
    %plot(t1, i);
    
    d2=-(2*up).*sin(40*pi*t+theta);
    q=conv(d2, h);
    %figure();
    %plot(t1, q);
    
    newuc=i*cos(theta)-q*sin(theta);
    newus=i*sin(theta)+q*cos(theta);
    
    figure();
    subplot(2, 1, 1); 
    plot(2*t1, newuc);
    title("Recovered Uc(t)");
    xlim([0, 11]);
    subplot(2, 1, 2);
    plot(t, uc);
    title("Original Uc(t)");
    xlim([0, 11]);
    
    figure();
    subplot(2, 1, 1);
    plot(2*t1, newus);
    title("Recovered Us(t)");
    xlim([0, 11]);
    subplot(2, 1, 2);
    plot(t, us);
    title("Original Us(t)");
    xlim([0, 11]);
    

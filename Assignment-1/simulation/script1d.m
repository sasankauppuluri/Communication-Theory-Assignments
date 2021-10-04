N=4;
bc=sign(-0.5 +rand(1, N));
bs=sign(-0.5 +rand(1, N));
% bc=[1, -1, 1, -1];
% bs=[-1, 1, -1, 1];

fs=240;
t=0:1/fs:N+1;
uc=ones(size(t));

for(var=1:fs+1)
uc(var)=0;
end

for n=1:N
    for i=(fs*n+1):(fs*n+fs)
    uc(i)=bc(n)*uc(i);
    end
end

us=ones(size(t));

for(var=1:fs+1)
us(var)=0;
end

for n=1:N
    for i=(fs*n+1):(fs*n+fs)
    us(i)=bs(n)*us(i);
    end
end


t=0:1/fs:N+1;
fc=cos(40*pi*t);
fs=sin(40*pi*t);

up1=uc.*fc;
up2=us.*fs;
up=up1-up2;

plot(t, up);
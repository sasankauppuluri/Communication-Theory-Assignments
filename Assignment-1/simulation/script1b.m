N=4;
bc=sign(-0.5 +rand(1, N));
bs=sign(-0.5 +rand(1, N));

fs=80;
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

t=0:1/fs:N+1;
fc=cos(40*pi*t);

up1=uc.*fc;
plot(t, up1);
title("up1(t) vs t");
xlabel("t");
ylabel("up1(t)=uc(t)cos(40*pi*t)");



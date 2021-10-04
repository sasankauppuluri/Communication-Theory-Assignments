N=10;
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

subplot(2, 1, 1);
plot(t, uc);
title("Uc(t)");
xlim([0, 11]);
xlabel("t");
ylabel("uc(t)");

us=ones(size(t));

for(var=1:fs+1)
us(var)=0;
end

for n=1:N
    for i=(fs*n+1):(fs*n+fs)
    us(i)=bs(n)*us(i);
    end
end

subplot(2, 1, 2);
plot(t, us);
xlim([0, 11]);
title("Us(t)");
xlabel("t");
ylabel("us(t)");


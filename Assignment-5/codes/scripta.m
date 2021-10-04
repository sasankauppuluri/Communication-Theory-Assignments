a = 0.25; % desired excess bandwidth
m = 32; %oversample by a lot to get smooth plot
length = 5; % where to truncate the time domain response
%(one-sided, multiple of symbol time)
[rc,time] = raised_cosine(a,m,length);
figure();
subplot(3,1,1);
plot(time,rc);
title("Excess bandwidth 25%");
xlabel("Normalised time");
ylabel("Raised cosine");
%-----------------

a = 0.5; % desired excess bandwidth
m = 32; %oversample by a lot to get smooth plot
length = 5; % where to truncate the time domain response
%(one-sided, multiple of symbol time)
[rc,time] = raised_cosine(a,m,length);
subplot(3,1,2);
plot(time,rc);
title("Excess bandwidth 50%");
xlabel("Normalised time");
ylabel("Raised cosine");

%-----------------

a = 1; % desired excess bandwidth
m = 32; %oversample by a lot to get smooth plot
length = 5; % where to truncate the time domain response
%(one-sided, multiple of symbol time)
[rc,time] = raised_cosine(a,m,length);
subplot(3,1,3);
plot(time,rc);
title("Excess bandwidth 100%");
xlabel("Normalised time");
ylabel("Raised cosine");
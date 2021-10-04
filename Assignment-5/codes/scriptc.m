a = 0.5; % desired excess bandwidth
m = 32;
length = 2; % where to truncate the time domain response
%(one-sided, multiple of symbol time)
[rc,time] = raised_cosine(a,m,length);
ts=1/32; %sampling interval
time_interval = 0:ts:1; %sampling time instants
signal_timedomain = rc; %sinusoidal pulse in our example
fs_desired = 1/64; %desired frequency granularity
Nmin = ceil(1/(fs_desired*ts)); %minimum length DFT for desired frequency granularity
Nfft = 2^(nextpow2(Nmin)); 
signal_freqdomain = ts*fft(signal_timedomain,Nfft);
signal_freqdomain_centered = fftshift(signal_freqdomain);
fs=1/(Nfft*ts); %actual frequency resolution attained
freqs = ((1:Nfft)-1-Nfft/2)*fs;
figure();
subplot(2, 1, 1);
obw( (abs(signal_freqdomain_centered).^2)/5, freqs, [], 95);

%-----------------------
length = 5; % where to truncate the time domain response
%(one-sided, multiple of symbol time)
[rc,time] = raised_cosine(a,m,length);
ts=1/32; %sampling interval
time_interval = 0:ts:1; %sampling time instants
signal_timedomain = rc; %sinusoidal pulse in our example
fs_desired = 1/64; %desired frequency granularity
Nmin = ceil(1/(fs_desired*ts)); %minimum length DFT for desired frequency granularity
Nfft = 2^(nextpow2(Nmin)); 
signal_freqdomain = ts*fft(signal_timedomain,Nfft);
signal_freqdomain_centered = fftshift(signal_freqdomain);
fs=1/(Nfft*ts); %actual frequency resolution attained
freqs = ((1:Nfft)-1-Nfft/2)*fs;
subplot(2, 1, 2);
obw( (abs(signal_freqdomain_centered).^2)/11, freqs, [], 95);

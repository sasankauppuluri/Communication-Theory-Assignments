
n=12000;
arr=randbit(n);
symbols=bpskmap(arr);

% Please note that this code
% is directly taken from Upamanyu Madhow 
% Code fragment 4.B.2

oversampling_factor = 4;
m = oversampling_factor;
%parameters for sampled raised cosine pulse
a = 0.5;
length = 10;% (truncated outside [-length*T,length*T])
%raised cosine transmit filter (time vector set to a dummy variable which is not used)
[transmit_filter,dummy] = raised_cosine(a,m,length);

%UPSAMPLE BY m
nsymbols_upsampled = 1+(n-1)*m;%length of upsampled symbol sequence
symbols_upsampled = zeros(nsymbols_upsampled,1);%initialize
symbols_upsampled(1:m:nsymbols_upsampled)=symbols;%insert symbols with spacing m
tx_output =1/m*conv(symbols_upsampled,transmit_filter);
%Adding noise
variance=1/(2*2.704);
awgn1=normrnd(0, sqrt(variance), [size(tx_output)]);
awgn2=normrnd(0, sqrt(variance), [size(tx_output)]);
figure();
plot(tx_output);
tx_output=tx_output+awgn1+1i*awgn2;

rx_output=conv(tx_output, raised_cosine(a,m,length));
figure();
plot(real(rx_output));
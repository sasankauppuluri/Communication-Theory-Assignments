a=0.5; 
n=12000; 
m=4; 

EbdivN0=2.704; % The value obtained in dB in script5 is converted to normal scale
variance=1/(2*EbdivN0);  %(\sigma)^2=N0/2, But Eb=1 for BPSK
                           %=> (\sigma)^2=1/2*(Eb/N0)

bitarr=randbit(n);
samples=bpskmap(bitarr);

samples_upsampled=1+(n-1)*m;
tx=zeros(samples_upsampled,1);

for ii=1:m:samples_upsampled
    tx(ii)=samples((floor((ii-1)/m))+1);
end


tx_filter=conv(tx, rcosdesign(a,n,m,'sqrt')); 

awgn1=normrnd(0, sqrt(variance), [size(tx_filter)]);
awgn2=normrnd(0, sqrt(variance), [size(tx_filter)]);
tx_filter=tx_filter+awgn1+(1i)*awgn2;

rx_filter=conv(tx_filter, rcosdesign(a,n,m,'sqrt'));

for ii=1:n
    rx_filter(ii)=rx_filter(4*ii+samples_upsampled);
end

  
%[output,nsymbols_upsampled,signal,symbols] = script4(sqrt(variance));
scatter(real(rx_filter(1:n)),imag(rx_filter(1:n)),'r');
title('Real v/s imaginary axis of decision statistics after filter output');
xlabel('Real axis');
ylabel('Imaginary axis');
clear all;
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
    tx(ii)=samples( (floor((ii-1)/m))+1);
end


tx_filter=conv(tx, rcosdesign(a,n,m,'sqrt')); 

awgn1=normrnd(0, sqrt(variance), [size(tx_filter)]);
awgn2=normrnd(0, sqrt(variance), [size(tx_filter)]);
tx_filter=tx_filter+awgn1+(1i)*awgn2;


rx_filter=conv(tx_filter, rcosdesign(a,n,m,'sqrt'));
nsym=120000;
for ii=1:n
    rx_filter(ii)=rx_filter(4*ii+samples_upsampled);
end


trans_out=zeros(n,1);
% This is the decision rule
for i=1:n
    if real(tx_filter(i))>=0
        trans_out(i)=1;
    else
        trans_out(i)=-1;
    end
end

meant=(trans_out==samples');
temp=sum(meant)/nsym;
Ptranerr=2*temp;
disp(Ptranerr);

rec_out=zeros(n,1);
%This is the decision rule
for i=1:n
    if real(rx_filter(i))>=0
        rec_out(i)=1;
    else
        rec_out(i)=-1;
    end
end

meanr=(rec_out==samples');
temp=sum(meanr)/n;
Precerr=2*(1-temp);
disp(Precerr);
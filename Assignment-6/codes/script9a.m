a=0.5; 
n=6000; 
m=4; 

EbdivN0=4.279; %  The value obtained in dB in script8 is converted to normal scale
variance=5/(4*EbdivN0); % Eb for 4-PAM is 5/2. 

bitarr=randbit(12000);
samples=fourpammap(bitarr);
samples_upsampled=1+(n-1)*m;
tx=zeros(samples_upsampled,1);

for ii=1:m:samples_upsampled
    tx(ii)=samples( (floor((ii-1)/m))+1);
end


transmit_filter=conv(tx, rcosdesign(a,n,m,'sqrt')); 

awgn1=normrnd(0, sqrt(variance), [size(transmit_filter)]);
awgn2=normrnd(0, sqrt(variance), [size(transmit_filter)]);
transmit_filter=transmit_filter+awgn1+(1i)*awgn2;


rx_filter=conv(transmit_filter, rcosdesign(a,n,m,'sqrt'));

for ii=1:n
    received_filter(ii)=rx_filter(4*ii+samples_upsampled);
end

  

scatter(real(received_filter(1:n)),imag(received_filter(1:n)),'r');
title('Real v/s imaginary axis of decision statistics after filter output');
xlabel('Real axis');
ylabel('Imaginary axis');

len=length(received_filter);

for ii=1:len 
        if(real(received_filter(ii))>=2) 
            received_filter(ii)=3;
        elseif (real(received_filter(ii))<-2)
            received_filter(ii)=-3;
        elseif (real(received_filter(ii))>=-2 && real(received_filter(ii))<0)
            received_filter(ii)=-1;
        elseif (real(received_filter(ii))>=0 && real(received_filter(ii))<2)
            received_filter(ii)=1;
        end 
end
    

errorout=nnz(received_filter-samples);
perr=errorout/n;

disp(perr);











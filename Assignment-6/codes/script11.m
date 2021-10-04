
%probability of error
    EbdivN0=0:0.01:10;
    ebno = 10.^(EbdivN0/10); 
    %biterrprob=1/2*erfc((( 6-3*sqrt(2))/2*sqrt(2))*ebno);
    biterrprob=1/2*erfc(0.6123*ebno);
    semilogy(EbdivN0, biterrprob);  %This function plots Log(y) vs x
    grid on;
    hold on;        
    y=10^-2; 
    x=10*log(erfcinv(2*y)/0.6213)/log(10);
     plot(x, y, 'ro'); %For intersection of x and y
    ylabel('Bit error proability');
    xlabel('E_b/N_0 (dB)');
    title('Ideal bit error probability for 8psk');
    
    EbbyN0=3.6479;
    variance=1/(6*EbbyN0);
    
a=0.5; 
n=4000; 
m=4;     
bitarr=randbit(12000);
samples=eightpskmap(bitarr);

samples_upsampled=1+(n-1)*m;
tx=zeros(samples_upsampled,1);

for ii=1:m:samples_upsampled
    tx(ii)=samples((floor((ii-1)/m))+1);
end


transmit_filter=conv(tx, rcosdesign(a,n,m,'sqrt')); 

awgn1=normrnd(0, sqrt(variance), [size(transmit_filter)]);
awgn2=normrnd(0, sqrt(variance), [size(transmit_filter)]);
transmit_filter=transmit_filter+awgn1+(1i)*awgn2;


rx_filter=conv(transmit_filter, rcosdesign(a,n,m,'sqrt'));

for ii=1:n
    received_filter(ii)=rx_filter(4*ii+samples_upsampled);
end


  
figure();
scatter(real(received_filter(1:n)),imag(received_filter(1:n)),'r');
title('Real v/s imaginary axis of decision statistics after filter output');
xlabel('Real axis');
ylabel('Imaginary axis');

len=length(received_filter);

for ii=1:len
        if(angle(received_filter(ii)) >= 7*pi/8) 
            received_filter(ii)= exp(1i*4*pi/4);
        
        elseif (angle(received_filter(ii)) >= 5*pi/8) 
            received_filter(ii)= exp(1i*3*pi/4);
        
        elseif (angle(received_filter(ii)) >= 3*pi/8) 
            received_filter(ii)= exp(1i*2*pi/4);
        
        elseif (angle(received_filter(ii)) >= pi/8) 
            received_filter(ii)= exp(1i*pi/4);
        
        elseif (angle(received_filter(ii)) >= -pi/8) 
            received_filter(ii)= exp(0);
        
        elseif (angle(received_filter(ii)) >= -3*pi/8) 
            received_filter(ii)= exp(1i*7*pi/4);
        
        elseif (angle(received_filter(ii)) >= -5*pi/8) 
            received_filter(ii)= exp(1i*6*pi/4);
        
        elseif (angle(received_filter(ii)) >= -7*pi/8)
            received_filter(ii)= exp(1i*5*pi/4);
        
        else
            received_filter(ii)= exp(1i*4*pi/4);
        end 
end
    
 errorout=nnz(received_filter-samples);
 perr=errorout/n;

disp(perr);


    
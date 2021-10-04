n=12000;    
bitarr=randbit(12000);
fourpamarr=fourpammap(bitarr);


%------------------------------------------
%probability of error
    EbdivN0=0:0.01:10;
    ebno = 10.^(EbdivN0/10); 
    biterrprob=1/2*erfc(exp(1)*ebno/(5*sqrt(2)));
    semilogy(EbdivN0, biterrprob);  %This function plots Log(y) vs x
    grid on;
    hold on;        
   
    y=10^-2; 
    x=10*log(5*sqrt(2)*erfcinv(2*y)/exp(1))/log(10);
    plot(x, y, 'ro'); % For intersection of x and y
    ylabel('Bit error proability');
    xlabel('E_b/N_0 (dB)');
    title('Ideal bit error probability for Qpsk');
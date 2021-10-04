% Please note that this script is written with the
% help of article on "erfc" function in mathworks website

EbdivN0=0:0.1:10;  %This is in dB

EbN0=10.^(EbdivN0/10); 
biterrprob=1/2*erfc(sqrt(EbN0)); %Writing Q function in terms of erfc
semilogy(EbdivN0, biterrprob);  %This function plots Log(y) vs x
grid on;
hold on;

y=10^-2; 
x=20*log(erfcinv(2*y))/log(10); %Calculating the x value at 10^-2

plot(x, y, 'ro'); % For intersection of x and y
ylabel('Bit error proability');
xlabel('E_b/N_0 (dB)');
title('Ideal bit error probability for Bpsk');
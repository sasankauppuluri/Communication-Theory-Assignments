n=100;
sigma=0.5; %You can change here for other values

%montecarlo simulation
n0=sigma.*randn(n,1);
n1=sigma.*randn(n,1);

%first example
r0=n0+1;
r1=n1;
figure();
scatter(r0, r1, 'o' );
set(gca, 'XAxisLocation', 'origin');

hold on;
n0=sigma.*randn(n,1);
n1=sigma.*randn(n,1);

%second example
r0=n0;
r1=n1+1;
scatter(r0, r1, '*' );
set(gca, 'YAxisLocation', 'origin');

title('Effect of noise on binary communication system \sigma=0.5');
xlabel('Symbol1');
ylabel('Symbol2');

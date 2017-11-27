function fft_calc(data)
signal=data';
[P, ~, MU] = polyfit((1:numel(signal)), signal, 5);
signal1 = polyval(P,(1:numel(signal)),[],MU);
signal2 = signal-signal1;

Fs=10;
T=1/Fs;
L=length(signal);
t=(0:L-1)*T;
x=signal2;

Y=fft(x);

f=Fs/2*linspace(0,1,L/2+1);
figure;
plot(f,(2*abs(Y(1:L/2+1))));
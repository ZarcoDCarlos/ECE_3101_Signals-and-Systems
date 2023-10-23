%FFT utility:
% Fourier Transform can be used to help filter out noise from a signal. The
% FFT converts the signal from the time domain to the frequency domain,
% then the PSD is used to filter out noise from the signal.
% notice the 3rd graph has spikes at 50hz and 120hz because our original
% signal has strong components of those signals

clear all, close all, clc

%% Create a simple signal with two frequencies
dt = .001; %sets the time step to 0.001 seconds
t = 0:dt:1; %time vector from 0 to 1 second with a time step of 0.001 seconds
f = sin(2*pi*50*t) + sin(2*pi*120*t); % Sum of 2 frequencies
fnoise = f + 2.5*randn(size(t));  %  Add some noise

%% Compute the Fast Fourier Transform FFT
n = length(t);
fhat = fft(fnoise,n);       % Compute the fast Fourier transform
PSD = fhat.*conj(fhat)/n; % Power spectrum (power per freq)
freq = 1/(dt*n)*(0:n); % Create x-axis of frequencies in Hz
L = 1:floor(n/2);   % Only plot the first half of freqs

%% Use the PSD to filter out noise
indices = PSD>100;  % Find all freqs with large power
PSDclean = PSD.*indices;  % Zero out all others
fhat = indices.*fhat;  % Zero out small Fourier coeffs. in Y
ffilt = ifft(fhat); % Inverse FFT for filtered time signal

%% PLOTS
subplot(3,1,1)
plot(t,fnoise,'r','LineWidth',1.2), hold on
plot(t,f,'k','LineWidth',1.5)
legend('Noisy','Clean')

subplot(3,1,2)
plot(t,f,'k','LineWidth',1.5), hold on
plot(t,ffilt,'b','LineWidth',1.2)
legend('Clean','Filtered')

subplot(3,1,3)
plot(freq(L),PSD(L),'r','LineWidth',1.5), hold on
plot(freq(L),PSDclean(L),'-b','LineWidth',1.2)
legend('Noisy','Filtered')
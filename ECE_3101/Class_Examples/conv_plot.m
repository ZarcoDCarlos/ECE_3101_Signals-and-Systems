clear all
clc
% Time vector
t = 0:0.01:10;
% Ramp signal
ramp = t;
% Rectangular pulse
pulse_duration = 2;
rect_pulse = zeros(size(t));
rect_pulse(t < pulse_duration) = 1;
% Prepare for convolution
len_ramp = length(ramp);
len_pulse = length(rect_pulse);
conv_length = len_ramp + len_pulse - 1;
t_conv = 0:0.01:(conv_length-1)*0.01; % Time vector for convolution result
manual_conv_result = zeros(1, conv_length);
% Number of steps to visualize
steps_to_show = 150; % Display every 150 steps; you can adjust this number
% Manually compute convolution with visualization
for n = 1:conv_length
temp_result = zeros(1, len_ramp);
for k = 1:len_pulse
if (n - k + 1) > 0 && (n - k + 1) <= len_ramp
temp_result(n - k + 1) = rect_pulse(k) * ramp(n - k + 1);
manual_conv_result(n) = manual_conv_result(n) + temp_result(n - k + 1);
end
end
% Visualize every 'steps_to_show' steps
if mod(n, steps_to_show) == 0 || n == conv_length
figure;
% Original Ramp Signal
subplot(4,1,1);
plot(t, ramp);
title('Ramp Signal');
xlabel('Time');
ylabel('Amplitude');
% Flipped and Shifted Rectangular Pulse
shifted_pulse = [zeros(1, n) flip(rect_pulse) zeros(1, conv_length - n - len_pulse + 1)];
t_shifted = 0:0.01:(length(shifted_pulse)-1)*0.01;
subplot(4,1,2);
plot(t_shifted, shifted_pulse);
title(['Flipped Pulse (Shift = ' num2str(n) ')']);
xlabel('Time');
ylabel('Amplitude');
% Overlapping Product
subplot(4,1,3);
plot(t, temp_result);
title('Product of Ramp and Shifted Pulse');
xlabel('Time');
ylabel('Amplitude');
% Cumulative Convolution Result
subplot(4,1,4);
plot(t_conv(1:n), manual_conv_result(1:n));
title('Cumulative Convolution Result');
xlabel('Time');
ylabel('Amplitude');
end
end
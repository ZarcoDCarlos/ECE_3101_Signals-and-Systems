n =-10:10;  %how wide the x axis is
b = -(step(t+1)).*(step(t+3)); %function 


%graph the following (x, y)
stem(n,b);

%graph labels:
xlabel('n');
ylabel('b[n]');
title('1b. Discrete-time Signal b[n] = u[-n+1] * u[n+3]');

%unit step function
function y = step(t)
    y = zeros(size(t));
    y(t>=0) = 1;
end

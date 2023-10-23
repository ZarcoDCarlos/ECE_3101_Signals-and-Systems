n =-10:10; %how wide the x axis is
a = ((n-1).^2).*((step(n+4))-(step(n-2)));

%graph the following (x, y)
stem(n,a);

%graph labels:
xlabel('n');
ylabel('a[n]');
title('1a. Discrete-time Signal a[n] = (n-1)^2 *(u[n+4] -u[n-2])');

%unit step function
function y = step(t)
    y = zeros(size(t));
    y(t>=0) = 1;
end
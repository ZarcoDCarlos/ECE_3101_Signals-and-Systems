n =-10:10; %how wide the x axis is
c = (2.*(step(n+3)))-(2.*(step(n-2)))-(step(n-4));

%graph the following (x, y)
stem(n,c);

%graph labels:
xlabel('n');
ylabel('c[n]');
title('1c. Discrete-time Signal c[n] = 2u[n+3]-2u[n-2]- u[n-4]');

%unit step function
function y = step(t)
    y = zeros(size(t));
    y(t>=0) = 1;
end

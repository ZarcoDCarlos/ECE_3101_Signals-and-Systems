n =-10:10; %how wide the x axis is
%c = (2.*(step(n+3)))-(2.*(step(n-2)))-(step(n-4));
x = (6-n).*(step(n)-step(n-6));
%graph the following (x, y)

y = zeros(size(n));
for i=1:length(n)
    if (8-3*n(i))>=-10 && (8-3*n(i))<=10
        y(i) = x(8-3*n(i)+11);
    end
end
stem(n,y);

%graph labels:
xlabel('n');
ylabel('y[n]');
title('Graph of y[n] where y[n] = x[8-3n] and x[n] = (6-n)[u(n)-u(n-6)]');

%unit step function
function y = step(t)
    y = zeros(size(t));
    y(t>=0) = 1;
end

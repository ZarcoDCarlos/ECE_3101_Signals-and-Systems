%1a. graph of y1(n)
%how wide the x axis is
n = -10:10;

%signal x[n]
x = (2.*(step(n+3)))-(2.*(step(n-2)))-(step(n-4));

%signal y1[n]
y1 = (2.*(step(-n+6))) - (2.*(step(-n+1))) - (step(-n-1)); %to solve for y1, plug in (-n+3) for every n in x(n)

%graph the following (x, y)
stem(n,y1);

%graph labels:
xlabel('n');
ylabel('y1[n]');
title('Graph of y1[n] = x(-n+3)');

%unit step function
function y = step(t)
    y = zeros(size(t));
    y(t>=0) = 1;
end

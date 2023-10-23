%how wide the x axis is
n = -10:10;
%1b. graph of y2(n)
%signal x[n]
x = (2.*(step(n+3)))-(2.*(step(n-2)))-(step(n-4));

%signal y2[n]
y2 = zeros(size(n)); %creates new signal w same size as input signal n
for i=1:length(n) %iterate each value of n
    if (-n(i)^2+1)>=-10 && (-n(i)^2+1)<=10 
        y2(i) = x(-n(i)^2+1+11);
    end
end

%graph the following (x, y)
stem(n,y2);

%graph labels:
xlabel('n');
ylabel('y2[n]');
title('Graph of y2[n] = x(-n^2 + 1)');

%unit step function
function y = step(t)
    y = zeros(size(t));
    y(t>=0) = 1;
end

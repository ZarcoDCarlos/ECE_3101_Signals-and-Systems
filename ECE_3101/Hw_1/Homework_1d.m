n = -10:10;
c = (2.*(step(n+3)))-(2.*(step(n-2)))-(step(n-4));
y = zeros(size(n));
for i=1:length(n)
    if (-n(i)^2+1)>=-10 && (-n(i)^2+1)<=10
        y(i) = c(-n(i)^2+1+11);
    end
end
stem(n,y);

%graph labels:
xlabel('n');
ylabel('c[-n^2+1]');
title('Graph of c[-n^2+1] where c[n] = 2u[n+3]-2u[n-2]- u[n-4]');

%unit step function
function y = step(t)
    y = zeros(size(t));
    y(t>=0) = 1;
end

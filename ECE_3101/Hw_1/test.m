t =-10:10;
y = -(step(t+2));
stem(t,y);

function y = step(t)
    y = zeros(size(t));
    y(t>=0) = 1;
end
 %% here i developed the unit function I used for these hw problems
 %% on unit impulse graph stuff
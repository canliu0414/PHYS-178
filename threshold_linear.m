function y = threshold_linear(x)

for i = 1:length(x)
    if x(i)>0
        y(i)=x(i);
    else y(i)=0;
    end
    y = y';
end

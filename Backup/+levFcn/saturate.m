function u = saturate(x, limits)
    for i = 1:length(x)
        if x(i) < limits(1)
            x(i) = limits(1);
        elseif x(i) > limits(2)
            x(i) = limits(2);
        end
    end
    u = x;
end
function [value] = spect(f,alpha)

for i=1:length(f)
    value(i) = (4*alpha*(1-alpha))/abs(1-(1-2*alpha)*exp(1i*2*pi*f(i)))^2;
end

end


function [u] = generateBinarySignal(alpha, lims, N)

w = 2*(rand(N,1)>alpha)-1;

s(1) = 1;
for i=2:N
    s(i) = w(i)*s(i-1);
end

u = maprange(s,lims);

end


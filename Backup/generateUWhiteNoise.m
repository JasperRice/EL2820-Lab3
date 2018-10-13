function [u] = generateUWhiteNoise(lims,N)

random_val = rand(N,1).';
rng('shuffle')
u = maprange(random_val, lims);

end


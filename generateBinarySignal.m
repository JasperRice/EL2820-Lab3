function u = generateBinarySignal(alpha, lims, N)
    %% Initialization
    w = 2 * (rand(N,1) > alpha) - 1;
    u = zeros(N,1);
    
    %% Initial value of u
    if w(1) == -1
        u(1) = lims(2);
    else
        u(1) = lims(1);
    end
    
    %% Rest values of u
    for i = 2 : N
        if w(i) == -1
            if u(i-1) == lims(1)
                u(i) = lims(2);
            else
                u(i) = lims(1);
            end
        else
            u(i) = u(i-1);
        end
    end
end
function [y_dec, t_dec] = decimate_fx(y, Fs)
    N = floor(length(y)/2);
    y_dec = zeros(1, N);
    
    for i = 1:N
        y_dec(i) = (y(2*i-1) + y(2*i)) / 2;
    end
    
    t_dec = (0:N-1)/(Fs/2);
end
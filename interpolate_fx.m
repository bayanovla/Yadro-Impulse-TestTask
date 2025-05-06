function [y_interp, t_interp] = interpolate_fx(y, Fs)
    N = length(y);
    y_interp = zeros(1, 2*N - 1);
    
    % Линейная интерполяция
    for i = 1:N-1
        y_interp(2*i-1) = y(i);
        y_interp(2*i)   = (y(i) + y(i+1)) / 2;
    end
    y_interp(end) = y(end);

    t_interp = (0:length(y_interp)-1)/(2*Fs);
end
function [t, y] = sine_generator(Fs, f, duration)
    t = 0:1/Fs:duration - 1/Fs;
    y = sin(2*pi*f*t);
end

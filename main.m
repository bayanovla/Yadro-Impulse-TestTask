clear all; clc
set(0,'DefaultLineLinewidth',1.5);
Fs = 100;
duration = 1;
f_vect = 0:1:50;
errors = zeros(size(f_vect));

for i = 1:length(f_vect)
    f = f_vect(i);
    [t, y] = sine_generator(Fs, f, duration);

    [y_dec, ~] = decimate_fx(y, Fs);
    [y_rec, ~] = interpolate_fx(y_dec, Fs);

    L = min(length(y), length(y_rec));
    y_trim = y(1:L);
    y_rec_trim = y_rec(1:L);

    % Среднеквадратичная ошибка
    errors(i) = sqrt(mean((y_trim - y_rec_trim).^2));
end

plot(f_vect, errors, 'k-o');
xlabel('Частота, Гц');
ylabel('Среднеквадратичная ошибка');
title('Среднеквадратичная ошибка между входными и выходными данными в зависимости от f');
grid on;
handle_mas = findobj('type', 'axes');
set(handle_mas, 'FontSize', 14)
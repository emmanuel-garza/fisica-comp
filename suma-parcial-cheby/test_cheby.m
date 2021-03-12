%
% Script para demostrar la convergencia de la regla trapezoidal para funciones
% no-periodicas y periodicas
%
close all;
clear all;

%
% Funcion de prueba
%
f_fun = @(u, v) u.^2 + v + u.*v.^3;


% n_vec = [2, 4, 6,  8,  10, 15, 20, 50, 100, 120, 140, 160, 180, 200];
n_vec = [10, 15, 20, 50, 100, 120, 140, 160, 180, 200, 300, 400, 600, 800, 1000];
% n_vec = [10, 15, 20, 50, 100:20:400];
time_vec = 0*n_vec;
time_vec_ps = 0*n_vec;

for ind = 1:length(n_vec)

    n = n_vec(ind);

    tic;
    f_transform = cheby_transform_2d(f_fun, n);
    time_vec(ind) = toc

    tic;
    f_transform = cheby_transform_2d_partialsum(f_fun, n);
    time_vec_ps(ind) = toc



end


%
% En escala logaritmica realmente podemos ver como se comporta el error
%
hfig = figure(1)
loglog(n_vec, time_vec, '-ok', 'LineWidth', 3, 'MarkerSize', 10, 'MarkerFaceColor', 'c');
hold on;
loglog(n_vec, time_vec_ps, '-dr', 'LineWidth', 3, 'MarkerSize', 10, 'MarkerFaceColor', 'k');

loglog(n_vec, (n_vec/100).^4, '--k', 'LineWidth', 3);
loglog(n_vec, (n_vec/1200).^3, '--r', 'LineWidth', 3);
hold off;
grid on;
legend('Direct', 'Partial Sum', '$\mathcal{O}(N^4)$', '$\mathcal{O}(N^3)$', 'interpreter', 'latex');
xlabel('Number of points per dimension');
ylabel('Time (s)');
title('Time Comparison for the 2D Chebyshev Transform','interpreter','latex')
pretty_plot(hfig, 25);
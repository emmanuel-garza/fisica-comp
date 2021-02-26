%
% Script para demostrar la convergencia de la regla trapezoidal para funciones
% no-periodicas y periodicas
%
close all;
clear all;

%
% Funcion de prueba
%
f_fun = @(x) exp(1/sqrt(2) * sin(x));

int_exact_pi4 = 1.033247157375863;
int_exact_2pi = 7.09347072432924;


%
% Convergencia para intervalo no-periodico
%
a = 0;
b = pi/4;
flag_periodic = 0;

n_vec_no = [2, 3, 4, 5, 10, 15, 20, 50, 100, 500, 1000];
err_no_per = 0*n_vec_no;


for ind = 1:length(n_vec_no)

    res = trapezoidal(f_fun, a, b, n_vec_no(ind), flag_periodic);

    err_no_per(ind) = abs(res-int_exact_pi4);

end


%
% Mismo experimento pero en intervalo periodico
%
a = 0;
b = 2*pi;
flag_periodic = 1;

n_vec = [2, 4, 6,  8,  10, 15, 20, 50, 100, 500, 1000];
err_per = 0*n_vec;

for ind = 1:length(n_vec)

    res = trapezoidal(f_fun, a, b, n_vec(ind), flag_periodic);

    err_per(ind) = abs(res-int_exact_2pi);

end

%
% Grafica mala
%
figure(1)
plot(n_vec_no, err_no_per)
hold on;
plot(n_vec, err_per)
hold off;

%
% En escala logaritmica realmente podemos ver como se comporta el error
%
figure(2)
loglog(n_vec_no, err_no_per, '-ok', 'LineWidth', 3, 'MarkerSize', 10, 'MarkerFaceColor', 'c');
hold on;
loglog(n_vec, err_per, '-dr', 'LineWidth', 3, 'MarkerSize', 10, 'MarkerFaceColor', 'k');
hold off;
grid on;
legend('Non-Periodic', 'Periodic');
xlabel('Number of points');
ylabel('Error');
title('Error for $\int_a^b \exp(\frac{1}{\sqrt{2}} \sin{x}) dx$','interpreter','latex')
pretty_plot(2, 25);


%
% Escala logaritmica para el error y lineal para el numero de puntos tambien
% illustra el comportamiento de manera adecauda
%
figure(3)
semilogy(n_vec_no, err_no_per, '-ok', 'LineWidth', 3, 'MarkerSize', 10, 'MarkerFaceColor', 'c');
hold on;
semilogy(n_vec, err_per, '-dr', 'LineWidth', 3, 'MarkerSize', 10, 'MarkerFaceColor', 'k');
hold off;
axis([0 50 1e-12 1e0]);
grid on;
legend('Non-Periodic', 'Periodic');
xlabel('Number of points');
ylabel('Error');
title('Error for $\int_a^b \exp(\frac{1}{\sqrt{2}} \sin{x}) dx$','interpreter','latex')
pretty_plot(3, 25);



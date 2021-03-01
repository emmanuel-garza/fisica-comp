
clear all;
close all;

%
% Convergencia en la derivada de la funcion de Runge
%
n_vec = 2:2:50;
err_vec = 0*n_vec;

for ind = 1:length(n_vec)

    [D, D_F, F, x_i, th_i] = cheby_der_matrix(n_vec(ind));

    f_i = exp( 1 ./ (1 + 0.25.*x_i.^2) );
    df_dx_exact = -exp( 1 ./ (1 + 0.25.*x_i.^2) ) .* x_i ./ ...
        (2 * (1 + 0.25.*x_i.^2).^2 );

    % Derivada Numerica
    df_dx_i = D * f_i;

    err_vec(ind) = max(abs(df_dx_i-df_dx_exact));

end

figure(1)
loglog(2*n_vec, err_vec, '-ok', 'LineWidth', 3, 'MarkerSize', 10, 'MarkerFaceColor', 'c');
grid on;
legend('Chebyshev Derivative');
xlabel('Number of points');
ylabel('Error');
title('Error in $\frac{d}{dx}\big[ \exp{\big(\frac{1}{1+0.25x^2} \big)} \big]$','interpreter','latex')
pretty_plot(1, 25);


figure(2)
semilogy(2*n_vec, err_vec, '-ok', 'LineWidth', 3, 'MarkerSize', 10, 'MarkerFaceColor', 'c');
grid on;
legend('Chebyshev Derivative');
xlabel('Number of points');
ylabel('Error');
title('Error in $\frac{d}{dx}\big[ \exp{\big(\frac{1}{1+0.25x^2} \big)} \big]$','interpreter','latex')
pretty_plot(2, 25);


% 
% Para visualizar la malla de Chebyshev
%
n = 20;
[D, D_F, F, x_i, th_i] = cheby_der_matrix(n);

f_i = exp( 1 ./ (1 + 0.25.*x_i.^2) );


figure(3)
plot(x_i, f_i, '-ok', 'LineWidth', 2, 'MarkerSize', 8, 'MarkerFaceColor', 'c');
ax = axis;
hold on;

for ind = 1:length(x_i)
    plot([x_i(ind), x_i(ind)], [ax(3), ax(4)], '--r');
end

% Para poner las lineas atras
set(gca, 'Children', flipud(get(gca, 'Children')) )

hold off;
title('$ f(x) = \exp{\big(\frac{1}{1+0.25x^2} \big)}$','interpreter','latex')
xlabel('$x$', 'interpreter', 'latex')
ylabel('$f(x)$', 'interpreter', 'latex')
grid on;
pretty_plot(3, 25);

figure(4)
plot(th_i, f_i, '-ok', 'LineWidth', 2, 'MarkerSize', 8, 'MarkerFaceColor', 'c');
ax = axis;
hold on;

for ind = 1:length(x_i)
    plot([th_i(ind), th_i(ind)], [ax(3), ax(4)], '--r');
end

% Para poner las lineas atras
set(gca, 'Children', flipud(get(gca, 'Children')) )

hold off;
title('$f(x) = \exp{\big(\frac{1}{1+0.25x^2} \big)}$','interpreter','latex')
xlabel('$\theta$', 'interpreter', 'latex')
ylabel('$f(\cos(\theta))$', 'interpreter', 'latex')
grid on;
pretty_plot(4, 25);



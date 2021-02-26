%
% Por conveniencia pasamos el numero de puntos entre dos en vez del numero
% total de puntos, de esta manera nos aseguramos de que sea par el numero
% total
%
function [F, x_i, m_vec] = fourier_matrix(n, a, b)

    % Numero total de puntos
    n_pts = 2*n;

    %
    % Malla para la regla trapezoidal
    % Tomamos el apostrofe para hacer la transpuesta y poder tener un vector
    % columna para hacer matrix-vector multiply en caso de que el usuario use
    % x_i
    %
    x_i = linspace(a, b, n_pts+1);
    x_i = x_i(1:end-1)'; 

    % Periodo
    p = b-a;

    %
    % Vector con el orden de los coeficientes de fourier
    %
    m_vec = [(0:n), (-n+1:-1)]';

    %
    % En MATLAB hay que evitar hacer loops y usar operaciones vectorizadas
    % cuando sea posible
    %
    [X_i, M_j] = meshgrid(x_i, m_vec);

    F = 1 / (2*n) * exp( -1i * 2 * pi / p * M_j .* X_i );

end
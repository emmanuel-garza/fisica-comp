n = 40;
a = 0;
b = 2*pi;

[F, x_i] = fourier_matrix(n, a, b);

%
% Loop la base estandard
%
N = 2*n;
A = zeros(N, N);
for ind = 1:N 

    ej = zeros(N, 1);
    ej(ind) = 1;

    % Agregar la normalizacion que no esta en MATLAB
    A(:,ind) = fft(ej) / N;

end

norm(A - F)


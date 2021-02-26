%
% Script para probar la matrix de Fourier
%
n = 10;
a = 0;
b = 2*pi;


[F, x_i] = fourier_matrix(n, a, b);

f_val = exp(1i*x_i) - 15 * exp(-10i*x_i) ;

my_fft = F*f_val;


%
% El numero total de puntos es 2*n, asi que la normalizacion de matlab
% requiere dividir por 2n
%
fft_matlab = fft(f_val) / (2*n);

norm(my_fft-fft_matlab)



f_val = exp(2*sin(x_i)) .* cos(2*x_i-4);

my_fft = F*f_val;
fft_matlab = fft(f_val) / (2*n);

norm(my_fft-fft_matlab)



close all;

a = -1;
b = 1;
n_pts = 10;

x_i = linspace(a, b, n_pts);

f_i = x_i;

figure(1)
plot(x_i, f_i, '-ok', 'LineWidth', 2, 'MarkerSize', 8, 'MarkerFaceColor', 'c');
hold on;

% Chebyshev Grid
th_i = linspace(0, 2*pi, n_pts);
x_i = cos(th_i);

f_i = x_i.^2;

plot(x_i, f_i, '-ok', 'LineWidth', 2, 'MarkerSize', 8, 'MarkerFaceColor', 'r');

figure(2)
plot(th_i, f_i, '-ok', 'LineWidth', 2, 'MarkerSize', 8, 'MarkerFaceColor', 'r');


%
% Using the fourier matrix
% 
n = 10;
d_th = pi/n;
[F, th_i, m_vec] = fourier_matrix(n, 0+d_th/2, 2*pi+d_th/2);

% Shift th_i to avoid 1/sin(th) for th = 0/pi/2pi
% th_i = th_i + (th_i(2) - th_i(1)) / 2;

x_i = cos(th_i);
f_i = x_i.^8;

c_m = F * f_i;

% Derivative matrix
[M_j, TH_i] = meshgrid(m_vec, th_i);
D_f = -1./sin(TH_i) .* (1i .* M_j) .* exp(1i .* M_j .* TH_i);

f_der = D_f * c_m

f_der - 8 * x_i.^7


[D, D_F, F, x_i, th_i] = cheby_der_matrix(n);
D * f_i - 8 * x_i.^7


x_a = x_i(1)
th_a = acos(x_a);

8 * x_a ^7
df_dx = -sum(c_m .* (1i * m_vec) .* exp(1i * m_vec * th_a) ) / sin(th_a) 



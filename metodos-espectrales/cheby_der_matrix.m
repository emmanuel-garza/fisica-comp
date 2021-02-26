%
% Para esta funcion asumimos que el dominio de definicion esde [-1, 1]
% -> Si no, se puede hacer una escala lineal directa
%
function [D, D_F, F, x_i, th_i] = cheby_der_matrix(n)

    d_th = pi/n;

    [F, th_i, m_vec] = fourier_matrix(n, 0+d_th/2, 2*pi+d_th/2);

    x_i = cos(th_i);

    [M_j, TH_i] = meshgrid(m_vec, th_i);
    D_F = -1./sin(TH_i) .* (1i .* M_j) .* exp(1i .* M_j .* TH_i);

    D = D_F * F;

end
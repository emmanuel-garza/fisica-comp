function f_transform = cheby_transform_2d_partialsum(f, N)

    %
    % Get the chebyshev  weights and nodes
    % 
    [x_k, w_k] = fejer_quad1(N);

    %
    % Create a matrix of all the Chebyshev Polynomials evaluated at the nodes
    %
    m_vec = 0:N-1;

    [X, M] = meshgrid(x_k, m_vec);

    T_M = cos( M .* acos(X) );

    %
    % Evaluate our function at the nodes
    %
    U = X;
    V = X';

    f_ij = feval(f, U, V);

    f_transform = 0 * f_ij;
    partial_sum = 0 * f_ij;

    %
    % Compute the "line functions"
    %
    for n = 0:N-1

        % T_n(u_i)
        T_n = repmat( T_M(n+1, :), N, 1);

        % Sum along the 'u' direction
        partial_sum(:, n+1) = sum(f_ij .* T_n, 2);

    end

    for m = 0:N-1

        % T_m(v_j)
        T_m = repmat( T_M(m+1, :), N, 1)';

        
        % Sum along the v-direction
        f_transform(m+1, :) = f_transform(m+1, :) + sum( partial_sum(:,:) .* T_m, 1 );


    end

    %
    % Normalize -> The factor is different when n or m = 0
    %
    f_transform(:, 2:end) = f_transform(:, 2:end) * 2;
    f_transform(2:end, :) = f_transform(2:end, :) * 2;

    f_transform = f_transform / (N.^2);



end
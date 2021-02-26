%
% Funcion que calcula la integral usando la regla trapezoidal
%
function res = trapezoidal(fun, a, b, n_pts, flag_periodic)

    % Si el problema es periodico, quitamos el ultimo punto
    if flag_periodic == 1

        x_i = linspace(a, b, n_pts+1);
        x_i = x_i(1:end-1); 

        % Evaluar la funcion en los nodos
        f_i = feval(fun, x_i);

        % Tambien podriamos tomar dx = x_i(2) - x_i(1)
        dx = (b-a) / (n_pts);

        % La integral es solo la suma 
        res = dx * sum(f_i); 

        return;

    else
        
        x_i = linspace(a, b, n_pts);

        % Evaluar la funcion en los nodos
        f_i = feval(fun, x_i);

        % Tambien podriamos tomar dx = x_i(2) - x_i(1)
        dx = (b-a) / (n_pts-1);

        % En el caso no periodico el primer y ultimo elemento contribuyen la mitad
        res = (b-a) / (n_pts-1) * (sum(f_i) - 1/2 * (f_i(1) + f_i(end))); 

    end

end
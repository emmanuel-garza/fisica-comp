%
% Returns the nodes and weights for Fejer's first quadrature
%
function [x_k, w_k] = fejer_quad1( N )

k = 0:N-1;

w_k = k*0;
theta_k = pi/N*(2*k+1);

for ind1 = 1:floor(N/2)
 
  w_k = w_k + cos(ind1*theta_k)./(4*ind1.^2-1);
  
end

w_k = 2/N*(1-2*w_k);
x_k = cos( ((2*k+1)/2)*pi/N );


end

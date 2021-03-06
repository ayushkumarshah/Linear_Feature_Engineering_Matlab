function [Z] = create_polynomial_model(X, order)
% create_polynomial_model: Create polynomial model of input 'order'

[p, N] = size(X);
Z = ones(order * p + 1, N);
for i = 1:order
    Z(2 + (i - 1) * p: 1 + (i * p), :) = X .^ i;
end

end


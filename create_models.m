function [Z] = create_models(X, order)
% Create additional models from existing models

[p, N] = size(X);

Z = ones(order * p + 1, N);
for i = 1:order
    Z(2 + (i - 1) * p: 1 + (i * p), :) = X .^ i;
end

end


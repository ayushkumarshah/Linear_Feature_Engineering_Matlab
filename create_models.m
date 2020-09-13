function [models] = create_models(X, order_best)
% create_models: Create models for the data

models = create_custom_models(X);
models("Poly_order_"+order_best) = create_polynomial_model(X, order_best);

end


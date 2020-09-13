function [R_train, R_val, models, order_best] = fit_models(X, Y, K, orders)

% Custom model engineering
models = create_custom_models(X);
num_models = models.Count + 1;

% Fit models

R_train = zeros(num_models, 1);
R_val = zeros(num_models, 1);

[R_train(1), R_val(1), order_best] = poly_selection_fit(X, Y, K, orders);
models("Poly_order_"+order_best) = create_polynomial_model(X, order_best);

order = -1;  % not used inside the function estimate_errors_kfold
for i=2:num_models
    model = values(models);
    model = model{i-1};
    [R_train(i), R_val(i)] = estimate_errors_kfold(X, Y, K, order, model);
end

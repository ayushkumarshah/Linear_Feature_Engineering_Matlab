function [R_train_best, R_val_best, order_best] = poly_selection_fit(X, Y, K, orders)

R_train = zeros(length(orders), 1);
R_val = zeros(length(orders), 1);

for o = orders
    [R_train(o+1), R_val(o+1)] = estimate_errors_kfold(X, Y, K, o);
end

% Table of errors
orders = orders';
errors = table(orders, R_train, R_val);
disp(errors);

plot_errors(R_train, R_val, orders);

% Polynomial Model selection
[R_train_best, R_val_best, order_best] = select_poly_model(R_train, R_val, orders);

end



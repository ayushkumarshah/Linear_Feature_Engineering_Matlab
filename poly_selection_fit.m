function [R_train_best, R_test_best, order_best] = poly_selection_fit(X, Y, K, orders)

R_train = zeros(length(orders), 1);
R_test = zeros(length(orders), 1);

for o = orders
    [R_train(o+1), R_test(o+1)] = estimate_errors_kfold(X, Y, K, o);
end

% Table of errors
orders = orders';
errors = table(orders, R_train, R_test);
disp(errors);

plot_errors(R_train, R_test, orders);

% Model selection
[R_train_best, R_test_best, order_best] = select_model(R_train, R_test, orders);

end



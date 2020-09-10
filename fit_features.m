function [R_train, R_test, features, feature_names] = fit_features(X, Y, K, orders)

% Custom feature engineering
features = create_custom_features(X);
num_features = features.Count + 1;

% Fit features

R_train = zeros(num_features, 1);
R_test = zeros(num_features, 1);

[R_train(1), R_test(1), order_best] = poly_selection_fit(X, Y, K, orders);

order = -1;  % not used
for i=2:num_features
    feature = values(features);
    feature = feature{i-1};
    [R_train(i), R_test(i)] = estimate_errors_kfold(X, Y, K, order, feature);
end

feature_names = get_feature_names(features, order_best);

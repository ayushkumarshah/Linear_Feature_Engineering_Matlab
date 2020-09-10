function [R_train_best] = best_fit()
warning('off','all');

traindata = importdata('traindata.txt');
X = traindata(:, 1:8)';
Y = traindata(:, 9);

N = length(Y);
orders = 0:10;
K = 10;

% Fit different features
[R_train, R_test, features, feature_names] = fit_features(X, Y, K, orders);

errors = table(feature_names, R_train, R_test);
fprintf('\n\n')
disp(errors);

% Train whole data on best model
Z = features('Z_3');
[~, R_train_best] = least_squares(Z, Y);
R_train_best = R_train_best / N;
% y_pred = w' * Z;
disp("Best training error = " + R_train_best);
end






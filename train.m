function [w_best, name_best_model, order_best, R_train_best, y_pred_train] = train(varargin)
% Find the best fit among various approximations

warning('off','all');

traindata = importdata('traindata.txt');
X = traindata(:, 1:8)';
Y = traindata(:, 9);

if nargin == 2
    orders = varargin{1};
    K = varargin{2};
else
    orders = 0:10;
    K = 10;
end

N = length(Y);

% Fit different models
[R_train, R_val, models, order_best] = fit_models(X, Y, K, orders);

% Display errors for different functions
model_names = get_model_names(models);
errors = table(model_names, R_train, R_val);
fprintf('\n\n')
disp(errors);

% Get best model with least validation error
[Z_best, name_best_model] = get_best_model(models, R_val);

% Train whole data on best model
[w_best, R_train_best, y_pred_train] = least_squares(Z_best, Y);
R_train_best = R_train_best / N;
disp("Training error on whole data using the best model " + name_best_model + " = " + R_train_best);

end
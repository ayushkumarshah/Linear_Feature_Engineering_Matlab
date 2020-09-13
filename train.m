% function [w, R_train_best, y_pred] = train(varargin)
% Find the best fit among various approximations

warning('off','all');

traindata = importdata('traindata.txt');
X = traindata(:, 1:8)';
Y = traindata(:, 9);

% if nargin == 2
%     orders = varargin{1};
%     K = varargin{2};
% else
    orders = 0:10;
    K = 10;
% end

N = length(Y);

% Fit different models
[R_train, R_val, models] = fit_models(X, Y, K, orders);

% Display errors for different functions
model_names = get_model_names(models);
errors = table(model_names, R_train, R_val);
fprintf('\n\n')
disp(errors);

% Get best model with least validation error
% Z = get_best_model(models, R_val);

% Train whole data on best model

Z = models('Z_3');
[w, R_train_best, y_pred] = least_squares(Z, Y);
R_train_best = R_train_best / N;
disp("Best training error = " + R_train_best);

% end
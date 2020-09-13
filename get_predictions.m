function [y_pred] = get_predictions(varargin)
% Get test predictions

if nargin == 2
    orders = varargin{1};
    K = varargin{2};
else
    orders = 0:10;
    K = 10;
end

X_test = importdata('testinputs.txt')';

% Train the models
[w_best, name_best_model, order_best] = train(orders, K);

% Fit the test data to the best model
models = create_models(X_test, order_best);
Z_best = models(name_best_model);

% Calculate predictions using the best model
y_pred = (w_best' * Z_best)';

% Write pedictions to file
fileID = fopen('predictions.txt', 'w');
fprintf(fileID, '%f\n',y_pred);
fclose(fileID);
end


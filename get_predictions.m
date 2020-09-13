function [y_pred] = get_predictions(varargin)
% get_predictions: Get the test predictions and write it to a file

if nargin == 2
    orders = varargin{1};
    K = varargin{2};
else
    orders = 0:10;
    K = 10;
end

% Import test data
X_test = importdata('data/testinputs.txt')';

% Train the models
[w_best, name_best_model, order_best] = train(orders, K);

% Create features on the test data using the best model
models = create_models(X_test, order_best);
Z_best = models(name_best_model);

% Calculate predictions using the best model
y_pred = (w_best' * Z_best)';
fprintf('Predictions on test data generated \n');

% Write pedictions to file
fileID = fopen('results/predictions.txt', 'w');
fprintf(fileID, '%f\n',y_pred);
fclose(fileID);
fprintf('Predictions written to the file results/predictions.txt \n');
end

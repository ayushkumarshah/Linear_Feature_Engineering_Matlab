function [y_pred] = get_predictions(varargin)
% Get test predictions

if nargin == 2
    orders = varargin{1};
    K = varargin{2};
else
    orders = 0:10;
    K = 10;
end
w = train(orders, K);

X_test = importdata('testinputs.txt');

y_pred = w' * Z;
end


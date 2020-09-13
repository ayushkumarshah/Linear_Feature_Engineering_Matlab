function [R_train_avg, R_val_avg] = estimate_errors_kfold(X, Y, K, order, model)
% estimate_errors_kfold: Estimate errors using K-fold Cross validation
% using the input cuustom model or the polynomial model of input order

N = size(X, 2);
chunk_size = floor(N / K);
R_train = zeros(1, K);
R_val = zeros(1, K);

for k = 1: K
    if nargin > 4
        % Select the given input model 
        Z = model; 
    else
        % Create polynomial model of input order
        Z = create_polynomial_model(X, order); 
    end
    
    % Create indices for train and validation split
    val_idx_start = 1 + (k-1) * chunk_size;
    val_idx_end = k * chunk_size;
    train_idx = [1: val_idx_start - 1 val_idx_end + 1: N];
    val_idx = val_idx_start: val_idx_end;
    
    % Split the data into train and validation sets
    Z_val = Z(:, val_idx);
    Y_val = Y(val_idx);
    
    Z_train = Z(:, train_idx);
    Y_train = Y(train_idx);

    % Train the model on the training set
    [w, Rtrain] = least_squares(Z_train, Y_train);
    R_train(k) = Rtrain / length(Y_train);
    
    % Test the model on the validation set
    Y_pred = w' * Z_val;
    R_val(k) = (norm(Y_val - Y_pred') ^ 2) / length(Y_val);

end

% Calculate the average training and validation errors
R_train_avg = mean(R_train);
R_val_avg = mean(R_val);

end


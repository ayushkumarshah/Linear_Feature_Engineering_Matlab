function [R_train_avg, R_val_avg] = estimate_errors_kfold(X, Y, K, order, model)

N = size(X, 2);
chunk_size = floor(N / K);

R_train = zeros(1, K);
R_val = zeros(1, K);

for k = 1: K
    if nargin > 4
        Z = model;
    else
        Z = create_models(X, order);
    end
    val_idx_start = 1 + (k-1) * chunk_size;
    val_idx_end = k * chunk_size;
    train_idx = [1: val_idx_start - 1 val_idx_end + 1: N];
    val_idx = val_idx_start: val_idx_end;
    
    Z_val = Z(:, val_idx);
    Y_val = Y(val_idx);
    
    Z_train = Z(:, train_idx);
    Y_train = Y(train_idx);

    [w, Rtrain] = least_squares(Z_train, Y_train);
    R_train(k) = Rtrain / length(Y_train);
    
    Y_pred = w' * Z_val;
    R_val(k) = (norm(Y_val - Y_pred') ^ 2) / length(Y_val);

end

R_train_avg = mean(R_train);
R_val_avg = mean(R_val);

end


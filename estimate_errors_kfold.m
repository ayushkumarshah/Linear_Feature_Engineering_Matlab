function [R_train_avg, R_test_avg] = estimate_errors_kfold(X, Y, K, order, feature)

N = size(X, 2);
chunk_size = floor(N / K);

R_train = zeros(1, K);
R_test = zeros(1, K);

for k = 1: K
    if nargin > 4
        Z = feature;
    else
        Z = create_features(X, order);
    end
    test_idx_start = 1 + (k-1) * chunk_size;
    test_idx_end = k * chunk_size;
    train_idx = [1: test_idx_start - 1 test_idx_end + 1: N];
    test_idx = test_idx_start: test_idx_end;
    
    Z_test = Z(:, test_idx);
    Y_test = Y(test_idx);
    
    Z_train = Z(:, train_idx);
    Y_train = Y(train_idx);

    [w, Rtrain] = least_squares(Z_train, Y_train);
    R_train(k) = Rtrain / length(Y_train);
    
    Y_pred = w' * Z_test;
    R_test(k) = (norm(Y_test - Y_pred') ^ 2) / length(Y_test);

end

R_train_avg = mean(R_train);
R_test_avg = mean(R_test);

end


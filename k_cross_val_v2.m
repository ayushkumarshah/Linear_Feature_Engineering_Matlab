function [maes] = k_cross_val_v2()

traindata = importdata('traindata.txt');
X = traindata(:, 1:8)';
Y = traindata(:, 9);

[~, N] = size(X);
K = 10;
chunk_size = floor(N / K);

% try different functions
Z = [X; X.^2; X.^3; ones(1, N); sin(X); cos(X)];

R_train_sum = 0;
R_test_sum = 0;
for k = 1: K
    test_idx = ((k-1) * chunk_size) + 1 : k * chunk_size;
    train_idx1 = 1: (k-1) * chunk_size;
    train_idx2 = (k * chunk_size) + 1: N;

    test_Z = Z(:,test_idx);
    test_Y = Y(test_idx);
    train_Z = [Z(:, train_idx1), Z(:, train_idx2)];
    train_Y = [Y(train_idx1); Y(train_idx2)];

    [w, R_train] = mae(train_Y, train_Z);
    R_train_sum = R_train_sum + R_train;
    test_Y_pred = w' * test_Z;
    R_test = norm(test_Y - test_Y_pred');
    R_test_sum = R_test_sum+ R_test;
end

% Mean Absolute Error
maes = [R_train_sum / K, R_test_sum / K];



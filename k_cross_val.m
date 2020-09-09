function [errors] = k_cross_val()

traindata = importdata('traindata.txt');
X = traindata(:, 1:8)';
Y = traindata(:, 9);

[p, N] = size(X);
K = 5;
chunk_size = round(N / K);
orders = 0:6;

train_errors = zeros(length(orders), 1);
test_errors = zeros(length(orders), 1);

for o = orders
    Z = ones(o * p + 1, N);
    for i = 1:o
        Z(2 + (i - 1) * p: 1 + (i * p), :) = X .^ i;
    end
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
        
        [w, R_train] = least_squares(train_Y, train_Z);
        R_train_sum = R_train_sum + R_train;
        test_Y_pred = w' * test_Z;
        R_test = norm(test_Y - test_Y_pred');
        R_test_sum = R_test_sum+ R_test;
    end
    train_errors(o+1) = R_train_sum / K;
    test_errors(o+1) = R_test_sum / K;
end

% Table of errors
orders = orders';
errors = table(orders , train_errors, test_errors);
errors.Variables =  round(errors.Variables, 4);

% Plot errors
figure;
lw = 3; % line width
plot(orders, train_errors,'LineWidth',lw);
hold on;
ylim([0, 0.1]);
plot(orders, test_errors,'LineWidth',lw);
legend('training error','test error')
title('Cross validation');
xlabel('order');
ylabel('R');

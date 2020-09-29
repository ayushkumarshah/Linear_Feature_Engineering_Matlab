% C3_Overfitting Exercise 23
function [errors] = k_cross_val(X, y)

% X = [0.23 0.88 0.21 0.92 0.49 0.62 0.77 0.52 0.30 0.19];
% y = [0.19; 0.96; 0.33; 0.80; 0.46; 0.45; 0.67; 0.32; 0.38; 0.37];

N = length(X);
K = 5;
orders = 0:10;

train_errors = zeros(length(orders), 1);
test_errors = zeros(length(orders), 1);

for p = orders
    Z = ones(p+1, N);
    for i=1:p
        Z(i+1,:) = X.^i;
    end
    R_train_sum = 0;
    R_test_sum = 0;
    for k = 1:K
        test_idx = ((k-1) * N / K) + 1 : k * N / K;
        train_idx1 = 1: (k-1) * N / K;
        train_idx2 = (k * N / K) + 1: N;
        
        test_Z = Z(:,test_idx);
        test_y = y(test_idx);
        train_Z = [Z(:, train_idx1), Z(:, train_idx2)];
        train_y = [y(train_idx1); y(train_idx2)];
        
        [w, R_train] = least_squares_general_v2(train_y, train_Z);
        R_train_sum = R_train_sum + (R_train / length(train_y));
        test_y_pred = w' * test_Z;
        R_test = norm(test_y - test_y_pred') ^ 2;
        R_test_sum = R_test_sum + (R_test / length(test_y));
    end
    train_errors(p+1) = R_train_sum / K;
    test_errors(p+1) = R_test_sum / K;
end

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

% Table of errors
orders = orders';
errors = table(orders , train_errors, test_errors);
errors.Variables =  round(errors.Variables, 4);

% Model selection
[~, min_idx] = min(test_errors);
order_best = orders(min_idx);


Z = ones(order_best + 1, N);
for i=1: order_best
    Z(i+1,:) = X.^i;
end

% Train whole data on best model
[w, R] = least_squares(y, Z);
y_pred = w' * Z;
disp(R);

% Plot best model on data
figure;
scatter(X, y);
hold on;
scatter(X, y_pred);
end



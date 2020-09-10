function [R_train_best,R_test_best, order_best] = select_model(R_train, R_test, orders)
%   Select best fitting polynomial model with least test error

[~, min_idx] = min(R_test);
order_best = orders(min_idx);
disp("Best fitting polynomial order = " + order_best); 

R_train_best = R_train(min_idx);
R_test_best = R_test(min_idx);
end


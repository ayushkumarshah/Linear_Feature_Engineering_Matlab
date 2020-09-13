function [R_train_best,R_val_best, order_best] = get_best_model(R_val, orders)
% Select best model

[~, min_idx] = min(R_val);
order_best = orders(min_idx);
disp("Best fitting polynomial order = " + order_best); 

R_train_best = R_train(min_idx);
R_val_best = R_val(min_idx);
end


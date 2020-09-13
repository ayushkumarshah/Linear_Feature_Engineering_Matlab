function [R_train_best,R_val_best, order_best] = select_poly_model(R_train, R_val, orders)
% select_poly_model: Select the best fitting polynomial model with 
% least validation error

[~, min_idx] = min(R_val);
order_best = orders(min_idx);
disp("Order of best fitting polynomial model = " + order_best); 

R_train_best = R_train(min_idx);
R_val_best = R_val(min_idx);
end


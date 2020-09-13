function [model, model_name] = get_best_model(models, R_val)
% get_best_model: Select best model with least validation error

[~, min_idx] = min(R_val);
key = keys(models);
model_name = key{min_idx};
model = models(model_name);
disp("Best model with least validation error = " + key{min_idx}); 

end


function [model, model_name] = get_best_model(models, R_val)
% Select best model

[~, min_idx] = min(R_val);
key = keys(models);
model_name = key{min_idx};
model = models(model_name);
disp("Best model = " + key{min_idx}); 

end


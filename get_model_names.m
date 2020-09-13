function [model_names] = get_model_names(models)
% get_model_names: Get names of the models

num_models = models.Count;
model_names = strings(num_models, 1);
for i=1:num_models
    labels = keys(models);
    model_names(i) = labels{i};
end
end


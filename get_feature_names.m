function [feature_names] = get_feature_names(features, order_best)
% Get feature names

num_features = features.Count + 1;
feature_names = strings(num_features, 1);
feature_names(1) = "Polynomial of order " + order_best;
for i=2:num_features
    labels = keys(features);
    feature_names(i) = labels{i-1};
end
end


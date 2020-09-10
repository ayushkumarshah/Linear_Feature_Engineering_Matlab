function [features] = create_custom_features(X)
% Create custom features

N = size(X, 2);
features = containers.Map;
features('Z_2') = [ X.^2; X.^3; X.^0.1; X.^0.2; ones(1, N)];
features('Z_3') = [ X.^2; X.^3; X.^0.1; X.^0.2; ones(1, N); sin(X); cos(X)];
features('Z_4') = [X; X.^2; X.^3; X.^4; ones(1, N); sin(X); cos(X)];
end


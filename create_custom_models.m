function [models] = create_custom_models(X)
% create_custom_models: Create custom models for the data

N = size(X, 2);
models = containers.Map;
models('Z_2') = [ X.^2; X.^3; X.^0.1; X.^0.2; ones(1, N)];
models('Z_3') = [ X.^2; X.^3; X.^0.1; X.^0.2; ones(1, N); sin(X); cos(X)];
models('Z_4') = [X; X.^2; X.^3; X.^4; ones(1, N); sin(X); cos(X)];
end

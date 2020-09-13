function [models] = create_custom_models(X)
% create_custom_models: Create custom models for the data

N = size(X, 2);
models = containers.Map;
models('Z_01') = [ X.^2; X.^3; X.^0.1; X.^0.2; X.^0.3; X.^0.4; X.^0.5; X.^0.6; X.^0.7; ones(1, N)];

models('Z_02') = [ X; X.^2; X.^3; X.^0.1; X.^0.2; ones(1, N)];
models('Z_03') = [ X.^2; X.^3; X.^0.1; X.^0.2; ones(1, N)];

models('Z_04') = [ones(1, N); sin(X); cos(X)];
models('Z_05') = [sin(X).^2; cos(X).^2; ones(1, N) ];

models('Z_06') = [X; X.^2; X.^3; ones(1, N); sin(X); cos(X)];

models('Z_07') = [ X.^2; X.^3; X.^0.1; X.^0.2; ones(1, N); sin(X)]; 
models('Z_08') = [X; X.^2; X.^3; X.^4; ones(1, N); sin(X); cos(X)];

models('Z_09') = [ X.^2; X.^3; X.^0.1; X.^0.2; ones(1, N); sin(X); cos(X)];

models('Z_10') = [ X.^2; X.^3; X.^0.1; X.^0.2; ones(1, N); sin(X); cos(X); tan(X)];
models('Z_11') = [ X.^2; X.^3; X.^0.1; X.^0.2; X.^0.5; ones(1, N); sin(X); cos(X); tan(X)];

models('Z_12') = [X.^-1; ones(1, N)];
models('Z_13') = [X.^-1; X.^-2; ones(1, N)];
models('Z_14') = [ log10(X); ones(1, N)];
models('Z_15') = [X; X.^2; X.^3; log10(X); ones(1, N)];
models('Z_16') = [X; X.^2; X.^3; X.^-1; ones(1, N)];

end

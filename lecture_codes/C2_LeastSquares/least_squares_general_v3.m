% C2_LS Exercise 15, 16, 17
function [w, R] = least_squares_general_v3(X, y)

% X = [0.23 0.88 0.21 0.92 0.49 0.62 0.77 0.52 0.30 0.19];
% y = [0.19; 0.96; 0.33; 0.80; 0.46; 0.45; 0.67; 0.32; 0.38; 0.37];

% Basis expansion - simple (Ex 15)
% Z = [X ; ones(size(X))];

% Basis expansion (Ex 16)
% Z = [X ; ones(size(X)); X.^2];

% Basis expansion (Ex 17)
Z = [sin(2*X) ; log(X); X.^0.5];

s = Z * y;
M = Z * Z';
w = M \ s;

% prediction error
y_pred = w' * Z;
R = norm(y - y_pred') ^ 2;

end



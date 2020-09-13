function [w, R, y_pred] = least_squares(Z, y)
% least_squares: Perform least squares algorithm on the data

s = Z * y;
M = Z * Z';
w = M \ s;

% prediction error
y_pred = w' * Z;
R = norm(y - y_pred') ^ 2;
end
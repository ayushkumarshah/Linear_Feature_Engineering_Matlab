function [w, R] = least_squares(y, Z)

s = Z * y;
M = Z * Z';
w = M \ s;

% prediction error
y_pred = w' * Z;
R = norm(y - y_pred');

end
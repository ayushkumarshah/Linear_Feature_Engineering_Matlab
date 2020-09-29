% C2_LS Exercise 14
function [w, R] = least_squares_general_v2(y, Z)

% y = [0.9; 1.0; 1.1; 1.2];
% Z = [[0.1; 0.5], [0.2; 0.6], [0.3; 0.7], [0.4; 0.7]];

s = Z * y;
M = Z * Z';
w = M \ s;

% prediction error
y_pred = w' * Z;
R = norm(y - y_pred') ^ 2;

end
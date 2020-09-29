% C2_LS Exercise 14
function [w, R] = least_squares_general(y, Z)

% y = [0.9; 1.0; 1.1; 1.2];
% Z = [[0.1; 0.5], [0.2; 0.6], [0.3; 0.7], [0.4; 0.7]];

[p, n] = size(Z);
s = zeros(p, 1);
M = zeros(p, p);

for i=1:n
    z = Z(:, i);
    s = s + z * y(i);
    M = M + z * z';
end

w = solve(M, s);
% w = M \ s;

% R = 0;
% for i=1:n
%     y_pred = w' * Z(:,i);
%     R = R + (y(i) - y_pred) ^ 2;
% end

% prediction error : simpler way
y_pred = w' * Z;
R = norm(y - y_pred') ^ 2;

end
% C2_LS Exercise 10
function [a, R] = least_squares(x, y)

% x = [0.23; 0.88; 0.21; 0.92; 0.49; 0.62; 0.77; 0.52; 0.30; 0.19];
% y = [0.19; 0.96; 0.33; 0.80; 0.46; 0.45; 0.67; 0.32; 0.38; 0.37];

n = length(x);

num = 0;
den = 0;
for i=1:n
    num = num + x(i) .* y(i);
    den = den + x(i) .* x(i);
end

a = num / den;

R = 0;
for i=1:n
    R = R + (a * x(i) - y(i)) ^ 2;
end

figure;
scatter(x, y);
hold on;
title('Fitting line using least squares');
xlabel('x');
ylabel('y');

plot(x, a * x);  
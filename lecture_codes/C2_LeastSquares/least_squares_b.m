% C2_LS Exercise 12
function [a, b, R] = least_squares_b(x, y)

% x = [0.23; 0.88; 0.21; 0.92; 0.49; 0.62; 0.77; 0.52; 0.30; 0.19];
% y = [0.19; 0.96; 0.33; 0.80; 0.46; 0.45; 0.67; 0.32; 0.38; 0.37];

xy =  x .* y;
x_square =  x .* x;

x_mean = mean(x);
y_mean = mean(y);
xy_mean = mean(xy);
x_square_mean = mean(x_square);

b_num = y_mean -  (x_mean * xy_mean / x_square_mean);
b_den = 1 - x_mean ^ 2 / x_square_mean;
b = b_num / b_den;
a = (y_mean - b) / x_mean;

R = norm(a * x + b - y) ^ 2;

% plot the fitted line
figure;
scatter(x, y);
hold on;
title('Fitting line using least squares');
xlabel('x');
ylabel('y');
plot(x, a * x + b);  

% plotting R vs a
A=0:0.1:2;
r = zeros(1, length(A));
for i=1:length(A)
    r(i) = norm(A(i) * x + b - y) ^ 2;
end

figure;
title('R vs a');
xlabel('a');
ylabel('R');
plot(A, r);  

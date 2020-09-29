function [x] = back_substitute(A, b)

% [N, ~] = size(A);
N = size(A, 1);
x = zeros(N, 1);

% Method 1
% for i = N:-1:1
%     sum = 0;
%     for j = i+1: N
%         sum = sum + A(i, j) * x(j);
%     end
%     x(i) = (b(i) - sum) / A(i,i) ;
% end

% Method 2
% for i = N:-1:1
%     sum = b(i);
%     for j = i+1: N
%         sum = sum - A(i, j) * x(j);
%     end
%     x(i) = 1/A(i,i) * sum;
% end

% Method 3
for i = N:-1:1    
    x(i) = b(i) - A(i,i+1:N) * x(i+1:N);
    x(i) = x(i) / A(i,i);
end



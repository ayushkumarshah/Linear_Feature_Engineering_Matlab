function [A, b] = make_ut(A, b)

N = size(A, 1);

for i=1:N
    for j=i+1:N
        c = - A(j, i) / A(i, i);
        A(j,:) = A(j, :) + c * A(i, :);
        b(j) = b(j) + c * b(i);
    end
end
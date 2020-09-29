function [x] = solve(A, b)
% Solve linear system of equations Ax = b
[A, b] = make_ut(A, b);
x = back_substitute(A, b);
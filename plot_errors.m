function plot_errors(R_train, R_val, orders)
% plot_errors: Plot cross validation errors on polynomial models of
% different orders

fprintf("Generating plot ... \n");
figure;
lw = 3; % line width
plot(orders, R_train, 'LineWidth', lw);
hold on;
ylim([0, 1000]);
plot(orders, R_val, 'LineWidth', lw);
legend('training error','val error')
title('Cross validation results on polynomial models of different orders');
xlabel('order');
ylabel('R');

end


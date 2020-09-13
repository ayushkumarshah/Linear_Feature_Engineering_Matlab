function plot_errors(R_train, R_val, orders)
% plot_errors: Plot cross validation errors on polynomial models of
% different orders and save it

fprintf('Generating plot of cross validation results ... \n');
figure;
lw = 3; % line width
plot(orders, R_train, 'LineWidth', lw);
hold on;
ylim([0, 1000]);
plot(orders, R_val, 'LineWidth', lw);
legend('training error','validation error')
title('Cross validation results on polynomial models of different orders');
xlabel('order');
ylabel('R');

saveas(gcf,'results/cross_val_poly.png')
fprintf('Plot written to results/cross_val_poly.png\n\n')

end
function plot_errors(R_train, R_test, orders)
% Plot errors

figure;
lw = 3; % line width
plot(orders, R_train, 'LineWidth', lw);
hold on;
ylim([0, 1000]);
plot(orders, R_test, 'LineWidth', lw);
legend('training error','test error')
title('Cross validation');
xlabel('order');
ylabel('R');

end


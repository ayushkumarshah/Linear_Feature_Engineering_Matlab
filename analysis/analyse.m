% Data analysis

traindata = importdata('../traindata.txt');
X = traindata(:, 1:8);
Y = traindata(:, 9);

% Features Correlation plot
figure;
for k = 1:8
    data = rand(1,10);
    subplot(4, 4, k)
    scatter(X(:, k), Y);
end
% corrplot(X);

% Features Correlation values
corre = corrcoef(traindata);
disp(corre(9, :));

gplotmatrix(traindata);

% Features Correlation values plot
figure;
type = "Kendall";
C = corr(traindata,'type',type);
heatmap(C, 'ColorLimits',[0 1],'Title', type + " Correlation");


% PCA for visualization
mu = mean(X);
r = range(X);
X = (X - mu) ./ r;
[P, S, V] = pca(X);

figure;
scatter(S(:, 1), Y);
figure;
scatter3(S(:,1), S(:,2), Y);






function p2

clear all;
close all;
hold on;

X = [-1 0 1];
Y = e.^X;

P = @(x) 0.54308 .* x .^2 + 1.17520 .* x + 1;
_X = -1:0.05:1;

f = @(x) e.^x;

plot(_X, f(_X), 'b', 'DisplayName', 'e^x', 'LineWidth', 3 );
plot(_X, P(_X), 'r', 'DisplayName', 'Least Squares', 'LineWidth', 3 );
scatter(X, Y, 50, 'k', 'filled', 'DisplayName', 'Interpolating Points');
legend('show');

end

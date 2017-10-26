function p2

clear all;
close all;
hold on;

P = @(x) 0.17518.*x.^3 + 0.54290.*x.^2 + 0.99893.*x + 0.99462
_X = -1:0.05:1;

f = @(x) e.^x;

plot(_X, f(_X), 'b', 'DisplayName', 'e^x', 'LineWidth', 3 );
plot(_X, P(_X), 'r', 'DisplayName', 'T3 Interpolating Polynomial', 'LineWidth', 3 );
legend('show');

end

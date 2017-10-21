x = [0 1 2];
y = [0 1 2];
v = [1 1];

%% Natural Cubic Spline
p_nat = csape(x,y,'variational');
p_nat.coefs % Display the coefficients

%% Clamped Cubic Spline
p_cla = csape(x, y, 'clamped', v);
p_cla.coefs % Display the coefficients

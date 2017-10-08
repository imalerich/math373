function p4a

f = @(t) 3.*t.*exp(t) - exp(2.*t);
df= @(t) exp(t) .* (3.*t - 2.*exp(t) + 3);

x = [1 1.05];
y = f(x);
d = df(x);

Q = Hermiteinterpolation(x,y,d);

H = @(t) Q(1,1) + Q(2,2)*(t-x(1)) + ...
	Q(3,3)*(t-x(1))^2 + ...
	Q(4,4)*(t-x(1))^2*(t-x(2));

% Compute our results
actual = f(1.03)
est = H(1.03)
ERR = abs(actual - est)

end

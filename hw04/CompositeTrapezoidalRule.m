function v = CompositeTrapezoidalRule(f, a, b, n)

	h = (b-a)/n;
	x = (a+h):h:b;

	j = 1:(n-1);

	part = 2 * sum(f(x(j)));
	inner = f(a) + part + f(b);

	v = (h/2) * inner;
end

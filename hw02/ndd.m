function res = ndd(x, xi, fi)

M = divideddifference(xi, fi);
n = length(M);
res = 0;

X = 1;
for i=1:n
	C =  M(i,i);
	res = res + C * X;
	X = X * (x - xi(i));
end

end

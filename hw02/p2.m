function p2

x = 0.43;
xi = [0 0.25 0.5 0.75];
fi = [1 1.64872 2.71828 4.48169];

%% Neville's Method

% degree one
neville(x, xi(:,2:3), fi(:,2:3))
% degree two
neville(x, xi(:,2:4), fi(:,2:4))
% degree three
neville(x, xi(:,1:4), fi(:,1:4))

%% Newton's Divided-Difference

% degree one
ndd(x, xi(:,2:3), fi(:,2:3))
% degree two
ndd(x, xi(:,2:4), fi(:,2:4))
% degree three
ndd(x, xi(:,1:3), fi(:,1:3))

end

function BF_10 = BayesFactorPref(f,n)

% n is the vector containing the number of comparisons for each subject
% f is the vector containing the fraction of 1 for each subject
syms w  
y = round(n.*f);

V = var(f);

ksi = mean(f);
 
eqn = V == ksi*(1-ksi)/(1+1/w);
S = solve(eqn,w);
w= double(S); 

G = numel(y);

%% Numerical computation of the Bayes Factor
f1 = @(i, ksi) prod((1:y(i))'-1+ksi/w,1);
f2 = @(i, ksi) prod((1:(n(i)-y(i)))'-1+(1-ksi)/w,1);
f3 = @(i) prod((i:n(i))-1+1/w);

fun = @(ksi) integrand(f1, f2, f3, G, ksi);
H1 = integral(fun, 0.5,1);
H0 = integral(fun, 0,0.5);

BF_10= double(H1/H0); %A Bayes factor above 1 means than H1 is more strongly supported than H0.
 
end

function v = integrand(f1, f2, f3,  G, ksi)
v  =zeros(G, numel(ksi));
for i = 1:G
    v(i,:) = f1(i, ksi).*f2(i, ksi)./f3(i);
end
v = prod(v,1);
end
 


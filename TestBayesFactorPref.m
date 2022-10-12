 

N = 10; %Number of participants
 
n = 15*ones(N,1); % n is the vector containing the number of comparisons for each subject

n_repetitions = 200;

n_preferences = 20;
preference = linspace(0.5,0.9,n_preferences);
 

BF_10 = zeros(n_repetitions, n_preferences);
for k = 1:n_preferences
    for j = 1:n_repetitions

        f = zeros(N,1);
        for i = 1:N
            % Generate random values
            f(i) = binornd(n(i),preference(k),1)/n(i); % f is the vector containing the fraction of 1 for each participant
        end

        BF_10(j,k) = BayesFactorPref(f,n);
    end
end

graphics_style

if n_preferences == 1
    figure()
    histogram(BF_10)

    figure()
    histogram(log10(BF_10))
else

    p = ones(1,n_repetitions)'*preference;
   

    X = [reshape(p, [], 1),reshape(log10(BF_10),[],1)];
    
    fig = figure()
    fig.Color =  background_color;
    hist3(X,'CdataMode','auto', 'Nbins', [n_preferences,100])
    ylabel('log10(BF)')
    xlabel('Preference')
    colorbar
    view(2)
end
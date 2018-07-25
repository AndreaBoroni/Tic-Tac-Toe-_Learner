%% Tic Tac Toe Learner
value = 0.5*ones(3^9,9);
nn = zeros(size(value));

sol = importdata('Solution.mat');

xx = [1 2 3 4 5 6 7 8 9];
yy = [1 2 7 20 1000 -20 -7 -2 -1];
P = polyfit(xx,yy,8);
f = @(n,m) qfunc((n-50000)/25000)./polyval(P,m);
mm = f(50000,1:9);
adjustment_function = @(n,m) f(n,m) + (0.5 - mm(m));
temperature = @(x) qfunc((x-50000)/25000);

B = [0 2 0; 1 0 0; 1 0 0];
state = getState(B);
game = [];
w = [];
% learning process
for nGames = 1:100000
    [m,s,r] = playGame(value,nGames);
    for k = 1:length(m)
        %adj = adjustment_function(nGames,length(m) + 1 - k)*0.08;
        adj = 0.05;
        nn(s(k),m(k)) = nn(s(k),m(k)) + 1;
        if r == 1
            value(s(k),m(k)) = value(s(k),m(k)) + adj;
        elseif r == 2
            value(s(k),m(k)) = value(s(k),m(k)) - adj;
        % draw
        elseif value(s(k),m(k)) < 0.5
            value(s(k),m(k)) = value(s(k),m(k)) + adj;
        else %value(s(k),m(k)) > 0.5
            value(s(k),m(k)) = value(s(k),m(k)) - adj;
        end
        value(s(k),m(k)) = max(value(s(k),m(k)),0.01);
        value(s(k),m(k)) = min(value(s(k),m(k)),0.99);
    end
    game = [game r];
    if mod(nGames,1000) == 0
        if nGames > 1000
            draws = sum(ismember(game(end-1000:end),-1));
            fprintf('draws = %d/1000 ', draws);
        end
        fprintf('nGames = %d temp = %.2f nn = %d %.2f %.2f %.2f %.2f %.2f %.2f %.2f %.2f %.2f', nGames, temperature(nGames), sum(nn(state,:)), value(state,:));
        fprintf('\n')
    end
    if mod(nGames,10000) == 0
        [ww, o] = runTest(value,sol);
%         fprintf('wrong %2.2f\n',ww);
        w = [w ww];
        pause(1);
    end
end

%% Solving Tic Tac Toe with brute force

global solution;
solution = zeros(3^9,1);
solve(newBoard);



















function [m,s,r] = playGame(value,nGames)
B = newBoard();
temperature = @(x) qfunc((x-50000)/25000);
turn = 1;
m = [];
s = [];
temp = temperature(nGames);
while true
    state = getState(B);
    b = [B(1,:) B(2,:) B(3,:)];
    legal_moves = b == 0;
    v = value(state,:);
    if turn == 2
        v = ones(1,9) - v;
    end
    v = v.*legal_moves;
    v_norm = v./sum(v);
    if rand(1) > temp
        [~,move] = max(v_norm);
        m = [m move];
    else
        m = [m randsample(9,1,true,v_norm)];
    end
    
    s = [s state];
    b(m(end)) = turn;
    B = reshape(b,[3 3])';
    
    r = isGameOver(B);
    %r = testOver(B);
    if r ~= 0
        return
    end
    turn = mod(turn,2) + 1;
end
end
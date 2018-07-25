function r = test(B,value,turn)
global sol
state = getState(B);
if sol(state) ~= 0
    isStateLegal(state);
    r = sol(state);
    return
end

r = isGameOver(B);
if r ~= 0
    sol(state) = r;
    isStateLegal(state);
    return
end

b = [B(1,:) B(2,:) B(3,:)];
if turn == 1
    v = value(state,:);
    v = v.*(b == 0);
    [~,move] = max(v);
else
    v = value(state,:);
    v = ones(1,9) - v;
    v = v.*(b == 0);
    [~,move] = max(v);
end
b(move) = turn;
B = reshape(b,[3 3])';
isBoardLegal(B);
state = getState(B);
r = isGameOver(B);
if r ~= 0
    sol(state) = r;
    isStateLegal(state);
    return
end

if turn == 2 
    nturn = 1;
else
    nturn = 2;
end

possible = [];
for k = 1:9
    if b(k) == 0
        tb = b;
        tb(k) = nturn;
        tB = reshape(tb,[3 3])';
        possible = [possible test(tB,value,turn)];
    end
end

if nturn == 1
    if sum(ismember(possible,1)) > 0
        r = 1;
        sol(state) = r;
        isStateLegal(state);
    elseif sum(ismember(possible,-1)) > 0
        r = -1;
        sol(state) = r;
        isStateLegal(state);
    else
        r = 2;
        sol(state) = r;
        isStateLegal(state);
    end
else
    if sum(ismember(possible,2)) > 0
        r = 2;
        sol(state) = r;
        isStateLegal(state);
    elseif sum(ismember(possible,-1)) > 0
        r = -1;
        sol(state) = r;
        isStateLegal(state);
    else
        r = 1;
        sol(state) = r;
        isStateLegal(state);
    end
end

end
function r = solve(B)
state = getState(B);
global solution

if solution(state) ~= 0
    r = solution(state);
    return
end

r = isGameOver(B);
if r ~= 0
    solution(state) = r;
    return
end

b = [B(1,:) B(2,:) B(3,:)];
legal_moves = [];
for k = 1:9
    if b(k) == 0
        legal_moves = [legal_moves k];
    end
end

possible = [];
turn = mod(sum(b ~= 0),2) + 1;

for k = 1:length(legal_moves)
    tb = b;
    tb(legal_moves(k)) = turn;
    tB = reshape(tb,[3 3])';
    possible = [possible solve(tB)];
end

if turn == 1
    if sum(ismember(possible,1)) > 0
        r = 1;
        solution(state) = r;
    elseif sum(ismember(possible,-1)) > 0
        r = -1;
        solution(state) = r;
    else
        r = 2;
        solution(state) = r;
    end
else
    if sum(ismember(possible,2)) > 0
        r = 2;
        solution(state) = r;
    elseif sum(ismember(possible,-1)) > 0
        r = -1;
        solution(state) = r;
    else
        r = 1;
        solution(state) = r;
    end
end
end
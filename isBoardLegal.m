function c = isBoardLegal(B) 
n1 = sum(sum(ismember(B,1)));
n2 = sum(sum(ismember(B,2)));
c = 0;

if n1 == n2 || (n1 == n2 + 1)
    return
else
    c = 1;


end
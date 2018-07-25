function [w,ww] = runTest(value,solution)
global sol
sol = zeros(3^9,1);
test(newBoard(),value,1);
for k = 1:9
    b = zeros(9,1);
    b(k) = 1;
    B = reshape(b,[3 3]);
    test(B,value,2);
end

index = sol ~= 0;
ww = zeros(size(sol));
for k = 1:length(sol)
    if isStateLegal(k) == 0 && sol(k) ~= solution(k) && sol(k) ~= 0
        ww(k) = 1;        
    end
end
w = sum(ww)/sum(index)*100;
fprintf('wrong %d/%d = %.2f%%\n',sum(ww),sum(index),w);




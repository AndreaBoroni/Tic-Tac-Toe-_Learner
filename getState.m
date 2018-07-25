function [state] = getState(B)
state = 1;
b = [B(1,:) B(2,:) B(3,:)];
for ii = 1:9
    state = state + b(ii)*3^(ii - 1);
end

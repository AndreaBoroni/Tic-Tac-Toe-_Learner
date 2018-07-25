function [r] = isGameOver(B)
r = 0;
if min(B(1,:)) == max(B(1,:)) && B(1,1) ~= 0
    r = B(1,1);
    return
elseif min(B(2,:)) == max(B(2,:)) && B(2,2) ~= 0
    r = B(2,1);
    return
elseif min(B(3,:)) == max(B(3,:)) && B(3,3) ~= 0
    r = B(3,1);
    return
elseif min(B(:,1)) == max(B(:,1)) && B(1,1) ~= 0
    r = B(1,1);
    return
elseif min(B(:,2)) == max(B(:,2)) && B(2,2) ~= 0
    r = B(1,2);
    return
elseif min(B(:,3)) == max(B(:,3)) && B(3,3) ~= 0
    r = B(1,3);
    return
elseif min(diag(B)) == max(diag(B)) && B(2,2) ~= 0
    r = B(1,1);
    return
end

if B(1,3) == B(2,2) && B(2,2) == B(3,1) && B(2,2) ~= 0
    r = B(2,2);
    return
end
if min(min(B)) ~= 0
    r = -1;
    return
end
function r = testOver(B)
r = 0;
if B(1,1) == B(1,2)
  r = B(1,1);
end
if min(min(B)) ~= 0
    r = -1;
end
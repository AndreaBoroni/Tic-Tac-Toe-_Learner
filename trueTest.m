function [w] = trueTest(value,sol)
w = 0;
B = newBoard();
b = [B(1,:) B(2,:) B(3,:)];
for m1 = 1:9
    b(m1) = 1;
    B = reshape(b,[3 3])'
    v = value(getState(B),:);
    v = ones(1,9) - v;
    v = v.*(b == 0);
    [~,m2] = max(v);
    b(m2) = 2;
    B = reshape(b,[3 3])'
    if sol(getState(B)) == 1
        w = w + 1;
        pause(5);
        b(m1) = 0;
        b(m2) = 0;
        break 
    end
    for m3 = 1:9
        if b(m3) == 0
            b(m3) = 1;
            B = reshape(b,[3 3])'
            r3 = sol(getState(B));
            v = value(getState(B),:);
            v = ones(1,9) - v;
            v = v.*(b == 0);
            [~,m4] = max(v);
            b(m4) = 2;
            B = reshape(b,[3 3])'
            if sol(getState(B)) ~= r3
                w = w + 1;
                pause(5);
                b(m3) = 0;
                b(m4) = 0;
                break 
            end
            for m5 = 1:9
                if b(m5) == 0
                    b(m5) = 1;
                    B = reshape(b,[3 3])'
                    if isGameOver(B) ~= 0
                        b(m5) = 0;
                        break
                    end
                    r5 = sol(getState(B));
                    v = value(getState(B),:);
                    v = ones(1,9) - v;
                    v = v.*(b == 0);
                    [~,m6] = max(v);
                    b(m6) = 2;
                    B = reshape(b, [3 3])'
                    if sol(getState(B)) ~= r5
                        w = w + 1;
                        pause(5);
                        b(m5) = 0;
                        b(m6) = 0;
                        break 
                    end
                    if isGameOver(B) ~= 0
                        b(m5) = 0;
                        b(m6) = 0;
                        break
                    end
                    for m7 = 1:9
                        if b(m7) == 0
                            b(m7) = 1;
                            B = reshape(b,[3 3])'
                            if isGameOver(B) ~= 0
                                b(m7) = 0;
                                break
                            end
                            r7 = sol(getState(B));
                            v = value(getState(B),:);
                            v = ones(1,9) - v;
                            v = v.*(b == 0);
                            [~,m8] = max(v);
                            b(m8) = 2;
                            B = reshape(b, [3 3])'
                            b(m7) = 0;
                            b(m8) = 0;
                            if sol(getState(B)) ~= r7
                                w = w + 1;
                                pause(5);
                                break 
                            end
                            if isGameOver(B) ~= 0
                                break
                            end
                        end
                        
                    end    
                    b(m5) = 0;
                    b(m6) = 0;
                end
            end
            b(m3) = 0;
            b(m4) = 0;
        end
    end
    b(m1) = 0;
    b(m2) = 0;  
end

B = newBoard();
b = [B(1,:) B(2,:) B(3,:)];
v = value(getState(B),:);
v = v.*(b == 0);
[~,m1] = max(v);
b(m1) = 1;
for m2 = 1:9
    if b(m2) == 0
        b(m2) = 2;
        B = reshape(b,[3 3])';
        r2 = sol(getState(B));
        v = value(getState(B),:);
        v = v.*(b == 0);
        [~,m3] = max(v);
        b(m3) = 1;
        B = reshape(b,[3 3])';
        if sol(getState(B)) ~= r2
            w = w + 1;
            b(m2) = 0;
            b(m3) = 0;
            break 
        end
        for m4 = 1:9
            if b(m4) == 0
                b(m4) = 2;
                B = reshape(b,[3 3])';
                r4 = sol(getState(B));
                v = value(getState(B),:);
                v = v.*(b == 0);
                [~,m5] = max(v);
                b(m5) = 1;
                B = reshape(b,[3 3])';
                if sol(getState(B)) ~= r4
                    w = w + 1;
                    b(m4) = 0;
                    b(m5) = 0;
                    break 
                end
                if isGameOver(B) ~= 0
                    b(m4) = 0;
                    b(m5) = 0;
                    break
                end
                for m6 = 1:9
                    if b(m6) == 0
                        b(m6) = 2;
                        B = reshape(b,[3 3])';
                        if isGameOver(B) ~= 0
                            b(m6) = 0;
                            break
                        end
                        r6 = sol(getState(B));
                        v = value(getState(B),:);
                        v = v.*(b == 0);
                        [~,m7] = max(v);
                        b(m7) = 1;
                        B = reshape(b, [3 3])';
                        b(m5) = 0;
                        b(m6) = 0;
                        if sol(getState(B)) ~= r6
                            w = w + 1;
                        end
                    end
                end
                b(m4) = 0;
                b(m5) = 0;
            end
        end
        b(m2) = 0;
        b(m3) = 0;
    end
end
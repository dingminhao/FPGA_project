function out = pool( I )%2x2³Ø»¯
    [H,W,I_NUM] = size(I);
    POOL_OUT_H = floor(H/2);
    POOL_OUT_W = floor(W/2);
    out = zeros(POOL_OUT_H,POOL_OUT_W,I_NUM);
    
    for k=1:I_NUM
        for i=1:POOL_OUT_H
            for j=1:POOL_OUT_W
                out(i,j,k)= max(max(I(i*2-1:i*2,j*2-1:j*2,k)));
            end
        end
    end
end


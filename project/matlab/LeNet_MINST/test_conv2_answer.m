%% debug conv2
xx = 1; yy = 1; och = 1; ich = 1;
xxx = x(yy : 4 + yy, xx : 4+ xx, ich);
www = c2_w(och, ich, :, :);
ooo = sum(sum(squeeze(round(xxx* 4096)) .* squeeze(round(www * 256))));

%% debug pool2

ooo = zeros(16,16);
for i = 1:4
    for j=1:4
        for k=1:16
            ooo((i-1)*4+j,k)=x(i,j,k);
        end
    end
end
ooo = round(ooo)
%% debug conv2
ooo = zeros(64, 16);
for i = 1:8
    for j=1:8
        for k=1:16
            ooo((i-1) * 8+j,k) = x(i,j,k);
        end
    end
end


ooo = round(ooo)



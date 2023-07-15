clear;clc;
load("parameters.mat")
size(c2_w);
c2_w_1 = squeeze(c2_w(:,:,1,:));
c2_w_1_0 = round(c2_w_1*256);

fid = fopen('c2_1.coe', 'w+');
% 5row 16
% 8 [-128, 127]
for k = 1 : 16 
    for i = 1 : 6
        for j = 1 : 5
            tmp = round(c2_w_1(k,i,j) * 256);
            if(tmp > 127)
                tmp = 127;
            else if(tmp < -128)
                tmp = 128;
                end
            end
            % 处理负数
            if(tmp < 0)
                tmp = 255 + 1 - abs(tmp);
            end
            fprintf(fid, '%s', dec2bin(tmp, 8));
        end
    end
    fprintf(fid, '\n');
end
fclose(fid);


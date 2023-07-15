clear;clc;
load("parameters.mat")
size(c2_w);
c2_w_1 = squeeze(c2_w(1,:,:,:));

fid = fopen('t.txt', 'w+');
%% 16bit * 6 => 96位
% 16 [32768, 32767]
for i = 1 : 5
    for j = 1 : 5
        for k = 1 : 6
            tmp = round(c2_w_1(k,i,j) * 4096);
            if(tmp > 32767)
                tmp = 32767;
            else if(tmp < -32768)
                tmp = 32768;
                end
            end

            % 处理负数
            if(tmp < 0)
                tmp = 65535 + 1 - abs(tmp);
            end
            fprintf(fid, '%s', dec2bin(tmp, 16));
        end
        % 换行
        fprintf(fid, '\n');
    end
end



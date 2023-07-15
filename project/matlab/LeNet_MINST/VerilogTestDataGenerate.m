clear;clc;
fid = fopen("test_data.txt", 'w+');
I = imread('test.bmp');
[H,W,C] = size(I);
if(C~=1)
    I = rgb2gray(I);
end
for i = 1:H
    for j = 1:W
        p = I(i,j);
        str = dec2bin(p,8);
        fprintf(fid, '%s\n', str);
    end
end
disp('生成 test_data.txt 完成');
fclose(fid);
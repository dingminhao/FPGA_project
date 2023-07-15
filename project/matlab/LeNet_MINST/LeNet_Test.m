%% 对测试集进行测试
clear;clc;
TOTAL_NUM = 10;%x * 10 张图
right_num = 0;
for i=1:TOTAL_NUM
    for j=0:9
        img = double(imread(['../../MINST/' num2str(j) '_' num2str(i) '.bmp' ]));
        out = LeNet(img);
        if(out == j)
            right_num = right_num+1;
        end
    end
    disp(['测试进度:' num2str(i*100/TOTAL_NUM) '%']);
end
    disp(['正确率:' num2str(right_num*10/TOTAL_NUM) '%']);
%%
clear;clc;
img1 = imread('./9_1005.bmp');
%img1 = rgb2gray(img1);
img1 = double(img1);
out = LeNet(img1);
imshow(img1)
title(['预测结果:' num2str(out)]);
%% �Բ��Լ����в���
clear;clc;
TOTAL_NUM = 10;%x * 10 ��ͼ
right_num = 0;
for i=1:TOTAL_NUM
    for j=0:9
        img = double(imread(['../../MINST/' num2str(j) '_' num2str(i) '.bmp' ]));
        out = LeNet(img);
        if(out == j)
            right_num = right_num+1;
        end
    end
    disp(['���Խ���:' num2str(i*100/TOTAL_NUM) '%']);
end
    disp(['��ȷ��:' num2str(right_num*10/TOTAL_NUM) '%']);
%%
clear;clc;
img1 = imread('./9_1005.bmp');
%img1 = rgb2gray(img1);
img1 = double(img1);
out = LeNet(img1);
imshow(img1)
title(['Ԥ����:' num2str(out)]);
clear;
clc;
close all;
a = imread('9_1005.bmp');
%a = rgb2gray(a);
imshow(a);
[row,col] = size(a);

p_fid = fopen('test_data.txt','w+');
for i = 1:28
     for j = 1:28 
            temp = dec2bin(a(i,j));
           fprintf(p_fid,'%08s' ,temp);
           fprintf(p_fid,'\n');
     end
 end
fclose(p_fid);

%imwrite(a,'../img/post.bmp');
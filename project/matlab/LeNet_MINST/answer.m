clear;clc;
load('file_out.txt');
load('parameters.mat');
x_v = reshape(file_out, [256,1]);

%--- fc1 ---------
h = fc1_w*x_v + fc1_b';
h = f_relu(h);
%--- fc2 ---------
h = fc2_w*h + fc2_b';
h = f_relu(h);
%--- fc3 ---------
h = fc3_w*h + fc3_b';
h = f_relu(h);
[~,out]=max(h);
out = out -1;
disp(['The number is ', num2str(out)]);

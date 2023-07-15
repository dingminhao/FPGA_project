function out = LeNet( x )
load('parameters.mat');
%--- C1 ---------
x = conv2d(x,c1_w,c1_b);
x = f_relu(x);
x = pool(x);
x1 = round(x(:,:,1) * 4096);
%--- C2 ---------
x = conv2d(x,c2_w,c2_b);
x = f_relu(x);
x = pool(x);
%--- pre-processing ---------
[H,W,C] = size(x);
k=permute(x,[2,1,3]);
x_v = reshape(k,H*W*C,1);
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
end


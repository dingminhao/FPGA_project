load('parameters.mat')

c1_w_1 = squeeze(c1_w(1,:,:,:));
c1_w_2 = squeeze(c1_w(2,:,:,:));
c1_w_3 = squeeze(c1_w(3,:,:,:));
c1_w_4 = squeeze(c1_w(4,:,:,:));
c1_w_5 = squeeze(c1_w(5,:,:,:));
c1_w_6 = squeeze(c1_w(6,:,:,:));

c1_w_1 = round(c1_w_1*4096);
c1_w_2 = round(c1_w_2*4096);
c1_w_3 = round(c1_w_3*4096);
c1_w_4 = round(c1_w_4*4096);
c1_w_5 = round(c1_w_5*4096);
c1_w_6 = round(c1_w_6*4096);

p_fid = fopen('c1_w_1.coe','w+');
for i = 1:5
    for j=1:5
      fprintf(p_fid,'%d' ,c1_w_1(i,j));
      fprintf(p_fid,'\n');
    end
 end
fclose(p_fid);

p_fid = fopen('c1_w_2.coe','w+');
for i = 1:5
    for j=1:5
      fprintf(p_fid,'%d' ,c1_w_2(i,j));
      fprintf(p_fid,'\n');
    end
 end
fclose(p_fid);


p_fid = fopen('c1_w_3.coe','w+');
for i = 1:5
    for j=1:5
      fprintf(p_fid,'%d' ,c1_w_3(i,j));
      fprintf(p_fid,'\n');
    end
 end
fclose(p_fid);
p_fid = fopen('c1_w_4.coe','w+');
for i = 1:5
    for j=1:5
      fprintf(p_fid,'%d' ,c1_w_4(i,j));
      fprintf(p_fid,'\n');
    end
 end
fclose(p_fid);



p_fid = fopen('c1_w_5.coe','w+');
for i = 1:5
    for j=1:5
      fprintf(p_fid,'%d' ,c1_w_5(i,j));
      fprintf(p_fid,'\n');
    end
 end
fclose(p_fid);
p_fid = fopen('c1_w_6.coe','w+');
for i = 1:5
    for j=1:5
      fprintf(p_fid,'%d' ,c1_w_6(i,j));
      fprintf(p_fid,'\n');
    end
 end
fclose(p_fid);

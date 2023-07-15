clc;clear;
load('parameters.mat')

c1_w_1 = squeeze(c1_w(1,:,:,:));
c1_w_2 = squeeze(c1_w(2,:,:,:));
c1_w_3 = squeeze(c1_w(3,:,:,:));
c1_w_4 = squeeze(c1_w(4,:,:,:));
c1_w_5 = squeeze(c1_w(5,:,:,:));
c1_w_6 = squeeze(c1_w(6,:,:,:));
c1_b = squeeze(c1_b(1,:,:,:));

c1_w_1 = round(c1_w_1*4096);
c1_w_2 = round(c1_w_2*4096);
c1_w_3 = round(c1_w_3*4096);
c1_w_4 = round(c1_w_4*4096);
c1_w_5 = round(c1_w_5*4096);
c1_w_6 = round(c1_w_6*4096);
c1_b = round(c1_b*4096);


p_fid = fopen('c1_b.coe','w+');
fprintf(p_fid,'%s' , 'memory_initialization_radix=10;');
 fprintf(p_fid,'\n');  
 fprintf(p_fid,'%s' , 'memory_initialization_vector =');
  fprintf(p_fid,'\n');  
for i = 1:6
      fprintf(p_fid,'%d' ,c1_b(i));
      if(i~=6)
        fprintf(p_fid,'%s' , ',');
      end
end
fprintf(p_fid,'%s' , ';');
fclose(p_fid);


p_fid = fopen('c1_w_1.coe','w+');
fprintf(p_fid,'%s' , 'memory_initialization_radix=10;');
 fprintf(p_fid,'\n');  
 fprintf(p_fid,'%s' , 'memory_initialization_vector =');
  fprintf(p_fid,'\n');  
for i = 1:5
    for j=1:5
      fprintf(p_fid,'%d' ,c1_w_1(6-i,6-j));
      if((i==5 && j~=5)||i<5)
        fprintf(p_fid,'%s' , ',');
      end
    end
end
fprintf(p_fid,'%s' , ';');
fclose(p_fid);

p_fid = fopen('c1_w_2.coe','w+');
fprintf(p_fid,'%s' , 'memory_initialization_radix=10;');
 fprintf(p_fid,'\n');  
 fprintf(p_fid,'%s' , 'memory_initialization_vector =');
  fprintf(p_fid,'\n');  
for i = 1:5
    for j=1:5
      fprintf(p_fid,'%d' ,c1_w_2(6-i,6-j));
      if((i==5 && j~=5)||i<5)
        fprintf(p_fid,'%s' , ',');
      end
    end
end
fprintf(p_fid,'%s' , ';');
fclose(p_fid);


p_fid = fopen('c1_w_3.coe','w+');
fprintf(p_fid,'%s' , 'memory_initialization_radix=10;');
fprintf(p_fid,'\n');  
fprintf(p_fid,'%s' , 'memory_initialization_vector =');
fprintf(p_fid,'\n');
for i = 1:5
    for j=1:5
      fprintf(p_fid,'%d' ,c1_w_3(6-i,6-j));
       if((i==5 && j~=5)||i<5)
        fprintf(p_fid,'%s' , ',');
       end
    end
end
fprintf(p_fid,'%s' , ';');
fclose(p_fid);


p_fid = fopen('c1_w_4.coe','w+');
fprintf(p_fid,'%s' , 'memory_initialization_radix=10;');
fprintf(p_fid,'\n');  
fprintf(p_fid,'%s' , 'memory_initialization_vector =');
fprintf(p_fid,'\n');
for i = 1:5
    for j=1:5
      fprintf(p_fid,'%d' ,c1_w_4(6-i,6-j));
       if((i==5 && j~=5)||i<5)
        fprintf(p_fid,'%s' , ',');
       end
    end
end
fprintf(p_fid,'%s' , ';');
fclose(p_fid);



p_fid = fopen('c1_w_5.coe','w+');
fprintf(p_fid,'%s' , 'memory_initialization_radix=10;');
fprintf(p_fid,'\n');  
fprintf(p_fid,'%s' , 'memory_initialization_vector =');
fprintf(p_fid,'\n');
for i = 1:5
    for j=1:5
      fprintf(p_fid,'%d' ,c1_w_5(6-i,6-j));
       if((i==5 && j~=5)||i<5)
        fprintf(p_fid,'%s' , ',');
       end
    end
end
fprintf(p_fid,'%s' , ';');
fclose(p_fid);


p_fid = fopen('c1_w_6.coe','w+');
fprintf(p_fid,'%s' , 'memory_initialization_radix=10;');
fprintf(p_fid,'\n');  
fprintf(p_fid,'%s' , 'memory_initialization_vector =');
fprintf(p_fid,'\n');
for i = 1:5
    for j=1:5
      fprintf(p_fid,'%d' ,c1_w_6(6-i,6-j));
       if((i==5 && j~=5)||i<5)
        fprintf(p_fid,'%s' , ',');
       end
    end
end
fprintf(p_fid,'%s' , ';');
fclose(p_fid);




`timescale 1ns / 1ps
module conv1_tb;
reg clk;
reg rst_n;

reg[7:0] data_in;
reg data_in_vaild;
integer file,i,file_out;


initial begin
    clk = 1'b0;
    forever begin
        #5 clk = ~clk;
    end
end

initial begin
    rst_n = 0;
    data_in_vaild = 0;
    #100;
    rst_n = 1;
    #100;
    file = $fopen("C:/Users/DMH/Desktop/project/matlab/LeNet_MINST/test_data.txt","rb");
    file_out = $fopen("C:/Users/DMH/Desktop/project/matlab/LeNet_MINST/file_out.txt", "wb");
    
    if(file == 0 || file_out == 0)begin
        $display("[-]error");
        $stop;
    end
    
    for(i=0;i<784;i=i+1)begin
        @(posedge clk)
		$fscanf(file,"%b",data_in);
		data_in_vaild <= 1;
		
    end
    data_in_vaild <= 0;
	$fclose(file);
end
wire [16*16-1:0] data_out;
wire data_out_valid;
always@(posedge clk)begin
    if(data_out_valid) begin
        $fwrite(file_out, "%d,", data_out[16*(0+1)-1:16*0]); 
        $fwrite(file_out, "%d,", data_out[16*(1+1)-1:16*1]); 
        $fwrite(file_out, "%d,", data_out[16*(2+1)-1:16*2]); 
        $fwrite(file_out, "%d,", data_out[16*(3+1)-1:16*3]); 
        $fwrite(file_out, "%d,", data_out[16*(4+1)-1:16*4]); 
        $fwrite(file_out, "%d,", data_out[16*(5+1)-1:16*5]); 
        $fwrite(file_out, "%d,", data_out[16*(6+1)-1:16*6]); 
        $fwrite(file_out, "%d,", data_out[16*(7+1)-1:16*7]); 
        $fwrite(file_out, "%d,", data_out[16*(8+1)-1:16*8]); 
        $fwrite(file_out, "%d,", data_out[16*(9+1)-1:16*9]); 
        $fwrite(file_out, "%d,", data_out[16*(10+1)-1:16*10]); 
        $fwrite(file_out, "%d,", data_out[16*(11+1)-1:16*11]); 
        $fwrite(file_out, "%d,", data_out[16*(12+1)-1:16*12]); 
        $fwrite(file_out, "%d,", data_out[16*(13+1)-1:16*13]); 
        $fwrite(file_out, "%d,", data_out[16*(14+1)-1:16*14]); 
        $fwrite(file_out, "%d\n", data_out[16*(15+1)-1:16*15]); 
    end
end
always@(posedge clk) begin
    if(done)begin
        $fclose(file_out);
        $stop;
    end
end
wire done;


top U0_top(
	.clk			(clk			),
	.rst_n			(rst_n			),
	.data_in		(data_in		),
	.data_in_valid	(data_in_vaild	),
	.done           (done),
	.data_out       (data_out),
	.data_out_valid (data_out_valid)
);

endmodule






















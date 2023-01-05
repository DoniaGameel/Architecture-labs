module RegFile_tb();
localparam regNumnber=8 ;
localparam regBits =16;

reg clk;
reg rst;
reg read_enable;
reg write_enable;
reg [$clog2(regNumnber)-1:0] read_addr;
reg [$clog2(regNumnber)-1:0] write_addr;
reg [regBits-1:0] write_data;
wire [regBits-1:0] read_dataArr;
wire [regBits-1:0] read_dataLoop;

regArray #(regNumnber ,regBits )testArr(read_enable,write_enable,read_addr,write_addr,read_dataArr,write_data,clk,rst);
regLoop #(regNumnber ,regBits )testLoop(read_enable,write_enable,read_addr,write_addr,read_dataLoop,write_data,clk,rst);


always #50 clk = ~clk;

initial
begin
clk=1;

write_addr=3'b000; read_addr=3'b000; write_data=16'b1100110011001100;
#20
read_enable=1;
#20
write_enable=1;
#20 //60 
$display("%b",read_dataArr);
$display("%b",read_dataLoop);
$display("Before The posedge ==> Read_Data will be Still xxx");
$display("===================================================");
#50//110
$display("%b",read_dataArr);
$display("%b",read_dataLoop);
if(read_dataArr==read_dataLoop&&read_dataArr==16'b1100110011001100)
	$display("Success ==> read the data written in the cycle ==> read_enable=1");
else
	$display("Failure");
#20//130
write_addr=3'b001; write_data=16'b1111111111111111;
#100 //230
$display("%b",read_dataArr);
$display("%b",read_dataLoop);
if(read_dataArr==read_dataLoop&&read_dataArr==16'b1100110011001100)
	$display("Success ==>read adress and data are not affected when I change the write address and wrote new data");
else
	$display("Failure");
#10 //240
rst=1;
$display("%b",read_dataArr);
$display("%b",read_dataLoop);
if(read_dataArr==read_dataLoop&&read_dataArr==16'b1100110011001100)
	$display("Success==> read_data is not affected before the posedge");
else
	$display("Failure");
#5 //245
read_enable=0;
#85//330
$display("%b",read_dataArr);
$display("%b",read_dataLoop);
if(read_dataArr==read_dataLoop&&read_dataArr==16'b1100110011001100)
	$display("Success==> read_data is not affected after the posedge and after read_enable=0");
else
	$display("Failure");
#10
read_enable=1;

#70 //410
$display("%b",read_dataArr);
$display("%b",read_dataLoop);
if(read_dataArr==read_dataLoop&&read_dataArr==16'b0000000000000000)
	$display("Success==> read data is zero after the posedge and after read_enable=1");
else
	$display("Failure");
#20//430
rst=0; read_addr=001;
#80 //510
$display("%b",read_dataArr);
$display("%b",read_dataLoop);
if(read_dataArr==read_dataLoop&&read_dataArr==16'b1111111111111111)
	$display("Success ==> after the rst is zero ==> write data is writen again as write_enable is 1");
else
	$display("Failure");

#20 //530
write_addr=3'b010; read_addr=3'b010; write_data= 16'b1111000011110000; write_enable=0;

#100 //630
$display("%b",read_dataArr);
$display("%b",read_dataLoop);
if(read_dataArr==read_dataLoop&&read_dataArr==16'b0000000000000000)
	$display("Success ==> data is not written as write enable is 0");
else
	$display("Failure");

#5 //635
write_enable=1;
#10 //645
write_addr=3'b001; write_data= 16'b0000000011111111;
#60 //705
$display("%b",read_dataArr);
$display("%b",read_dataLoop);
if(read_dataArr==read_dataLoop&&read_dataArr==16'b0000000000000000)
	begin
	$display("Success ==> data is written only in 001 although I gave the write address after the write enable");
	$display("Data is not written untill the negedge");	
	end
else
	$display("Failure");


end
endmodule

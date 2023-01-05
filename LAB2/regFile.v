module regArray #(parameter regNumnber=8 ,regBits =16 )(read_enable,write_enable,read_addr,write_addr,read_data,write_data,clk,rst);
input clk;
input rst;
input read_enable;
input write_enable;
input [$clog2(regNumnber)-1:0] read_addr;
input [$clog2(regNumnber)-1:0] write_addr;
input [regBits-1:0] write_data;
output [regBits-1:0] read_data;
reg[regBits-1:0] read_data;

reg [regBits-1:0] MyData [0:regNumnber-1];
integer i;
//read at postive edge
always@(posedge clk)
begin
//read
if(read_enable)
 read_data= MyData[read_addr];
////////////////
end

//write at negative edge
always@(negedge clk or posedge rst)
begin
//reset all registers
if(rst)
 begin
  for(i=0 ; i<regNumnber ; i=i+1)
   MyData[i]=0;
 end
/////////////////

//read
else if(write_enable)
 begin
 MyData[write_addr]=write_data;
 end
////////////////
end

endmodule

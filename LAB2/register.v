module register#(parameter regBits =16 )(write_enable,read_data,write_data,rst,clk,MyData);
input clk;
input rst;
input write_enable;
input [regBits-1:0] write_data;
output [regBits-1:0] read_data;
reg[regBits-1:0] read_data;
output[regBits-1:0] MyData;
reg[regBits-1:0] MyData;

always @*
begin
read_data= MyData;
end

always@(negedge clk or posedge rst)
begin
if(rst)
   MyData=0;
else if(write_enable)
 begin
 MyData=write_data;
 end
////////////////
end


endmodule

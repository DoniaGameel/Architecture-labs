module regLoop #(parameter regNumnber=8 ,regBits =16 )(read_enable,write_enable,read_addr,write_addr,read_data,write_data,clk,rst);
input clk;
input rst;
input read_enable;
input write_enable;
input [$clog2(regNumnber)-1:0] read_addr;
input [$clog2(regNumnber)-1:0] write_addr;
input [regBits-1:0] write_data;
output [regBits-1:0] read_data;
reg [regBits-1:0] read_data;

wire [regBits-1:0] Muxin[0:7];
wire [regBits-1:0] Muxout;

wire [regBits-1:0] RegOut[0:7];

genvar i;

generate
for(i=0;i<regNumnber;i=i+1)
begin
wire IsMe ;

assign IsMe= (write_addr==i)?1:0;
register#(regBits)regg(write_enable&&IsMe,Muxin[i],write_data,rst,clk,RegOut[i]);
end
endgenerate

mux_4bits #(regNumnber,regBits)muxx(Muxout,Muxin[0],Muxin[1],Muxin[2],Muxin[3],Muxin[4],Muxin[5],Muxin[6],Muxin[7], read_addr);

always @(posedge clk)
begin
if(read_enable)
read_data=Muxout;
end
endmodule

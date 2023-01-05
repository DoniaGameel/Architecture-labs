module mux_4bits #(parameter regNumnber=8 ,regBits =16 )(out,in0,in1,in2,in3,in4,in5,in6,in7, sel);
  input [regBits-1:0] in0 ;
  input [regBits-1:0] in1 ;
  input [regBits-1:0] in2 ;
  input [regBits-1:0] in3 ;
  input [regBits-1:0] in4 ;
  input [regBits-1:0] in5 ;
  input [regBits-1:0] in6 ;
  input [regBits-1:0] in7 ;
  input [$clog2(regNumnber)-1:0] sel;
  output [regBits-1:0] out;
  assign out =
    (sel == 0) ? in0 :
    (sel == 1) ? in1 :
    (sel == 2) ? in2 :
    (sel == 3) ? in3 :
    (sel == 4) ? in4 :
    (sel == 5) ? in5 :
    (sel == 6) ? in6 :
    (sel == 7) ? in7 : 4'bx;
endmodule


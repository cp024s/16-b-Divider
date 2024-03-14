`include "Bin_div.v"
module bin_div_tb;

reg[15:0]dividend;
reg[16:0]divisor;
reg ready;


wire [15:0]quotient;
wire [16:0]remainder;

bin_div DUT(.dividend(dividend),.divisor(divisor),.quot(quotient),.remainder(remainder),.ready(ready));

initial
$monitor($time," Dividend=%d  divisor=%d, quotient=%d, remainder=%d",dividend,divisor,quotient,remainder);

initial
begin
ready=1'b0;
#1 dividend=16'd65535;divisor=16'd65535;
#1 ready=1'b1;
#100 ready=1'b0;
#1 dividend=16'd64;divisor=16'd3;
#1 ready=1'b1;
#100 ready=1'b0;
#1 dividend=16'd100;divisor=16'd2;
#1 ready=1'b1;
#100 ready=1'b0;
#1 dividend=16'd30;divisor=16'd15;
#1 ready=1'b1;
#100 ready=1'b0;
#1 dividend=16'd15;divisor=16'd2;
#1 ready=1'b1;

end

endmodule

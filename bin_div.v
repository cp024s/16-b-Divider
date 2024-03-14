module bin_div(dividend,divisor,quot,remainder,ready);

//LOAD IN YOUR REQUIRED DIVIDEND AND DIVISOR AND 
// FORCE READY INPUT TO INITIATE DIVISION

input ready;
input [15:0]dividend;
input [16:0]divisor;
output reg[15:0]quot;
output reg[16:0]remainder;

//PARAMETER DECLARATION OF THE SYSTEM
parameter comp=17'b11111111111111111;// 1111 1111

//INTERMIDIATE REGISTERS
reg [5:0]count;
reg [16:0] neg_divisor;
reg [16:0]inter_a;
reg [16:0]saved_a;
reg [15:0]inter_divi;
reg launch,done;


always @(posedge ready)
begin
count=5'b10000;
neg_divisor=(divisor^comp)+1'b1;
inter_a=17'b00000000000000000;
inter_divi=dividend;
launch=1'b1;
done=1'b0;
remainder=17'b0;
quot=16'b0;
#1;
end



always @(posedge launch)
begin

while(count!=5'b00000)
begin
#1
//PERFORM LEFT SHIFT AND SAVE INTER_A
{inter_a,inter_divi}={inter_a[15:0],inter_divi[15:0],1'b0};
#1 saved_a=inter_a;

#1 inter_a=inter_a+neg_divisor;

if(inter_a[16]==1'b1)
begin
#1
inter_divi[0]=1'b0;
inter_a=saved_a;
end

else
begin
inter_divi[0]=1'b1;
end


#1 count=count-1'b1;


if(count==5'b00000)
begin
done=1'b1;
launch=1'b0;
end

end
end


always @(posedge done)
begin
#1
quot=inter_divi;
remainder=inter_a;
end


endmodule

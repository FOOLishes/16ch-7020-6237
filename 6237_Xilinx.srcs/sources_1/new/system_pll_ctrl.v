module system_pll_ctrl(
						clk,
						rst_n,
						locked1,
						
						sys_rst_n
					  );

input clk;					
input rst_n;
input locked1;
output sys_rst_n;

wire sysrst_nr0;
reg sysrst_nr1;
reg sysrst_nr2;

assign sysrst_nr0=rst_n & locked1;

always @(posedge clk or negedge sysrst_nr0)
begin
	if(!sysrst_nr0) sysrst_nr1<=1'b0;
	else sysrst_nr1<=1'b1;
end

always @(posedge clk or negedge sysrst_nr0)
begin
	if(!sysrst_nr0) sysrst_nr2<=1'b0;
	else sysrst_nr2<=sysrst_nr1;
end

assign sys_rst_n = sysrst_nr2;

endmodule


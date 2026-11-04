
`timescale 1 ns / 1 ps

	module axi4_write_v1_0 #
	(
		// Users to add parameters here

		// User parameters ends
		// Do not modify the parameters beyond this line


		// Parameters of Axi Master Bus Interface M_AXI
		parameter  C_M_AXI_TARGET_SLAVE_BASE_ADDR	= 32'h30000000,
		parameter integer C_M_AXI_BURST_LEN	= 16,
		parameter integer C_M_AXI_ID_WIDTH	= 1,
		parameter integer C_M_AXI_ADDR_WIDTH	= 32,
		parameter integer C_M_AXI_DATA_WIDTH	= 32,
		parameter integer C_M_AXI_AWUSER_WIDTH	= 0,
		parameter integer C_M_AXI_ARUSER_WIDTH	= 0,
		parameter integer C_M_AXI_WUSER_WIDTH	= 0,
		parameter integer C_M_AXI_RUSER_WIDTH	= 0,
		parameter integer C_M_AXI_BUSER_WIDTH	= 0
	)
	(
		// Users to add ports here
        input wire [31:0]fifo_data,
        output wire rd_en,
        output wire rd_done,
        input wire system_en,       
        input wire [5:0]gpio,
        output wire [5:0]data_interrupt,
    //    output wire m_axi_wreadyx_test,
	
		// User ports ends
		// Do not modify the ports beyond this line


		// Ports of Axi Master Bus Interface M_AXI
		input wire  m_axi_init_axi_txn,
		output wire  m_axi_txn_done,
		output wire  m_axi_error,
		input wire  m_axi_aclk,
		input wire  m_axi_aresetn,
		output wire [C_M_AXI_ID_WIDTH-1 : 0] m_axi_awid,
		output wire [C_M_AXI_ADDR_WIDTH-1 : 0] m_axi_awaddr,
		output wire [7 : 0] m_axi_awlen,
		output wire [2 : 0] m_axi_awsize,
		output wire [1 : 0] m_axi_awburst,
		output wire  m_axi_awlock,
		output wire [3 : 0] m_axi_awcache,
		output wire [2 : 0] m_axi_awprot,
		output wire [3 : 0] m_axi_awqos,
		output wire [C_M_AXI_AWUSER_WIDTH-1 : 0] m_axi_awuser,
		output wire  m_axi_awvalid,
		input wire  m_axi_awready,
		output wire [C_M_AXI_DATA_WIDTH-1 : 0] m_axi_wdata,
		output wire [C_M_AXI_DATA_WIDTH/8-1 : 0] m_axi_wstrb,
		output wire  m_axi_wlast,
		output wire [C_M_AXI_WUSER_WIDTH-1 : 0] m_axi_wuser,
		output wire  m_axi_wvalid,
		input wire  m_axi_wready,
		input wire [C_M_AXI_ID_WIDTH-1 : 0] m_axi_bid,
		input wire [1 : 0] m_axi_bresp,
		input wire [C_M_AXI_BUSER_WIDTH-1 : 0] m_axi_buser,
		input wire  m_axi_bvalid,
		output wire  m_axi_bready,
		output wire [C_M_AXI_ID_WIDTH-1 : 0] m_axi_arid,
		output wire [C_M_AXI_ADDR_WIDTH-1 : 0] m_axi_araddr,
		output wire [7 : 0] m_axi_arlen,
		output wire [2 : 0] m_axi_arsize,
		output wire [1 : 0] m_axi_arburst,
		output wire  m_axi_arlock,
		output wire [3 : 0] m_axi_arcache,
		output wire [2 : 0] m_axi_arprot,
		output wire [3 : 0] m_axi_arqos,
		output wire [C_M_AXI_ARUSER_WIDTH-1 : 0] m_axi_aruser,
		output wire  m_axi_arvalid,
		input wire  m_axi_arready,
		input wire [C_M_AXI_ID_WIDTH-1 : 0] m_axi_rid,
		input wire [C_M_AXI_DATA_WIDTH-1 : 0] m_axi_rdata,
		input wire [1 : 0] m_axi_rresp,
		input wire  m_axi_rlast,
		input wire [C_M_AXI_RUSER_WIDTH-1 : 0] m_axi_ruser,
		input wire  m_axi_rvalid,
		output wire  m_axi_rready
		
	//	,output wire [31:0] test_data_port
	//	,output wire  test_data_flag

	);
	
	
//	reg m_axi_wreadyx;
// Instantiation of Axi Bus Interface M_AXI
	axi4_write_v1_0_M_AXI # ( 
		.C_M_TARGET_SLAVE_BASE_ADDR(C_M_AXI_TARGET_SLAVE_BASE_ADDR),
		.C_M_AXI_BURST_LEN(C_M_AXI_BURST_LEN),
		.C_M_AXI_ID_WIDTH(C_M_AXI_ID_WIDTH),
		.C_M_AXI_ADDR_WIDTH(C_M_AXI_ADDR_WIDTH),
		.C_M_AXI_DATA_WIDTH(C_M_AXI_DATA_WIDTH),
		.C_M_AXI_AWUSER_WIDTH(C_M_AXI_AWUSER_WIDTH),
		.C_M_AXI_ARUSER_WIDTH(C_M_AXI_ARUSER_WIDTH),
		.C_M_AXI_WUSER_WIDTH(C_M_AXI_WUSER_WIDTH),
		.C_M_AXI_RUSER_WIDTH(C_M_AXI_RUSER_WIDTH),
		.C_M_AXI_BUSER_WIDTH(C_M_AXI_BUSER_WIDTH)
		
	) axi4_write_v1_0_M_AXI_inst (
	    .FIFO_DATA(fifo_data),
        .RD_EN(rd_en),
        .RD_DONE(rd_done),
        .SYSTEM_EN(system_en),
        .DATA_INTERRUPT(data_interrupt),
        .GPIO(gpio),
		.INIT_AXI_TXN(m_axi_init_axi_txn),
		.TXN_DONE(m_axi_txn_done),
		.ERROR(m_axi_error),
		.M_AXI_ACLK(m_axi_aclk),
		.M_AXI_ARESETN(m_axi_aresetn),
		.M_AXI_AWID(m_axi_awid),
		.M_AXI_AWADDR(m_axi_awaddr),
		.M_AXI_AWLEN(m_axi_awlen),
		.M_AXI_AWSIZE(m_axi_awsize),
		.M_AXI_AWBURST(m_axi_awburst),
		.M_AXI_AWLOCK(m_axi_awlock),
		.M_AXI_AWCACHE(m_axi_awcache),
		.M_AXI_AWPROT(m_axi_awprot),
		.M_AXI_AWQOS(m_axi_awqos),
		.M_AXI_AWUSER(m_axi_awuser),
		.M_AXI_AWVALID(m_axi_awvalid),
		.M_AXI_AWREADY(m_axi_awready),
		.M_AXI_WDATA(m_axi_wdata),
		.M_AXI_WSTRB(m_axi_wstrb),
		.M_AXI_WLAST(m_axi_wlast),
		.M_AXI_WUSER(m_axi_wuser),
		.M_AXI_WVALID(m_axi_wvalid),
		.M_AXI_WREADY(m_axi_wready), ////**************************
		.M_AXI_BID(m_axi_bid),
		.M_AXI_BRESP(m_axi_bresp),
		.M_AXI_BUSER(m_axi_buser),
		.M_AXI_BVALID(m_axi_bvalid),
		.M_AXI_BREADY(m_axi_bready),
		.M_AXI_ARID(m_axi_arid),
		.M_AXI_ARADDR(m_axi_araddr),
		.M_AXI_ARLEN(m_axi_arlen),
		.M_AXI_ARSIZE(m_axi_arsize),
		.M_AXI_ARBURST(m_axi_arburst),
		.M_AXI_ARLOCK(m_axi_arlock),
		.M_AXI_ARCACHE(m_axi_arcache),
		.M_AXI_ARPROT(m_axi_arprot),
		.M_AXI_ARQOS(m_axi_arqos),
		.M_AXI_ARUSER(m_axi_aruser),
		.M_AXI_ARVALID(m_axi_arvalid),
		.M_AXI_ARREADY(m_axi_arready),
		.M_AXI_RID(m_axi_rid),
		.M_AXI_RDATA(m_axi_rdata),
		.M_AXI_RRESP(m_axi_rresp),
		.M_AXI_RLAST(m_axi_rlast),
		.M_AXI_RUSER(m_axi_ruser),
		.M_AXI_RVALID(m_axi_rvalid),
		.M_AXI_RREADY(m_axi_rready)
		//,.test_data_port(test_data_port)
		//,.test_data_flag(test_data_flag)
//	,.	 debug_wready(debug_wready)
//	,.   debug_wvalid(debug_wvalid)
//   ,. debug_awvalid(   debug_awvalid )   
//    ,. debug_startburst(  debug_startburst  )
//    ,. debug_burst_write_active(  debug_burst_write_active  )
//    ,. axi_awvalid  (axi_awvalid)
//	,. start_single_burst_write (start_single_burst_write)
//	,.burst_write_active  (burst_write_active)         //          
//	, .writes_done(writes_done),
//	. axi_bready(axi_bready),
//    . M_AXI_BVALID1 (M_AXI_BVALID1)
    
	);

	// Add user logic here
//WREADY‘s idle keep 
//reg m_axi_init_axi_txn1;
//reg m_axi_init_axi_txn2;
// always@(posedge m_axi_aclk )
// if(!m_axi_aresetn)                 begin
//    m_axi_wready_1<=1'b0;
//    m_axi_wready_2<=1'b0;           end
// else                                  begin
//	m_axi_wready_1<=m_axi_wready;
//	m_axi_wready_2<=m_axi_wready_1; end	
//assign  pos_m_axi_wready=~m_axi_wready_2&&m_axi_wready_1;


/*
reg state_cnt	;
reg [3:0] keep_cnt;
always@(posedge m_axi_aclk or negedge m_axi_aresetn )	
  if(!m_axi_aresetn)                                begin
        state_cnt<=1'b0;
        keep_cnt<=3'b0;
        m_axi_wreadyx<=m_axi_wready;                end
  else 
        case(state_cnt)                     
        1'b0:if(m_axi_init_axi_txn==1'b1)                 begin
                state_cnt<=1'b1;
              m_axi_wreadyx<=m_axi_wready;              end//ready直连连
             else state_cnt<=1'b0;
        1'b1:if(keep_cnt>4'd15)
                    m_axi_wreadyx<=m_axi_wready;//ready直连
              else                                      begin
                    keep_cnt<=keep_cnt+1'b1;      
                    m_axi_wreadyx<=1'b1;                end
        default: state_cnt<=1'b1; 
       endcase 
          
       
 assign m_axi_wreadyx_test=m_axi_wreadyx;
	// User logic ends
	*/
//	assign m_axi_wreadyx_test=m_axi_wready;
	endmodule

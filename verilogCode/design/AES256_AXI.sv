

`define FIFO_SZ 10

module AES256_AXI(
                    S_AXI_ACLK, S_AXI_ARESETN, 
                    slv_reg0, slv_reg1, slv_reg2, slv_reg3
                );

    input S_AXI_ACLK, S_AXI_ARESETN;
    input [31:0] slv_reg0, slv_reg1, slv_reg2, slv_reg3;

    // =========== USERS REGS & OTHERS  =============
    
    wire mod_fifo_full, data_fifo_full, seed_fifo_full;
    reg wr_mod_fifo, wr_data_fifo, wr_seed_fifo;
    reg ctrl_dataIn;
    wire ctrl_dataOut;
    wire mod_decrease;
    
    //reg forced_resetn;
    
    wire [1:0] mode;
    wire [127:0] data, seed;
    
    
    // ===============  CREATED BY ME  ==============
	
	always @(posedge S_AXI_ACLK or negedge S_AXI_ARESETN)
	begin
	   if(!S_AXI_ARESETN)
        begin
            ctrl_dataIn <= 1'b0;
            wr_mod_fifo <= 1'b0;
            // mod_decrease <= 1'b0;
            // wr_data_fifo <= 1'b0;
                        
            // mode <= 0;
            // seed <= 0;
        end
        
        else
        begin
        /*  TO BE IMPLEMENTED
        
            forced_resetn <= slv_reg0[0];
        */  
                
            ctrl_dataIn <= slv_reg0[1];                 // ASK IF CORRECT

            /*
            if(mod_en == 0 || mod_en == 1)
            begin
                wr_data_fifo <= 1'b1;
                wr_seed_fifo <= 1'b0;
            end
            if(mod_en == 2)
            begin
                wr_seed_fifo <= 1'b1;
                wr_data_fifo <= 1'b0;
            end
            */
            
        end
	end

    
    always @(slv_reg1)
    begin
        wr_mod_fifo <= 1'b1;

        wr_data_fifo <= 1'b0;
        wr_seed_fifo <= 1'b0;
    end

    always @(slv_reg2)
    begin
        wr_mod_fifo <= 1'b0;

        wr_data_fifo <= 1'b1;
        wr_seed_fifo <= 1'b0;
    end

    always @(slv_reg3)
    begin
        wr_mod_fifo <= 1'b0;

        wr_data_fifo <= 1'b0;
        wr_seed_fifo <= 1'b1;
    end
    

    // ==================  USER LOGIC  =====================
    
    // forced_resetn <= TO BE IMPLEMENTED
    // size <= TO BE IMPLEMENTED in fifo modules (how can I set the inputs size best on... size sent?)
    
    mod_fifo_1to4 mod_fifo(
                            .clk(S_AXI_ACLK), 
                            .resetn(S_AXI_ARESETN), //.forced_resetn(forced_resetn), 
                            .inp_fifo(slv_reg1), 
                            .wr_fifo(wr_mod_fifo), 
                            .decrease_fifo(mod_decrease), 
                            .outp_fifo(mode), 
                            .fifo_full(mod_fifo_full)
                            );
                            
    mod_fifo_1to4 data_fifo(
                            .clk(S_AXI_ACLK), 
                            .resetn(S_AXI_ARESETN), //.forced_resetn(forced_resetn),
                            .inp_fifo(slv_reg2), 
                            .wr_fifo(wr_data_fifo), 
                            .decrease_fifo(mod_decrease), 
                            .outp_fifo(data), 
                            .fifo_full(data_fifo_full)
                            );
                            
    mod_fifo_1to4 seed_fifo(
                            .clk(S_AXI_ACLK), 
                            .resetn(S_AXI_ARESETN), //.forced_resetn(forced_resetn),
                            .inp_fifo(slv_reg3), 
                            .wr_fifo(wr_seed_fifo), 
                            .decrease_fifo(1'b1), 
                            .outp_fifo(seed), 
                            .fifo_full(seed_fifo_full) 
                            );

    AES256_device device(
                         .clk(S_AXI_ACLK), .resetn(resetn),
                         .inp_device(data), .seed(seed_reg), .ctrl_dataIn(ctrl_dataIn), .mod_en(mode), 
                         .outp_device(outp_dev_reg), .ctrl_dataOut(ctrl_dataOut), .mod_decrease(mod_decrease)
                        );
                        
endmodule
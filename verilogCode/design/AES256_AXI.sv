

`define FIFO_SZ 10

module AES256_AXI(
                    S_AXI_ACLK, S_AXI_ARESETN, 
                    slv_reg0, slv_reg1, slv_reg2, slv_reg3, slv_reg4, slv_reg5, slv_reg6, slv_reg7, slv_reg8, slv_reg9 
                );

    input S_AXI_ACLK, S_AXI_ARESETN;
    input [31:0] slv_reg0, slv_reg1, slv_reg2, slv_reg3, slv_reg4, slv_reg5, slv_reg6, slv_reg7, slv_reg8, slv_reg9;

    integer index;

    // =========== USERS REGS & OTHERS  =============
    
    reg resetn;
    reg  mod_fifo_full;
    //wire mod_decrease;                                          // This is a wire since we don't want further delays
                                                                // Another solution might be to deleate the mod_decrease_delay and set mod_decrease as reg. 
    //reg mod_decrease_delay;                                                            

    reg mod_decrease;          

    reg [3:0] mod_cnt;
    reg [127:0] outp_dev_reg;
    
    reg [`FIFO_SZ-1:0][1:0] mod_fifo;
    reg [`FIFO_SZ-1:0][127:0] data_fifo;
    reg [127:0] seed_reg;
    
    integer i, index;
    
    
    // ===============  CREATED BY ME  ==============
	
	always @(posedge S_AXI_ACLK or negedge S_AXI_ARESETN)
	begin
	   if(!S_AXI_ARESETN)
	   begin
            //outp_dev_reg <= 0;
            resetn <= S_AXI_ARESETN;
	   end
	   
	   else
	   begin
	       if(slv_reg0[0])                         // Bit 0 - resetn
	       begin
	           resetn <= 1'b0;                     // CHECK WITH RICARDO !!!!!!
	       end
	       else
	           resetn <= S_AXI_ARESETN;
	       
	       if(slv_reg0[2] && !slv_reg0[1])         // Bit 2 - ctrl_dataOut and !ctrl_dataIn
	       begin
               
                $display("------------- AES KEY GENERATION -------------");
                for(i=0; i<=4+1; i=i+1)
                begin
                    $display("%h", i);
                    $display("%h %h %h %h %h %h %h %h %h %h %h %h %h %h %h %h \n", 
                                outp_dev_reg[i], outp_dev_reg[i+1], outp_dev_reg[i+2], outp_dev_reg[i+3],
                                outp_dev_reg[i+4], outp_dev_reg[i+5], outp_dev_reg[i+6], outp_dev_reg[i+7],
                                outp_dev_reg[i+8], outp_dev_reg[i+9], outp_dev_reg[i+10], outp_dev_reg[i+11],
                                outp_dev_reg[i+12], outp_dev_reg[i+13], outp_dev_reg[i+14], outp_dev_reg[i+15]
                            );
                end 
                $display("-----------------------------------------------");
                
	       end
	       
           /*
	       if(mod_fifo_full)                       // Bit 3 - fifos full
	           slv_reg0[3] <= 1'b1;
	       else
	           slv_reg0[3] <= 1'b0;
            */
	   end
	end

    // ==================  USER LOGIC  =====================

    AES256_device device(
                         .clk(S_AXI_ACLK), .resetn(S_AXI_ARESETN),
                         .inp_device(data_fifo[0]), .seed(seed_reg), .ctrl_dataIn(slv_reg0[1]), .mod_en(mod_fifo[0]), 
                         .outp_device(outp_dev_reg), .ctrl_dataOut(slv_reg0[2]), .mod_decrease(mod_decrease)
                        );

    // =====================================================
    always @(posedge S_AXI_ACLK or negedge S_AXI_ARESETN)
    begin
        if(!S_AXI_ARESETN)
        begin
            mod_cnt <= 0;
            mod_fifo_full <= 0;                                                        

            for(index=0; index < `FIFO_SZ; index=index+1)
            begin
                mod_fifo[index] <= 3;
                data_fifo[index] <= 0;
            end
        end

        else
        begin
        
            //mod_decrease_delay <= mod_decrease;
            
            if(slv_reg0[1])                                         // Bit 2 - ctrl_dataIn 
            begin
                if(mod_cnt == `FIFO_SZ)
                begin
                    mod_fifo_full <= 1'b1;
                end

                else
                begin
                    mod_fifo[mod_cnt] <= slv_reg1;

                    if(slv_reg1 == 0 || slv_reg1 == 1)
                        data_fifo[mod_cnt] <= {slv_reg5, slv_reg4, slv_reg3, slv_reg2};
                    else if (slv_reg1 == 2) 
                        seed_reg <= {slv_reg9, slv_reg8, slv_reg7, slv_reg6};

                    mod_cnt <= mod_cnt + 1;
                end
            end 

            //else if(mod_decrease_delay)
            else if(mod_decrease)
            begin
                /*
                if(mod_fifo[0] == 0 || mod_fifo[0] == 1)
                    inp_device <= data_fifo[0];
                else
                    inp_device <= seed_reg;
                */

                for(index = 0; index < `FIFO_SZ-1; index=index+1)
                begin
                    mod_fifo[index] <= mod_fifo[index+1];
                    data_fifo[index] <= data_fifo[index+1];
                end

                mod_cnt <= mod_cnt - 1;           
                mod_fifo_full <= 1'b0;                                                                                
            end
        end
    end

endmodule
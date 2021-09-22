

/****** mod_reg16.sv *******/

// Inputs: 16 inputs, 8 bits each
// Outputs: 16 output, 8 bits

module mod_reg16(clk, resetn, wr_en, rd_en, 
                i,
                o, reg_full, reg_reseted
                );

    localparam N = 16;
    integer index;

    input clk, resetn, wr_en, rd_en;
    input [N-1:0][7:0] i;
    
    reg [N-1:0][7:0] aux;
    reg OK_mC, OK_addRK;

    output reg reg_full;
    output reg [N-1:0][7:0] o;
    output reg reg_reseted;


    always @(posedge clk) //or posedge resetn)
    begin
        if(!resetn)
        begin
            reg_reseted = 1'b1;
            //reg_full = 1'b0;                                  // We should reset it, but then it gives problems giving an empty input to addRK
            /*
            for(index=0; index < N; index=index+1)
                aux[index] = 8'h00;
            */

        end
        else 
        begin
            OK_addRK = rd_en;
            OK_mC = wr_en;

            if(OK_mC && !reg_full)                             // WR_en is OK_mC
            begin
                reg_full = 1'b1;
                OK_mC = 1'b0;
                reg_reseted = 1'b0;
                
                for(index=0; index < N; index=index+1)
                    aux[index] = i[index];
            end
            else if(reg_full && OK_addRK)
            begin
                reg_full = 1'b0;
                OK_addRK = 1'b0;
                for(index=0; index < N; index=index+1)
                    o[index] = aux[index];
            end
        end
    end

    /*
    always @(posedge i)
    begin
        reg_full = 1'b0;
    end

    always @(negedge i)
    begin
        reg_full = 1'b0;
    end
    */
    

endmodule
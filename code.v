`timescale 1ns / 1ps


module bit_alu(

    input  [31:0] A,B,       
          
    input  [3:0] ALU_Sel,
    output reg [63:0] ALU_Out, 
    output reg CarryOut   
);
    always @(*) begin
        case (ALU_Sel)
            4'b0000: {CarryOut, ALU_Out} = A + B; 
            4'b0001: ALU_Out = A - B;            
            4'b0010: ALU_Out = A & B;              
            4'b0011: ALU_Out = A | B;             
            4'b0100: ALU_Out = A ^ B;             
            4'b0101: ALU_Out = ~A;                
            4'b0110: ALU_Out =~B;             
            4'b0111: ALU_Out = A * B; 
            4'b1000: ALU_Out =A + 1; 
            4'b1001: ALU_Out = A - 1;
            4'b1010: ALU_Out = B + 1;
            4'b1011: ALU_Out = B - 1;    
            4'b1100: ALU_Out = ~(A&B);
            4'b1101: ALU_Out =~(A|B);
            4'b1110: ALU_Out =~(A^B);
            4'b1111: ALU_Out = A; 
            default: ALU_Out = 16'd0;           
        endcase

        if (ALU_Sel == 4'b0000)
            CarryOut = (A + B > 16'hFF);
        else
            CarryOut = 1'b0;
    end

endmodule

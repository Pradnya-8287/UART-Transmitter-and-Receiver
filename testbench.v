`timescale 1ns/10ps
`include "transmitter.v"
`include "receiver.v"

module testbench ();
 
    reg clk = 0;
    reg r_DV = 0;
    wire w_Done;
    reg [7:0] r_Byte = 0;
    reg r_Rx_Serial = 1;
    wire [7:0] w_R_Byte;
    wire w_Sig_Active;
    wire w_Serial_Data;
    wire w_DV;
    
    transmitter DUT (
        .clk(clk),
        .i_DV(r_DV),
        .i_Byte(r_Byte),
        .o_Sig_Active(w_Sig_Active),
        .o_Serial_Data(w_Serial_Data),
        .o_Sig_Done(w_Done)
    );

    receiver UUT (
        .clk(clk),
        .i_Serial_Data(w_Serial_Data),
        .o_DV(w_DV),
        .o_Byte(w_R_Byte)
    );
   
    always #50
        clk <= !clk;

    initial begin
    $dumpfile("testbench.vcd");
    $dumpvars(0, testbench);

    r_Byte <= 8'd100;
    @(negedge clk);
    r_DV <= 1'b1;
    @(posedge clk);
    r_DV <= 1'b0;

    wait (w_DV);
    #1000;            

    if (w_R_Byte == 8'd100)
        $display("Correct");

    $finish;
    end
   
endmodule

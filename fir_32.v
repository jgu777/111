module fir_32 (
        input                   sys_clk,
        input                   sys_rst_n,
        input    signed [23:0]  x_in,
        input                   valid_in,
        output   signed [47:0]  y_out,
        output                  valid_out,
        output                  fir_ip_data_ready
    );
    
   // wire signed [23:0] x_in_extended;
   // wire signed [35:0] y_out_shortened;
    
   // assign x_in_extended = {{6{x_in[17]}}, x_in};
   // assign y_out = {{4{y_out_shortened[35]}},y_out_shortened};
    
    //Fir Compiler IP
    fir_compiler_0 fir_compiler_0(
        .aclk(sys_clk),
        .aresetn(sys_rst_n),
        .s_axis_data_tvalid(valid_in),
        .s_axis_data_tdata(x_in),
        .s_axis_data_tready(fir_ip_data_ready),  // tell other modules that fir IP core has been ready to receive new data
        .m_axis_data_tvalid(valid_out),
        .m_axis_data_tdata(y_out)
    );
    
endmodule

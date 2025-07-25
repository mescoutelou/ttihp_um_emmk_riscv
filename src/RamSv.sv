// Generated by CIRCT firtool-1.62.0
/*
 * File: RamSv.sv
 * Created Date: 2025-04-22 08:23:20 am
 * Author: Mathieu Escouteloup
 * -----
 * Last Modified: 2025-06-27 09:52:20 am
 * Modified By: Mathieu Escouteloup
 * Email: mathieu.escouteloup@enseirb-matmeca.fr
 * -----
 * License: See LICENSE.md
 * Copyright (c) 2025 ENSEIRB-MATMECA
 * -----
 * Description: 
 */

module RamSv
  #(  parameter INIT_FILE = "",
      parameter N_DATA = 64,
      parameter N_DATA_BYTE = 4,
      
      localparam N_ADDRBIT = $clog2(N_DATA))

  (   input logic                       i_clock,
      input logic                       i_reset,

      // PORT
      input logic                       i_en,
      input logic [N_ADDRBIT-1:0]       i_addr,
      input logic [N_DATA_BYTE-1:0]     i_wen,
      input logic [N_DATA_BYTE*8-1:0]   i_wdata,
      output logic [N_DATA_BYTE*8-1:0]  o_rdata
  );  

  logic [N_DATA_BYTE*8 - 1: 0] r_mem [N_DATA - 1:0];

  // ******************************
  //           FILE INIT
  // ******************************  
  `ifdef verilator
    export "DPI-C" task ext_readmemh_data;

    task ext_readmemh_data;
      input string TASK_INIT_FILE;
      $readmemh(TASK_INIT_FILE, r_mem);
    endtask
  `else
    initial begin
      if (INIT_FILE != "") begin
        $readmemh(INIT_FILE, r_mem);
      end
    end
  `endif  

  // ******************************
  //              READ
  // ******************************
  always_ff @(posedge i_clock) begin
    if (i_reset) begin
      o_rdata <= 'h0;
    end
    else begin
      if (i_en) begin
        o_rdata <= r_mem[i_addr];
      end
    end
  end

  // ******************************
  //             WRITE
  // ******************************
  always_ff @(posedge i_clock) begin
    if (~i_reset) begin
      for (int db = 0; db < N_DATA_BYTE; db++) begin
        if (i_en && i_wen[db]) begin
          r_mem[i_addr][db*8 +: 8] <= i_wdata[db*8 +: 8];
        end
      end  
    end    
  end

  // ******************************
  //            DEBUG
  // ******************************

endmodule

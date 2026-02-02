module alu(
  input  [3:0] a, b,
  input  [1:0] sel,
  output reg [4:0] result
);

  always @(*) begin


    case (sel)

      2'b00: begin           
        result = a + b;
      end

      2'b01: begin           
        result = a - b;
      end

      2'b10: begin            
        result = a & b;
      end

      2'b11: begin            
        result = a | b;
      end

      default: begin
        result = 4'b0;
      end

    endcase
  end
endmodule


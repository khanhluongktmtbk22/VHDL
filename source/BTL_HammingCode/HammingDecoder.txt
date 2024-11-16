module hamming_decoder(input [6:0] received, output [3:0] data, output reg [2:0] error);
    reg [6:0] decoded;
    always @(received[0] or received[1] or received[2] or received[3] or received[4] or
    received[5] or received[6]) begin
        decoded[2] = received[0] ^ received[1] ^ received[2] ^ received[3];
        decoded[1] = received[0] ^ received[1] ^ received[4] ^ received[5];
        decoded[0] = received[6] ^ received[0] ^ received[2] ^ received[4];
        error[0] =  decoded[0];
        error[1] =  decoded[1];
        error[2] = decoded[2];
        if (error[0] == 1 && error[1] == 0 && error[2] == 0) begin
                decoded[6] = ~received[6];
                decoded[5] = received[5];
                decoded[4] = received[4];
                decoded[3] = received[3];
            end else if (error[0] == 0 && error[1] == 1 && error[2] == 0) begin
                decoded[6] = received[6];
                decoded[5] = ~received[5];
                decoded[4] = received[4];
                decoded[3] = received[3];
            end else if (error[0] == 1 && error[1] == 1 && error[2] == 0) begin
                 decoded[6] = received[6];
                 decoded[5] = received[5];
                 decoded[4] = ~received[4];
                 decoded[3] = received[3];
            end else if(error[0] == 0 && error[1] == 0 && error[2] == 1) begin
                 decoded[6] = received[6];
                 decoded[5] = received[5];
                 decoded[4] = received[4];
                 decoded[3] = ~received[3];
            end else if(error[0] == 1 && error[1] == 0 && error[2] == 1) begin
                 decoded[6] = received[6];
                 decoded[5] = received[5];
                 decoded[4] = received[4];
                 decoded[3] = received[3];
            end else if(error[0] == 0 && error[1] == 1 && error[2] == 1) begin
                 decoded[6] = received[6];
                 decoded[5] = received[5];
                 decoded[4] = received[4];
                 decoded[3] = received[3];
            end else if(error[0] == 1 && error[1] == 1 && error[2] == 1) begin
                decoded[6] = received[6];
                decoded[5] = received[5];
                decoded[4] = received[4];
                decoded[3] = received[3];
            end else begin 
                decoded[6] = received[6];
                decoded[5] = received[5];
                decoded[4] = received[4];
                decoded[3] = received[3];
            end
            end
    assign data = decoded[6:3];
endmodule
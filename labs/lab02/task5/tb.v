module tb;

reg [3:0] t_a;
reg [3:0] t_b;
reg t_op;

wire [3:0] t_result;

integer errors;

alu DUT (
    .a(t_a),
    .b(t_b),
    .op(t_op),
    .result(t_result)
);

initial begin
    errors = 0;

    // Test 1: Addition
    t_a = 4'd5;
    t_b = 4'd2;
    t_op = 1'b0;
    #1;

    if (t_result !== 4'd7) begin
        $display("FAIL: A=%d B=%d op=%b got=%d expected=%d",
                 t_a, t_b, t_op, t_result, 7);
        errors = errors + 1;
    end
    else begin
        $display("PASS: A=%d B=%d op=%b result=%d",
                 t_a, t_b, t_op, t_result);
    end


    // Test 2: SAME operands, change only op
    // This tests whether op is in the sensitivity list
    t_op = 1'b1;
    #1;

    if (t_result !== 4'd3) begin
        $display("FAIL: A=%d B=%d op=%b got=%d expected=%d",
                 t_a, t_b, t_op, t_result, 3);
        errors = errors + 1;
    end
    else begin
        $display("PASS: A=%d B=%d op=%b result=%d",
                 t_a, t_b, t_op, t_result);
    end


    // Test 3: Subtraction with different operands
    t_a = 4'd9;
    t_b = 4'd4;
    t_op = 1'b1;
    #1;

    if (t_result !== 4'd5) begin
        $display("FAIL: A=%d B=%d op=%b got=%d expected=%d",
                 t_a, t_b, t_op, t_result, 5);
        errors = errors + 1;
    end
    else begin
        $display("PASS: A=%d B=%d op=%b result=%d",
                 t_a, t_b, t_op, t_result);
    end


    // Test 4: Another subtraction
    t_a = 4'd7;
    t_b = 4'd3;
    t_op = 1'b1;
    #1;

    if (t_result !== 4'd4) begin
        $display("FAIL: A=%d B=%d op=%b got=%d expected=%d",
                 t_a, t_b, t_op, t_result, 4);
        errors = errors + 1;
    end
    else begin
        $display("PASS: A=%d B=%d op=%b result=%d",
                 t_a, t_b, t_op, t_result);
    end


    // Test 5: Addition again
    t_a = 4'd3;
    t_b = 4'd6;
    t_op = 1'b0;
    #1;

    if (t_result !== 4'd9) begin
        $display("FAIL: A=%d B=%d op=%b got=%d expected=%d",
                 t_a, t_b, t_op, t_result, 9);
        errors = errors + 1;
    end
    else begin
        $display("PASS: A=%d B=%d op=%b result=%d",
                 t_a, t_b, t_op, t_result);
    end


    $display("Total errors = %0d", errors);

    $finish;
end

endmodule
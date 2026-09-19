module tb;

reg [1:0] t_a;
reg [1:0] t_b;

wire t_gt;
wire t_lt;
wire t_eq;

integer errors;
integer i;
integer j;

comp2 DUT (
    .A(t_a),
    .B(t_b),
    .GT(t_gt),
    .LT(t_lt),
    .EQ(t_eq)
);

initial begin
    errors = 0;

    for (i = 0; i < 4; i = i + 1) begin
        for (j = 0; j < 4; j = j + 1) begin

            t_a = i;
            t_b = j;

            #1;

            if ({t_gt, t_lt, t_eq} !==
                {(i > j), (i < j), (i == j)}) begin

                $display("FAIL: A=%b B=%b | Got GT=%b LT=%b EQ=%b | Expected GT=%b LT=%b EQ=%b",
                         t_a, t_b,
                         t_gt, t_lt, t_eq,
                         (i > j), (i < j), (i == j));

                errors = errors + 1;
            end
        end
    end

    if (errors == 0)
        $display("PASS: All 16 combinations passed.");
    else
        $display("FAIL: %0d out of 16 combinations failed.", errors);

    $finish;
end

endmodule
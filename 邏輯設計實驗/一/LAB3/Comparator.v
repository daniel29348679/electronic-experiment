module Comparator (
    A,
    B,
    A_gt_b,
    A_eq_b,
    A_lt_b
);

    output A_gt_b, A_eq_b, A_lt_b;
    input [3:0] A, B;

    assign A_gt_b = A[3]&(!B[3]) | ((A[3]^~B[3]) & A[2]&&(!B[2])) | ((A[3]^~B[3]) &(A[2]^~B[2]) & A[1]&(!B[1])) | ((A[3]^~B[3]) &(A[2]^~B[2]) &(A[1]^~B[1])& A[0]&(!B[0]));
    assign A_eq_b = (A[3] ^~ B[3]) & (A[2] ^~ B[2]) & (A[1] ^~ B[1]) & (A[0] ^~ B[0]);
    assign A_lt_b = !(A_gt_b | A_eq_b);


endmodule

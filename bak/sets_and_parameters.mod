param n default 1;
param m default 1;
param k default 1;

set I := 1..n;   # set of indices for the constraints
set J := 1..m;   # set of indices for the decision variables
set K := 1..k;   # set of indices for the projected problem

param c{J};
param A{I,J}; # matrix of size n*m
param A_proj{K,J};
param b{I};
param b_proj{K};
param T{K,I};
param G{J,I}; # generalized inverse of A

/*
param c{j in J} default 0 ;
param A{i in I,j in J} default 0; # matrix of size n*m
param b{i in I} default 0;
param T{l in K,i in I} default 0;
param G{j in J,i in I} default 0; # generalized inverse of A
*/

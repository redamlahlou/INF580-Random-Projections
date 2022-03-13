param n;
param m;
param k;

set I := 1..n;   # set of indices for the constraints
set J := 1..m;   # set of indices for the decision variables
set K := 1..k;   # set of indices for the projected problem

param c{J};
param A{I,J}; # matrix of size n*m
param b{I};
param T{K,J};
param G{J,I}; # generalized inverse of A
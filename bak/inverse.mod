## generalized matrix inversion as an LP problem :
# we want to find G so that A*G*A = A

param n;
param m;
param k;

set I := 1..n;   # set of indices for the constraints
set J := 1..m;   # set of indices for the decision variables
set K := 1..k;   # set of indices for the projected problem

param c{J};      # (not used in this model)
param A{I,J};	 
param b{I};	  	 # (not used in this model)
param T{K,I};    # (not used in this model)

var G{J,I};

subject to InverseDefn {i in I, j in J}:
	sum {l_1 in J, l_2 in I} A[i,l_1]*G[l_1,l_2]*A[l_2,j] = A[i,j];

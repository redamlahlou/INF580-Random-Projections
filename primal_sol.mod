## primal solution from dual solution

#param n;
#param m;
#param k;

#set I := 1..n;   # set of indices for the constraints
#set J := 1..m;   # set of indices for the decision variables
#set K := 1..k;   # set of indices for the projected problem

#param c{J};
#param A{I,J};	 
#param b{I};
#param T{K,I};
#param y_plus{I};
#param y_minus{I};

var x{J} >= 0;

subject to complementary_slackness_primal:
	sum{j in J} (sum{i in I} y_[i]*A[i,j] - c[j])*x[j] = 0;

subject to complementary_slackness_dual:
	sum{i in I} y_[i]*(b[i]-sum{j in J} A[i,j]*x[j]) = 0;
	
subject to constraints_{i in I}:
	sum{j in J} A[i,j]*x[j] = b[i];
	
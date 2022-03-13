## primal solution from dual solution

var x_{J} >= 0;

subject to complementary_slackness_primal:
	sum{j in J} (sum{i in I} y[i]*A[i,j] - c[j])*x_[j] = 0;

subject to complementary_slackness_dual:
	sum{i in I} y[i]*(b[i]-sum{j in J} A[i,j]*x_[j]) = 0;
	
subject to feasibility_primal{i in I}:
	sum{j in J} A[i,j]*x_[j] = b[i];
	
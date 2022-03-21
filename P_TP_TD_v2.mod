### sets and parameters of P,TP and TD ###

param n;
param m;
param k;

set I := 1..n;   # set of indices for the constraints
set J := 1..m;   # set of indices for the decision variables
set K := 1..k;   # set of indices for the projected problem

param c{J};
param A{I,J};
param A_proj{K,J};
param b{I};
param b_proj{K};
param T{K,I};



### primal model (P) ###

var x{J} >= 0;

minimize f_P:
	sum{j in J} c[j]*x[j];
	
subject to constraints_P{i in I}:
	sum{j in J} A[i,j]*x[j] = b[i];
	
	
	
### primals projected model (TP) ###

var x_proj{J} >= 0;

minimize f_TP:
	sum{j in J} c[j]*x_proj[j];
	
subject to constraints_TP{i in K}:
	sum{j in J} A_proj[i,j]*x_proj[j] = b_proj[i];
	
	
	
### dual projected model (TD) ###

var y_proj{K};

maximize g_TD:
	sum{l in K} y_proj[l]*b_proj[l];
	
subject to constraints_TD{j in J}:
	sum{l in K} y_proj[l]*A_proj[l,j] <= c[j];
	
	
### model to find an estimation of x_opt from y=y_proj_opt*T (TDP) ###
## using the first order Kuhn et Tucker conditions

var y{I};								# y <- y_proj*T (fixed in this model)
var s_p_plus{J} >= 0;					# positive slackness in the primal kkt condition
var s_p_minus{J} >= 0;					# negative slackness in the primal kkt condition 					
var s_d_plus{I} >= 0;					# positive slackness in the dual kkt condition
var s_d_minus{I} >= 0;					# negative slackness in the dual kkt condition 	


minimize f_TDP:
	sum{j in J} (s_p_plus[j] + s_p_minus[j]) + sum{i in I} (s_d_plus[i] + s_d_minus[i]);		# minimizing the distance between x_opt and x_TDP_opt

subject to complementary_slackness_primal{j in J}:
	(sum{i in I} y[i]*A[i,j] - c[j])*x[j] + s_p_plus[j] - s_p_minus[j] = 0;

subject to complementary_slackness_dual{i in I}:
	y[i]*(b[i]-sum{j in J} A[i,j]*x[j]) + s_d_plus[i] - s_d_minus[i] = 0;

## primals (P and TP)

var x_proj{J} >= 0;

minimize f_TP:
	sum{j in J} c[j]*x_proj[j];
	
subject to constraints_TP{i in K}:
	sum{j in J} A_proj[i,j]*x_proj[j] = b_proj[i];




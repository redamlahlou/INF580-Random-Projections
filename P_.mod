## primals (P and TP)

var x{J} >= 0;

minimize f_P:
	sum{j in J} c[j]*x[j];
	
subject to constraints_P{i in I}:
	sum{j in J} A[i,j]*x[j] = b[i];




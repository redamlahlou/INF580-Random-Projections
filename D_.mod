## duals (D and TD)

var y{I};

maximize g:
	sum{i in I} y[i]*b[i];
	
subject to constraints_D{j in J}:
	sum{i in I} y[i]*A[i,j] <= c[j];
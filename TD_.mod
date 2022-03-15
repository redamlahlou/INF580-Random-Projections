## duals (D and TD)

var y_proj{K};

maximize g_TD:
	sum{l in K} y_proj[l]*b_proj[l];
	
subject to constraints_TD{j in J}:
	sum{l in K} y_proj[l]*A_proj[l,j] <= c[j];
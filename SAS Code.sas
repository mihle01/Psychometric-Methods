libname HW11 "/home/u60739998/BS 805/Class 11";

data temp;
	set HW11.saq2022;
run;

proc corr data=temp alpha nomiss;
	var q01-q23;
run;

proc factor data=temp
	simple
	method=prin
	mineigen=1
	scree
	rotate=varimax
	nfactors=5
	out=out;
	
	var q01-q23;
run;

proc corr data=out;
	var factor1-factor5;
	with q01-q23;
run;
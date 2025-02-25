# isdividing

my $coefs = new Vector<Int>([10,4,6,0,1,4,2,0,0,4,5,1,2,4,9]);
my $C = new RealQuarticCurve<Min>(COEFFICIENTS=>$coefs,SIGNS=>[1,1,1,1,1,1,1,1,1,1,1,1,1,1,1]);

compare_values("dividing", false, $C->IS_DIVIDING); #this should have 1 real ovals so not dividing is correct. Visualize it again to be sure
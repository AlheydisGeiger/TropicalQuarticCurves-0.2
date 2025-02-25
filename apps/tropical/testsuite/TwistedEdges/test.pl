#twistededges

my $coefs = new Vector<Int>([10,4,6,0,1,4,2,0,0,4,5,1,2,4,9]);
my $C = new RealQuarticCurve<Min>(COEFFICIENTS=>$coefs,SIGNS=>[1,1,1,1,1,1,1,1,1,1,1,1,1,1,1]);

compare_data('twistededges',  $C->TWISTED_EDGES); #need to check these by hand!
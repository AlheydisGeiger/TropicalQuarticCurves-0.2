# OVALS

my $coefs = new Vector<Int>([10,4,6,0,1,4,2,0,0,4,5,1,2,4,9]);
my $C = new RealQuarticCurve<Min>(COEFFICIENTS=>$coefs,SIGNS=>[1,1,1,1,1,1,1,1,1,1,1,1,1,1,1]);
my $C2 = new RealQuarticCurve<Min>(COEFFICIENTS=>$coefs,SIGNS=>[1,1,1,1,1,1,1,1,1,1,1,-1,1,1,-1]);
my $C3 = new RealQuarticCurve<Min>(COEFFICIENTS=>$coefs,SIGNS=>[1,1,1,1,-1,1,1,-1,-1,1,1,-1,1,1,1]);
my $coefs2 = new Vector<Int>([5,1,2,2,0,0,4,0,1,16,7,9,12,16,33]);
my $D = new RealQuarticCurve<Min>(COEFFICIENTS=>$coefs2,SIGNS=>[1,1,1,1,1,1,1,1,1,1,1,1,1,1,1]);

compare_values("Ovals1", 1, $C->N_OVALS); 
compare_values("Ovals2", 2, $C2->N_OVALS);
compare_values("Ovals3", 3, $D->N_OVALS);
compare_values("Ovals4", 4, $C3->N_OVALS); 
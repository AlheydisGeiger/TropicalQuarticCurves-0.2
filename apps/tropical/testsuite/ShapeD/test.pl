# 0

my $coeffs = new Vector<Int>([14,8,5,3,1,0,0,0,1,3,1,4,8,13,19]);
my $curve = new QuarticCurve<Min>(COEFFICIENTS=>$coeffs);
my $stored_curve = load('curve0minweights.poly');

compare_values('0:BITANGENT_SHAPES',$stored_curve->BITANGENT_SHAPES,$curve->BITANGENT_SHAPES);

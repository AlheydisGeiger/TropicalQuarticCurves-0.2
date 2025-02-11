# Example 111
my $stored_curve1 = load('curve111-O.poly');
my $coeffs1 = new Vector([0,0,0,1/12,1/6,5/12,1/3,1/2,1,5/3,11/12,1,7/4,31/12,7/2]);
my $curve1  = new QuarticCurve<Min>(COEFFICIENTS=>$coeffs1);

compare_values('111O:BITANGENT_SHAPES', $stored_curve1->BITANGENT_SHAPES,$curve1->BITANGENT_SHAPES);

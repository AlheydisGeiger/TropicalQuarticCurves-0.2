# Example 105
my $stored_curve1 = load('curve106-B.poly');
my $stored_curve2 = load('curve106-H.poly');
my $coeffs1 = new Vector([1,11/48,0,0,-9/16,-11/12,-5/48,-29/48,-25/24,-4/3,1/6,-1/16,-5/24,-11/48,0]);
my $coeffs2 = new Vector([0,-1/2,0,-7/12,-5/12,1/24,-7/12,-3/8,0,13/24,-11/24,1/6,7/8,5/3,61/24]);
my $curve1  = new QuarticCurve<Min>(COEFFICIENTS=>$coeffs1);
my $curve2 = new QuarticCurve<Min>(COEFFICIENTS=>$coeffs2);

compare_values('106B:BITANGENT_SHAPES', $stored_curve1->BITANGENT_SHAPES,$curve1->BITANGENT_SHAPES);
compare_values('106H:BITANGENT_SHAPES', $stored_curve2->BITANGENT_SHAPES,$curve2->BITANGENT_SHAPES);

# Example 16
my $stored_curve1 = load('curve16minweight.poly');
my $stored_curve2 = load('curve16relint.poly');
my $coeffs1 = new Vector([-15,-7,-7,-3,-1,0,0,0,-1,-3,-1,-4,-8,-13,-19]);
my $coeffs2 = new Vector([-1,-29/96,0,0,47/96,11/12,17/96,9/16,85/96,55/48,-1/24,5/32,13/48,25/96,0]);
my $curve1  = new QuarticCurve<Max>(COEFFICIENTS=>$coeffs1);
my $curve2 = new QuarticCurve<Max>(COEFFICIENTS=>$coeffs2);

compare_values('16E:BITANGENT_SHAPES', $stored_curve1->BITANGENT_SHAPES,$curve1->BITANGENT_SHAPES);
compare_values('16F:BITANGENT_SHAPES', $stored_curve2->BITANGENT_SHAPES,$curve2->BITANGENT_SHAPES);

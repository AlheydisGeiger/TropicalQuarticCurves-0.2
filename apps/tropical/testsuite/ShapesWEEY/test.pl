# Example 105
my $stored_curve1 = load('curve105-EE.poly');
my $stored_curve2 = load('curve105-W.poly');
my $stored_curve3 = load('curve105-Y.poly');
my $coeffs1 = new Vector([0,0,0,1/12,1/6,1/3,1/3,7/12,11/12,23/12,11/12,23/18,121/72,13/6,43/12]);
my $coeffs2 = new Vector([0,0,0,1/12,1/6,1/3,1/3,7/12,1,11/6,11/12,49/36,133/72,29/12,41/12]);
my $coeffs3 = new Vector([0,0,0,1/12,1/6,1/3,1/3,2/3,13/12,25/12,13/12,55/36,145/72,31/12,47/12]);
my $curve1  = new QuarticCurve<Min>(COEFFICIENTS=>$coeffs1);
my $curve2 = new QuarticCurve<Min>(COEFFICIENTS=>$coeffs2);
my $curve3 = new QuarticCurve<Min>(COEFFICIENTS=>$coeffs3);

compare_values('105EE:BITANGENT_SHAPES', $stored_curve1->BITANGENT_SHAPES,$curve1->BITANGENT_SHAPES);
compare_values('105W:BITANGENT_SHAPES', $stored_curve2->BITANGENT_SHAPES,$curve2->BITANGENT_SHAPES);
compare_values('105Y:BITANGENT_SHAPES', $stored_curve3->BITANGENT_SHAPES,$curve3->BITANGENT_SHAPES);

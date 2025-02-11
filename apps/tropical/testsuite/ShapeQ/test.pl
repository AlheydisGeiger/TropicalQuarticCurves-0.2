# Example #1

my $coeffs = new Vector([0,0,1,-1/9,43/54,8/5,-5/18,127/270,613/540,103/60,-134/135,-89/180,-29/270,61/540,0]);
my $curve = new QuarticCurve<Max>(COEFFICIENTS=>$coeffs);
my $stored_curve = load('curve1relint.poly');

compare_values('1:BITANGENT_SHAPES',$stored_curve->BITANGENT_SHAPES,$curve->BITANGENT_SHAPES);

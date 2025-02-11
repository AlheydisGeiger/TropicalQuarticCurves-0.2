# Example 269
my $stored_curve1 = load('curve269-B.poly');
my $stored_curve2 = load('curve269-Byz.poly');
my $stored_curve3 = load('curve269-H.poly');
my $coeffs1 = new Vector([1/15,14/15,0,73/40,9041/20475,0,83/30,26486/20475,0,1/15,156901/40950,99119/40950,93659/81900,-1/10,1/5]);
my $coeffs2 = new Vector([1/16,7/8,0,47/24,-343/480,0,19/6,0,-929/480,1/16,91/20,719/480,-3/8,-1019/480,3/16]);
my $coeffs3 = new Vector([1/10,13/20,0,7/5,-11/4,-1/20,89/40,-12/5,-107/20,0,73/20,0,-23/8,-28/5,1/10]);
my $curve1  = new QuarticCurve<Min>(COEFFICIENTS=>$coeffs1);
my $curve2 = new QuarticCurve<Min>(COEFFICIENTS=>$coeffs2);
my $curve3 = new QuarticCurve<Min>(COEFFICIENTS=>$coeffs3);

compare_values('269B:BITANGENT_SHAPES', $stored_curve1->BITANGENT_SHAPES,$curve1->BITANGENT_SHAPES);
compare_values('269Byz:BITANGENT_SHAPES', $stored_curve2->BITANGENT_SHAPES,$curve2->BITANGENT_SHAPES);
compare_values('269H:BITANGENT_SHAPES', $stored_curve3->BITANGENT_SHAPES,$curve3->BITANGENT_SHAPES);

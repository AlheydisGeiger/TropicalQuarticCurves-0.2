# Example 269
my $stored_curve1 = load('curve1175-D.poly');
my $stored_curve2 = load('curve1175-Q.poly');
my $stored_curve3 = load('curve1175-R.poly');
my $coeffs1 = new Vector([1,0,0,-23/24,-31/30,-23/24,-11/6,-69/40,-557/504,-1753/5040,-279/280,-589/756,-631/1512,0,271/504]);
my $coeffs2 = new Vector([1,0,0,-19/20,-26/25,-19/20,-9/5,-167/100,-41/42,-913/4200,-977/700,-673/630,-143/252,0,271/420]);
my $coeffs3 = new Vector([11/12,0,0,-41/48,-25/24,-2/3,-19/12,-13/12,3/8,91/48,0,7/12,29/16,19/6,55/12]);
my $curve1  = new QuarticCurve<Min>(COEFFICIENTS=>$coeffs1);
my $curve2 = new QuarticCurve<Min>(COEFFICIENTS=>$coeffs2);
my $curve3 = new QuarticCurve<Min>(COEFFICIENTS=>$coeffs3);

compare_values('1175D:BITANGENT_SHAPES', $stored_curve1->BITANGENT_SHAPES,$curve1->BITANGENT_SHAPES);
compare_values('1175Q:BITANGENT_SHAPES', $stored_curve2->BITANGENT_SHAPES,$curve2->BITANGENT_SHAPES);
compare_values('1175R:BITANGENT_SHAPES', $stored_curve3->BITANGENT_SHAPES,$curve3->BITANGENT_SHAPES);

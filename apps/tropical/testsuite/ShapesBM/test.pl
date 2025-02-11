# Example 8
my $stored_curve1 = load('curve8minweight.poly');
my $stored_curve2 = load('curve8relint.poly');
my $coeffs1 = new Vector([-8,-4,-3,-2,0,0,-1,0,-1,-3,-2,-5,-9,-14,-20]);
my $coeffs2 = new Vector([-1,-41/104,0,0,55/104,213/260,29/104,183/260,487/520,289/260,29/130,177/520,99/260,159/520,0]);
my $curve1  = new QuarticCurve<Max>(COEFFICIENTS=>$coeffs1);
my $curve2 = new QuarticCurve<Max>(COEFFICIENTS=>$coeffs2);

compare_values('8M:BITANGENT_SHAPES', $stored_curve1->BITANGENT_SHAPES,$curve1->BITANGENT_SHAPES);
compare_values('8B:BITANGENT_SHAPES', $stored_curve2->BITANGENT_SHAPES,$curve2->BITANGENT_SHAPES);

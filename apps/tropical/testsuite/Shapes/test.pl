# Example #3 and 7
my $coeffs1 = new Vector([-13,-8,-4,-4,-1,0,-2,0,0,-1,-2,-4,-7,-11,-16]);
my $coeffs2 = new Vector([-9,-5,-2,-2,0,-1,-1,0,0,-2,-2,-5,-9,-14,-20]);
my $curve1 = new QuarticCurve<Max>(COEFFICIENTS=>$coeffs1);
my $curve2 = new QuarticCurve<Max>(COEFFICIENTS=>$coeffs2);
my $stored_curve1 = load('curve3minweight.poly');
my $stored_curve2 = load('curve7minweight.poly');
compare_values('3:BITANGENT_SHAPES',$stored_curve1->BITANGENT_SHAPES,$curve1->BITANGENT_SHAPES);
compare_values('7:BITANGENT_SHAPES',$stored_curve2->BITANGENT_SHAPES,$curve2->BITANGENT_SHAPES);

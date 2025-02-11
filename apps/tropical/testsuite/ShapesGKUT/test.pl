# Example 1175
my $stored_curve1 = load('curve1175-firstU.poly');
my $stored_curve2 = load('curve1175-G.poly');
my $stored_curve3 = load('curve1175-secondG.poly');
my $stored_curve4 = load('curve1175-secondU.poly');
my $stored_curve5 = load('curve1175-T.poly');
my $stored_curve6 = load('curve1175-V.poly');
my $coeffs1 = new Vector([1,0,0,-15/16,-21/20,-15/16,-7/4,-127/80,-36/35,-193/560,-1867/1680,-697/840,-767/1680,0,279/560]);
my $coeffs2 = new Vector([1,0,0,-15/16,-21/20,-15/16,-7/4,-127/80,-61/60,-77/240,-281/240,-37/40,-121/240,0,131/240]);
my $coeffs3 = new Vector([1,0,0,-15/16,-21/20,-15/16,-7/4,-127/80,-61/60,-77/240,-281/240,-37/40,-121/240,0,131/240]);
my $coeffs4 = new Vector([1,0,0,-15/16,-17/16,-11/12,-7/4,-37/24,-139/160,-17/240,-49/80,-53/160,0,73/160,41/40]);
my $coeffs5 = new Vector([1,0,0,-15/16,-17/16,-11/12,-7/4,-37/24,-129/160,13/240,-69/80,-73/160,0,93/160,51/40]);
my $coeffs6 = new Vector([1,0,0,-15/16,-21/20,-15/16,-7/4,-127/80,-1763/1680,-649/1680,-1447/1680,-557/840,-209/560,0,697/1680]);
my $curve1  = new QuarticCurve<Min>(COEFFICIENTS=>$coeffs1);
my $curve2 = new QuarticCurve<Min>(COEFFICIENTS=>$coeffs2);
my $curve3 = new QuarticCurve<Min>(COEFFICIENTS=>$coeffs3);
my $curve4  = new QuarticCurve<Min>(COEFFICIENTS=>$coeffs4);
my $curve5 = new QuarticCurve<Min>(COEFFICIENTS=>$coeffs5);
my $curve6 = new QuarticCurve<Min>(COEFFICIENTS=>$coeffs6);

compare_values('1175firstU:BITANGENT_SHAPES', $stored_curve1->BITANGENT_SHAPES,$curve1->BITANGENT_SHAPES);
compare_values('1175G:BITANGENT_SHAPES', $stored_curve2->BITANGENT_SHAPES,$curve2->BITANGENT_SHAPES);
compare_values('1175secondG:BITANGENT_SHAPES', $stored_curve3->BITANGENT_SHAPES,$curve3->BITANGENT_SHAPES);
compare_values('1175secondU:BITANGENT_SHAPES', $stored_curve4->BITANGENT_SHAPES,$curve4->BITANGENT_SHAPES);
compare_values('1175T:BITANGENT_SHAPES', $stored_curve5->BITANGENT_SHAPES,$curve5->BITANGENT_SHAPES);
compare_values('1175V:BITANGENT_SHAPES', $stored_curve6->BITANGENT_SHAPES,$curve6->BITANGENT_SHAPES);


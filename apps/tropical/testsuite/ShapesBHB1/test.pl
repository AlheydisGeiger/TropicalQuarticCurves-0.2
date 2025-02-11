# Example 269
my $stored_curve1 = load('curve267-shapeB1.poly');
my $stored_curve2 = load('curve267-shapeB2.poly');
my $stored_curve3 = load('curve267-shapeH.poly');
my $coeffs1 = new Vector([19/21,2523793/3783780,1357217/2522520,129071/291060,877193/3027024,659089/2522520,291937/1261260,1537331/15135120,1/189,0,8135/137592,0,0,1/21,1/7]);
my $coeffs2 = new Vector([10/11,10789/16380,13841/24024,21275/48048,110951/360360,134861/480480,489/2002,8507/72072,1/198,0,241/3465,0,0,1/22,3/22]);
my $coeffs3 = new Vector([13/14,47219/68796,59769/101920,97663/211680,113299/366912,29293/101920,19111/76440,23103/203840,1/252,0,7621/114660,0,0,1/28,3/28]);
my $curve1  = new QuarticCurve<Min>(COEFFICIENTS=>$coeffs1);
my $curve2 = new QuarticCurve<Min>(COEFFICIENTS=>$coeffs2);
my $curve3 = new QuarticCurve<Min>(COEFFICIENTS=>$coeffs3);

compare_values('267B1:BITANGENT_SHAPES', $stored_curve1->BITANGENT_SHAPES,$curve1->BITANGENT_SHAPES);
compare_values('267B2:BITANGENT_SHAPES', $stored_curve2->BITANGENT_SHAPES,$curve2->BITANGENT_SHAPES);
compare_values('267H:BITANGENT_SHAPES', $stored_curve3->BITANGENT_SHAPES,$curve3->BITANGENT_SHAPES);

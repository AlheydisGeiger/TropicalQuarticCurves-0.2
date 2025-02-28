# REAL_BITANGENTS, N_REAL_BITANGENTS, REAL_BITANGENT_TYPES

my $coefs = new Vector<Int>([5,1,2,2,0,0,4,0,1,16,7,9,12,16,33]);
my $coefs2 = new Vector<Int>([10,4,6,0,1,4,2,0,0,4,5,1,2,4,9]);
my $D = new RealQuarticCurve<Min>(COEFFICIENTS=>$coefs,SIGNS=>[1,1,1,1,1,1,1,1,1,1,1,1,1,1,1]);
my $C = new RealQuarticCurve<Min>(COEFFICIENTS=>$coefs2,SIGNS=>[1,1,1,1,1,1,1,1,1,1,1,1,1,1,1]);
my $C2 = new RealQuarticCurve<Min>(COEFFICIENTS=>$coefs2,SIGNS=>[1,1,1,1,1,1,1,1,1,1,1,-1,1,1,-1]);
my $C3 = new RealQuarticCurve<Min>(COEFFICIENTS=>$coefs2,SIGNS=>[1,1,1,1,-1,1,1,-1,-1,1,1,-1,1,1,1]);

compare_values("N_BITANGENTS4", 4, $D->N_REAL_BITANGENTS);
compare_values("N_BITANGENTS1", 1, $C->N_REAL_BITANGENTS); 
compare_values("N_BITANGENTS2", 2, $C2->N_REAL_BITANGENTS);
compare_values("N_BITANGENTS7", 7, $C3->N_REAL_BITANGENTS); 

#Test the following by hand!
compare_data("Shapes4", $D->REAL_BITANGENT_SHAPES);
compare_data("Shapes1", $C->REAL_BITANGENT_SHAPES); 
compare_data("Shapes2", $C2->REAL_BITANGENT_SHAPES);
compare_data("Shapes3", $C3->REAL_BITANGENT_SHAPES);

#Test the following by hand!
compare_data("Types4", $D->REAL_BITANGENT_TYPES);
compare_data("Types1", $C->REAL_BITANGENT_TYPES); 
compare_data("Types2", $C2->REAL_BITANGENT_TYPES);
compare_data("Types3", $C3->REAL_BITANGENT_TYPES);

#Test the following by hand!
compare_data("Bitangents4", $D->REAL_BITANGENTS);
compare_data("Bitangents1", $C->REAL_BITANGENTS); 
compare_data("Bitangents2", $C2->REAL_BITANGENTS);
compare_data("Bitangents3", $C3->REAL_BITANGENTS);
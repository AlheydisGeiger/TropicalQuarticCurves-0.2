# Example C #8

my $cells = new Array<Set<Int>>([[0,1,2],[1,2,3],[2,3,4],[2,4,5],[3,4,6],[5,8,9],[6,7,10],[7,8,10],[8,9,10],[9,10,11],[9,11,12],[9,12,13],[9,13,14],[4,6,7],[4,7,8],[4,5,8]]);
my $dualC = new DualSubdivisionOfQuartic(MAXIMAL_CELLS=>$cells);
my $stored_dualC = load('dualgeneric.sop');
my $motifC = $dualC->ALL_DEFORMATION_MOTIFS->[5];

compare_values('C:IS_GENERIC', $stored_dualC->IS_GENERIC,$dualC->IS_GENERIC);
compare_values('C:SIGN_CONDITIONS',$stored_dualC->ALL_DEFORMATION_MOTIFS->[5]->SIGN_CONDITIONS,$motifC->SIGN_CONDITIONS);



# Example C #511

my $cells = new Array<Set<Int>>([[3,4,6],[5,8,9],[7,8,10],[8,9,10],[9,10,11],[9,11,12],[9,12,13],[9,13,14],[4,7,10],[1,3,4],[0,1,4],[0,4,8],[2,5,8],[4,6,10],[0,2,8],[4,7,8]]);
my $dualC = new DualSubdivisionOfQuartic(MAXIMAL_CELLS=>$cells);
my $stored_dualC = load('dualnongen.sop');
my $motifC = $dualC->ALL_DEFORMATION_MOTIFS->[2];

compare_values('C:IS_GENERIC', $stored_dualC->IS_GENERIC,$dualC->IS_GENERIC);
compare_values('C:HYPERPLANES',$stored_dualC->ALL_DEFORMATION_MOTIFS->[2]->HYPERPLANES,$motifC->HYPERPLANES);
compare_values('C:SIGN_CONDITIONS',$stored_dualC->ALL_DEFORMATION_MOTIFS->[2]->SIGN_CONDITIONS,$motifC->SIGN_CONDITIONS);



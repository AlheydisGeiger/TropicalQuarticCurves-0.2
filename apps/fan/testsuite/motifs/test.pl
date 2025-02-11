# SFB Example
my $cells=new IncidenceMatrix([[0,1,2],[1,2,3],[2,3,4],[2,4,8],[2,5,8],[5,8,9],[8,9,13],[9,13,14],[3,4,8],[3,7,8],[7,8,12],[8,12,13],[3,6,11],[3,7,11],[7,11,12],[6,10,11]]);
my $DS = new DualSubdivisionOfQuartic(MAXIMAL_CELLS=>$cells);
my $defmotifsSFB = $DS->ALL_DEFORMATION_MOTIFS;
my $stored_defmotifsSFB = load('SFB.sop');

compare_values('SFB:ALL_DEFORMATION_MOTIFS->[0]->TYPE', $stored_defmotifsSFB->ALL_DEFORMATION_MOTIFS->[0]->TYPE,$defmotifsSFB->[0]->TYPE);
compare_values('SFB:ALL_DEFORMATION_MOTIFS->[1]->TYPE', $stored_defmotifsSFB->ALL_DEFORMATION_MOTIFS->[1]->TYPE,$defmotifsSFB->[1]->TYPE);
compare_values('SFB:ALL_DEFORMATION_MOTIFS->[2]->TYPE', $stored_defmotifsSFB->ALL_DEFORMATION_MOTIFS->[2]->TYPE,$defmotifsSFB->[2]->TYPE);
compare_values('SFB:ALL_DEFORMATION_MOTIFS->[3]->TYPE', $stored_defmotifsSFB->ALL_DEFORMATION_MOTIFS->[3]->TYPE,$defmotifsSFB->[3]->TYPE);
compare_values('SFB:ALL_DEFORMATION_MOTIFS->[4]->TYPE', $stored_defmotifsSFB->ALL_DEFORMATION_MOTIFS->[4]->TYPE,$defmotifsSFB->[4]->TYPE);
compare_values('SFB:ALL_DEFORMATION_MOTIFS->[5]->TYPE', $stored_defmotifsSFB->ALL_DEFORMATION_MOTIFS->[5]->TYPE,$defmotifsSFB->[5]->TYPE);
compare_values('SFB:ALL_DEFORMATION_MOTIFS->[6]->TYPE', $stored_defmotifsSFB->ALL_DEFORMATION_MOTIFS->[6]->TYPE,$defmotifsSFB->[6]->TYPE);


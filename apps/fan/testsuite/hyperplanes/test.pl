# 468

my $cells=new IncidenceMatrix([[0,1,2],[1,2,3],[2,3,4],[5,8,9],[6,7,10],[7,8,10],[9,13,14],[8,11,12],[3,6,7],[8,12,13],[2,5,8],[8,10,11],[8,9,13],[2,4,8],[4,7,8],[3,4,7]]);
my $DS = new DualSubdivisionOfQuartic(MAXIMAL_CELLS=>$cells);
my $defmotifs468 = $DS->ALL_DEFORMATION_MOTIFS;
my $stored_defmotifs468 = load('468.sop');

compare_values('468:ALL_DEFORMATION_MOTIFS->[0]->HYPERPLANES', $stored_defmotifs468->ALL_DEFORMATION_MOTIFS->[0]->HYPERPLANES,$defmotifs468->[0]->HYPERPLANES);
compare_values('468:ALL_DEFORMATION_MOTIFS->[1]->HYPERPLANES', $stored_defmotifs468->ALL_DEFORMATION_MOTIFS->[1]->HYPERPLANES,$defmotifs468->[1]->HYPERPLANES);
compare_values('468:ALL_DEFORMATION_MOTIFS->[2]->HYPERPLANES', $stored_defmotifs468->ALL_DEFORMATION_MOTIFS->[2]->HYPERPLANES,$defmotifs468->[2]->HYPERPLANES);
compare_values('468:ALL_DEFORMATION_MOTIFS->[3]->HYPERPLANES', $stored_defmotifs468->ALL_DEFORMATION_MOTIFS->[3]->HYPERPLANES,$defmotifs468->[3]->HYPERPLANES);
compare_values('468:ALL_DEFORMATION_MOTIFS->[4]->HYPERPLANES', $stored_defmotifs468->ALL_DEFORMATION_MOTIFS->[4]->HYPERPLANES,$defmotifs468->[4]->HYPERPLANES);
compare_values('468:ALL_DEFORMATION_MOTIFS->[5]->HYPERPLANES', $stored_defmotifs468->ALL_DEFORMATION_MOTIFS->[5]->HYPERPLANES,$defmotifs468->[5]->HYPERPLANES);
compare_values('468:ALL_DEFORMATION_MOTIFS->[6]->HYPERPLANES', $stored_defmotifs468->ALL_DEFORMATION_MOTIFS->[6]->HYPERPLANES,$defmotifs468->[6]->HYPERPLANES);


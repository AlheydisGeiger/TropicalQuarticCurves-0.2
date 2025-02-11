# 10

my $cells=new Array<Set<Int>>([[0,1,2],[1,2,3],[2,3,4],[2,4,5],[3,4,6],[5,7,8],[5,8,9],[6,7,10],[7,8,10],[9,11,12],[9,12,13],[9,13,14],[4,5,7],[8,9,11],[4,6,7],[8,10,11]]);
my $DS = new DualSubdivisionOfQuartic(MAXIMAL_CELLS=>$cells);
my $type = $DS->DEFORMATION_MOTIFS_TYPES;
my $stored_types10 = load('10.poly');

compare_values('10:DEFORMATION_MOTIFS_TYPES', $stored_types10->DEFORMATION_MOTIFS_TYPES,$type);


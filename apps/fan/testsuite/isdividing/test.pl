# dividing 

my $cells = new Array<Set<Int>>([[0,1,4],[0,2,4],[1,3,4],[2,4,5],[3,4,6],[4,5,9],[4,6,10],[4,7,10],[4,7,12],[4,8,12],[4,8,14],[4,9,14],[7,10,11],[7,11,12],[8,12,13],[8,13,14]]);
my $trn = new DualSubdivisionOfQuartic(MAXIMAL_CELLS=>$cells);
my $signs = new Vector<Int>([1,1,1,1,1,1,1,-1,1,1,1,1,1,-1,1]);
my $stored_dividing = load('dividing.sop');

my $cells2 = new Array<Set<Int>>([[0,1,2],[1,2,4],[1,3,4],[2,4,5],[3,6,7],[3,4,7],[4,7,8],[4,5,8],[5,8,9]]);
my $trn2 = new SubdivisionOfPoints(POINTS=>[[1,0,0],[1,1,0],[1,0,1],[1,2,0],[1,1,1],[1,0,2],[1,3,0],[1,2,1],[1,1,2],[1,0,3]],MAXIMAL_CELLS=>$cells2);
my $signs2 = new Vector<Int>([1,1,1,1,1,1,1,1,1,1]);
my $stored_dividng2 = load('dividing2.sop');

compare_values('Dividing', $stored_dividing,is_dividing($trn,$signs));



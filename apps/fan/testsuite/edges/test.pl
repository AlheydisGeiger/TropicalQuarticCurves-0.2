# edges

my $cells = new Array<Set<Int>>([[0,1,2],[1,2,3],[2,3,4],[2,4,5],[3,4,6],[5,8,9],[6,7,10],[7,8,10],[8,9,10],[9,10,11],[9,11,12],[9,12,13],[9,13,14],[4,6,7],[4,7,8],[4,5,8]]);
my $trn = new DualSubdivisionOfQuartic(MAXIMAL_CELLS=>$cells);
my $edges = $trn->EDGES;

my $cells2 = new Array<Set<Int>>([[0,1,2,3],[1,4,5,6],[2,5,7,8],[3,6,7,9],[1,2,3,6],[2,3,6,7],[2,5,6,7],[1,2,5,6]]);
my $trn2 = new SubdivisionOfPoints(POINTS=>[[1,0,0,0],[1,1,0,0],[1,0,1,0],[1,0,0,1],[1,2,0,0],[1,1,1,0],[1,1,0,1],[1,0,1,1],[1,0,2,0],[1,0,0,2]],MAXIMAL_CELLS=>$cells2);
my $edges2 = compute_edges($trn2);

compare_data('edges', $edges);
compare_data('edges2', $edges2);


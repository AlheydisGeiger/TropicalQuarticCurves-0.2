# edges

my $cells = new Array<Set<Int>>([[0,1,2],[1,2,3],[2,3,4],[2,4,5],[3,4,6],[5,8,9],[6,7,10],[7,8,10],[8,9,10],[9,10,11],[9,11,12],[9,12,13],[9,13,14],[4,6,7],[4,7,8],[4,5,8]]);
my $trn = new DualSubdivisionOfQuartic(MAXIMAL_CELLS=>$cells);
my $edges = $trn->EDGES;
my $stored_edges = load('edges.sop');

compare_values('EdgesOfSubdivision', $stored_edges,$edges);



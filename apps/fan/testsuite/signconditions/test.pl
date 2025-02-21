# Example #1000

my $cells = new Array<Set<Int>>([[5,8,9],[6,7,10],[7,8,10],[9,12,13],[9,13,14],[8,9,12],[8,11,12],[1,3,4],[3,7,8],[3,6,7],[0,1,4],[0,4,8],[3,4,8],[2,5,8],[8,10,11],[0,2,8]]);
my $dual = new DualSubdivisionOfQuartic(MAXIMAL_CELLS=>$cells);
my $signs = $dual->ALL_SIGN_CONDITIONS;
my $stored = load_data('signcond.sop');
#my $stored_dual = load_data('1000.sop');

compare_values('1000:SIGN_CONDITIONS',$stored,$signs);
#compare_values('1000:SIGN_CONDITIONS',$stored_dual->ALL_SIGN_CONDITIONS,$dual->ALL_SIGN_CONDITIONS);


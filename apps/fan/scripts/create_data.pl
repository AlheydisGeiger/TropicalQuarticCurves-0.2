### Code to create the data for the database. It consists of several functions.
### The first one computes Pluecker number of a DualSubdivisionOfQuartic and a given sign vector.
### The second one computes all Pluecker numbers and a sign vectonumbers of real bitangents together with an exemplary sign vector for a given triangulation.
### The last one saves all the data with their properties to upload on the database. 

use application "fan";
$Verbose::files=0;


### The function checks whether a given sign vector satisfies a given set of lifting conditions.
### The condition is given as the product of those entries of the sign vector $vector, for which the indices are elements of the entry of $signset, is positive.
### This has to hold for both entries of $signset
### If the signset contains a -1 it means that the product (after taking -1 out) has to be negative to satisfy the condition.
### The boolean output states whether the conditions are satisfied.
### INPUT: Vector<Set<Int>> with 2 entries and Vector<Int> coontaining only +/- 1 of length 15
### OUTPUT: boolean
sub validate_signs {
    my $signset = $_[0];
    my $vector = $_[1];
    my $cond1 = new Bool(true);
    my $cond2 = new Bool(true);
    my $product = new Int(1);
    if ($signset->[0]->size != 0) {
	if (contains($signset->[0], -1)) {
	    my $set = $signset->[0] - new Set<Int>(-1);
	    my $subvector = $vector->slice($set);
	    my $size = $subvector->dim();
	    for my $i (0..$size-1) {
		$product = $product*$subvector->[$i];
			}
	    $product = -1*$product;
	    $cond1 = ($product == 1);
	}
	else {
	    my $subvector = $vector->slice($signset->[0]);
	    my $size = $subvector->dim();
	    for my $i (0..$size-1) {
		$product = $product*$subvector->[$i];
	    }
	    $cond1 = ($product == 1);
		}
    }
    if ($cond1 == true) {
        $product = new Int(1);
	if ($signset->[1]->size != 0) {
	    if (contains($signset->[1], -1)) {
		my $set = $signset->[1] - new Set<Int>(-1);
		my $subvector = $vector->slice($set);
		my $size = $subvector->dim();
		for my $i (0..$size-1) {
		    $product = $product*$subvector->[$i];
		}
		$product = -1*$product;
		$cond2 = ($product == 1);
			}
	    else {
		my $subvector = $vector->slice($signset->[1]);
		my $size = $subvector->dim();
		for my $i (0..$size-1) {
		    $product = $product*$subvector->[$i];
				}
		$cond2 = ($product == 1);
	    }
	}
    }
    my $output = $cond1 && $cond2;
    return $output;
}


### Function to compute the Pluecker number for a given DualSubdivisionOfQuartic and a vector of signs.
### INPUT: DualSubdivisionOfCQuartics and Vector<Int> with 15  +/-1 entries)
### OUTPUT: Integer
sub give_pluecker {
    my $trn = new DualSubdivisionOfQuartic($_[0]);
	my $signvector = $_[1];
	my $conditions = $trn->ALL_SIGN_CONDITIONS;
	my $output = 0;
	for my $i (0..6) {
	        my $signconditions = $conditions->row($i);
	        if (validate_signs($signconditions,$signvector)==true) {
		    $output = $output+4;
	        }
	    }
	return $output;
}


### Function to compute all possible numbers of real bitangents together with an exemplary sign vector for a given DualSubdivisionOfQuartic.
### The output is a Set<Int> and  Array<Set<Vector<Int>>> consisting of 4 entries. Each entry consists of one of the 4 Pl\"ucker numbers and if applicable an associated signvector.
### INPUT: DualSubdivisionOfQuartic
### OUTPUT: (Set<Int>, Array<Pair<Int,Vector<Int>>>)
sub give_signvectors {
    my $trn = $_[0];
    my @output = ();
	my $cond = $trn->ALL_SIGN_CONDITIONS;
	my $PlueckerNums = new Set<Int>();
    my $SignsNumbers = new Array<Pair<Int,Vector<Int>>>([new Pair<Int,Vector<Int>>(4,new Vector<Int>([])), new Pair<Int,Vector<Int>>(8,new Vector<Int>([])), new Pair<Int,Vector<Int>>(16,new Vector<Int>([])), new Pair<Int,Vector<Int>>(28,new Vector<Int>([])) ]);
    my $check = new Set<Int>();
    open (my $input, "<", "signs.txt") or die "Can't open : $!";
    while (<$input>) {
        my $signs = new Vector<Int>(eval $_);
	    my $number = give_pluecker($trn,$signs);
	    $PlueckerNums->collect(new Int($number));
	    if (contains($check,$number)==0){
			for my $i (0..3) {
				if ($number == $SignsNumbers->[$i]->first) {
					$SignsNumbers->[$i]->second =$signs;
				}
			}
			$check->collect($number);
	    }
    }
	close $input;
	@output = ($PlueckerNums,$SignsNumbers);
    return @output;
}

###For oval data
#INPUT: new Vector<Int> vector of Integers, +/-1
#OUTPUT: Vector<Int>, each -1 of the input vector becomes a 0, 1 stays 1.
#sub signs_to_bool {
#    my $v = $_[0];
#    my $output = new Vector<Int>([]);
#    for my $i (0..$v->dim-1) {
#        if ($v->[$i] == -1) {
#            $output = $output | 0;
#        }
#        else {
#            $output = $output | 1;
#        }
#    }
#    return $output;
#}
#INPUT: a collection of lattice points, and a specific lattice point from the collection
#OUTPUT: the number at which position the given lattice point is in the collection
#sub translate_point {
#    my $pts = $_[0];
#    my $point = $_[1];
#    my $n = $pts->rows();
#    my $j = 0;
#    my $check = 0;
#    for my $i (0..$n-1) {
#        if ($point == $pts->row($i)){
#            $j = $i;
#            $check = 1;
#        }
#    }
#    if (!$check){
#        error("Point not in point configuration");
#    }
#    else {
#        return $j;
#    }
#}

#INPUT: A triangulation, with a sign distribution and the lattice points
#OUTPUT: Boolena - returns true iff the curve is dividing
#sub is_dividing {
#    my $trn = new DualSubdivisionOfQuartic($_[0]);
#    my $signs = $_[1];
#	my $pts = $trn->POINTS;
#    my $twists = tropical::compute_twists($trn,$signs);
#    my $poly = new Polytope(POINTS=>$pts);
#    my $int = $poly->INTERIOR_LATTICE_POINTS;
#    my $n = $int->rows();
#    my $boo = (0 == 0);
#    for my $i (0..$n-1) {
#        my $p = translate_point($pts,$int->row($i));
#        my $cyc_edges = edges_of_cycle($trn,$pts,$p);
#        my $t = to_set($cyc_edges)*to_set($twists);
#        $boo = $boo && ($t->size()%2 == 0);
#    }
#    return $boo
#}

#INPUT: Triangulation, and the number of a specific interior! point in the point configuration
#OUTPUT: Array<Pair<Int,Int>> all the edges that touch that lattice point
#sub edges_of_cycle {
#    my $trn = $_[0];
#    my $pts = $_[1];
#    my $p = $_[2];
#    my $edges = $trn->EDGES;
#    my @output = ();
#    for my $j (0..$edges->size()-1) {
#        if (contains($edges->[$j],$p)){
#            push @output , $edges->[$j];
#        }
#    }
#    return scalar(@output)==0 ? new Array<Pair<Int,Int>>(0) : new Array<Pair<Int,Int>>(\@output);
#}

#INPUT:Array<Pair<Int,Int>>
#OUTPUT:Set<Pair<Int,Int>>
#sub to_set {
#    my $array = $_[0];
#    my $n = $array->size();
#    my $output = new Set<Pair<Int,Int>>();
#    for my $i (0..$n-1) {
#        $output->collect($array->[$i]);
#    }
#    return $output;
#}




### INPUT: DualSubdivisionOfQuartic
### OUTPUT: (Set<Int>, Array<Set<Vector<Int>>>)
#sub give_ovals {
#    my $trn = new DualSubdivisionOfQuartic($_[0]);
    #my @output = ();
#	my $cond = $trn->ALL_SIGN_CONDITIONS;
#    my $OvalNumbers = new Array<Pair<Pair<Pair<Int,String>,Int>,Vector<Int>>>([new Pair<Pair<Pair<Int,String>,Int>,Vector<Int>>(new Pair<Pair<Int,String>,Int>(new Pair<Int,String>(0,"not nested") , 0), new Vector<Int>([])), new Pair<Pair<Pair<Int,String>,Int>,Vector<Int>>(new Pair<Pair<Int,String>,Int>(new Pair<Int,String>(1,"not nested") , 0), new Vector<Int>([])), new Pair<Pair<Pair<Int,String>,Int>,Vector<Int>>(new Pair<Pair<Int,String>,Int>(new Pair<Int,String>(2,"not nested") , 0), new Vector<Int>([])), new Pair<Pair<Pair<Int,String>,Int>,Vector<Int>>(new Pair<Pair<Int,String>,Int>(new Pair<Int,String>(3,"not nested") , 0), new Vector<Int>([])), new Pair<Pair<Pair<Int,String>,Int>,Vector<Int>>(new Pair<Pair<Int,String>,Int>(new Pair<Int,String>(4,"not nested") , 0), new Vector<Int>([])), new Pair<Pair<Pair<Int,String>,Int>,Vector<Int>>(new Pair<Pair<Int,String>,Int>(new Pair<Int,String>(2,"nested") , 0), new Vector<Int>([]))]);
#	my $check = new Set<Int>();
#	my $count = new Vector<Int>([0,0,0,0,0,0]);
#    open (my $input, "<", "signs.txt") or die "Can't open : $!";
#	my $k = 0;
#    while (<$input>) {
#        my $signs = new Vector<Int>(eval $_);
#		my $nested = is_dividing($trn, $signs);
#        my $w = $trn->MIN_WEIGHTS;
#        my $curve = new tropical::QuarticCurve<Max>(COEFFICIENTS=>-$w);
#        my $signs2 = signs_to_bool($signs);
#        my $P = $curve->PATCHWORK(SIGNS=>$signs2); #signs for patchworking need to be 0/1
#        my $betti = $P->BETTI_NUMBERS_Z2->[0];
#		if (contains($check,$betti)==0){
#			for my $i (0..4) {
#				if ($betti == $OvalNumbers->[$i]->first->first->first && $betti !=2) {
#					$OvalNumbers->[$i]->second =$signs;
#				}
#				else {
#					if ($nested) {
#						$OvalNumbers->[5]->second = $signs;
#					}
#					else { $OvalNumbers->[2]->second = $signs;}
#				}
#			}
#			$check->collect($betti);
#	    }
#		for my $i (0..4) {
#			if (!$nested ) {
#				++$count->[$betti];
#			}
#			else {
#				if ($betti == 2 && $nested) {
#					++$count->[5];
#				}
#			}
#		}
#		print $k."\n";
#		++$k;
#   }
#	close $input;
#	for my $i (0..5) {
#		$OvalNumbers->[$i]->first->second = $count ->[$i];
#	}
#    return $OvalNumbers;
#}

script("give_ovals.pl");
### 
### local path to the folder containing the triangulations. 
#open (my $input, "<",  "/home/marta/Documents/Projects/Bitangents/TropicalModuliData/Computations/g3/preprocessing/g3TriangulationsData/g3FineRegularAffine.txt") or die "Can't open : $!";
open (my $input, "<",  "g3FineRegularAffine_".$numnum.".txt") or die "Can't open : $!";

script("tarballs");
my $i=0;
my @Array = ();
while (<$input>) {
    my $trn = new Array<Set<Int>>(eval $_);
    my $S = new DualSubdivisionOfQuartic(MAXIMAL_CELLS=>$trn);
    my $gkz = $S->GKZ_VECTOR;
    my $minrep = $S->MINIMAL_REPRESENTATIVE;
    my $bool = $S->IS_GENERIC;
    my $defmotifs = $S->ALL_DEFORMATION_MOTIFS;
    for my $j (0..6) {
		$defmotifs->[$j]->SIGN_CONDITIONS;
		$defmotifs->[$j]->HYPERPLANES;
    }
    my @A = give_signvectors($S);
	my $B = give_ovals($S);
	print $i,"\n";
    $Array[$i] = new DualSubdivisionOfQuartic(MAXIMAL_CELLS=>$trn, GKZ_VECTOR=>$gkz, MINIMAL_REPRESENTATIVE=>$minrep, IS_GENERIC=>$bool, ALL_DEFORMATION_MOTIFS=>$defmotifs, PLUECKER_NUMBERS=>$A[0], SIGN_REPRESENTATIVES=>$A[1], OVAL_NUMBERS=>$B);
	save_data($Array[$i],$i.".sop");
    $i +=1;
}
pack_tarball("tropical_quartic_curves_".$numnum.".tgz",@Array);
close $input;

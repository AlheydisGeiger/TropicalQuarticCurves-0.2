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

##Take care this is very slow! The output is not in the format as the extension uses it. It needs to be rewritten.
### INPUT: DualSubdivisionOfQuartic
### OUTPUT: (Set<Int>, Array<Set<Vector<Int>>>)
sub give_ovals {
    my $trn = new fan::DualSubdivisionOfQuartic($_[0]);
    #my @output = ();
	my $cond = $trn->ALL_SIGN_CONDITIONS;
    my $OvalNumbers = new Array<Pair<Pair<Pair<Int,String>,Int>,Vector<Int>>>([new Pair<Pair<Pair<Int,String>,Int>,Vector<Int>>(new Pair<Pair<Int,String>,Int>(new Pair<Int,String>(0,"") , 0), new Vector<Int>([])), new Pair<Pair<Pair<Int,String>,Int>,Vector<Int>>(new Pair<Pair<Int,String>,Int>(new Pair<Int,String>(1,"not nested") , 0), new Vector<Int>([])), new Pair<Pair<Pair<Int,String>,Int>,Vector<Int>>(new Pair<Pair<Int,String>,Int>(new Pair<Int,String>(2,"not nested") , 0), new Vector<Int>([])), new Pair<Pair<Pair<Int,String>,Int>,Vector<Int>>(new Pair<Pair<Int,String>,Int>(new Pair<Int,String>(3,"not nested") , 0), new Vector<Int>([])), new Pair<Pair<Pair<Int,String>,Int>,Vector<Int>>(new Pair<Pair<Int,String>,Int>(new Pair<Int,String>(4,"not nested") , 0), new Vector<Int>([])), new Pair<Pair<Pair<Int,String>,Int>,Vector<Int>>(new Pair<Pair<Int,String>,Int>(new Pair<Int,String>(2,"nested") , 0), new Vector<Int>([])),new Pair<Pair<Pair<Int,String>,Int>,Vector<Int>>(new Pair<Pair<Int,String>,Int>(new Pair<Int,String>(0,"curve is dividing") , 0), new Vector<Int>([]))]);
	my $check = new Set<Int>();
	my $count = new Vector<Int>([0,0,0,0,0,0,0]);
    my $set = new Vector<Int>([3,4]);
    my $sset = new Vector<Int>([16,28]);
    open (my $input, "<", "signs.txt") or die "Can't open : $!";
	my $k = 0;
    while (<$input>) {
        my $signs = new Vector<Int>(eval $_);
		my $number = give_pluecker($trn,$signs);
        if (!contains(new Set<Int>(4,8),$number)) {
            for my $i  (0..1) {
                if ($number == $sset->[$i]) {
			        $count->[$set->[$i]]= $count->[$set->[$i]]+1;
                    if (contains($check,$set->[$i])==0) {
                        $OvalNumbers->[$set->[$i]]->second =$signs;
                        $check->collect($set->[$i]);
                    }
		        }
            }   
        }
        else {
            my $nested = is_dividing($trn, $signs);
            if (!($nested)) {
                if ($number == 8) {
                    $count->[2]= $count->[2]+1;
                    if (contains($check,2 )==0) {
                        $OvalNumbers->[2]->second =$signs;
                         $check->collect(2);
                    }
                }
                else {
                    if ($number == 4) { 
                        my $w = $trn->MIN_WEIGHTS;
                        my $curve = new tropical::QuarticCurve<Max>(COEFFICIENTS=>-$w);
                        my $signs2 = fan::signs_to_bool($signs);
                        my $P = $curve->PATCHWORK(SIGNS=>$signs2); #signs for patchworking need to be 0/1
                        my $betti = $P->BETTI_NUMBERS_Z2->[0];
                        $count->[$betti]= $count->[$betti]+1;
                        if (contains($check,$betti )==0) {
                            $OvalNumbers->[$betti]->second =$signs;
                            $check->collect($betti);
                        }
                        if (!contains(new Set<Int>(0,1),$betti)) {die "something is wrong";}
                    }
                    else { die "something is wrong 2";}
                }
            }
            else {
                if ($number == 4) { 
                    #compute if 0 or 2 ovals...
                    my $w = $trn->MIN_WEIGHTS;
                    my $curve = new tropical::QuarticCurve<Max>(COEFFICIENTS=>-$w);
                    my $signs2 = fan::signs_to_bool($signs);
                    my $P = $curve->PATCHWORK(SIGNS=>$signs2); #signs for patchworking need to be 0/1
                    my $betti = $P->BETTI_NUMBERS_Z2->[0];
                    if ($betti == 2) {
                        $count->[5]= $count->[5]+1;
                        if (contains($check,5 )==0) {
                            $OvalNumbers->[5]->second =$signs;
                            $check->collect(5);
                        }
                    }
                    else {
                        if ($betti == 0) {
                            $count->[6]= $count->[6]+1;
                            if (contains($check,6 )==0) {
                                $OvalNumbers->[6]->second =$signs;
                                $check->collect(6);
                            }
                        }
                    }
                    
                }
            }
	    }
		print $k."\n";
		++$k;
    }
	close $input;
	for my $i (0..6) {
		$OvalNumbers->[$i]->first->second = $count ->[$i];
	}
    return $OvalNumbers;
}
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

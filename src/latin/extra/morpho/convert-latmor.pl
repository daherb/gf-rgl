use strict ;
use warnings ;
use Data::Dumper ;
open(my $fh,"<",$ARGV[0]) ;
my %DATA ;
my $wf ;
while (my $line = <>)
{
    next if ($line =~ /reading transducer/ || $line =~ /finished/ ) ;
    if ($line =~ /analyze> (.*)/ ) 
    {
	$wf = $1 ;
	$DATA{$wf} = () ;
    }
    elsif ($line =~ /(.+?)(<(.+)>)+/)
    {
	my $lemma = $1 ;
	my @feats = split /></, $3;
	push @{$DATA{$wf}}, { LEMMA => $lemma, FEATS => \@feats } ;
    }
}
my @als = () ;
foreach $wf (sort {$a cmp $b} (keys %DATA)) {
    my $pal = "Analysis \"$wf\"";
    my @pls = () ;
    foreach my $l (@{$DATA{$wf}}) {
	my $pl = "Lemma \"".$$l{LEMMA}."\"" ;
	my @hfs = () ;
	foreach my $f (@{$$l{FEATS}}) {
	    push @hfs, "Person P1" if ($f eq "1") ;
	    push @hfs, "Person P2" if ($f eq "2") ;
	    push @hfs, "Person P3" if ($f eq "3") ;
	    push @hfs, "Gender Fem" if ($f eq "fem") ;
	    push @hfs, "Gender Fem" if ($f eq "masc") ;
	    push @hfs, "Gender Neut" if ($f eq "neut") ;
	    push @hfs, "Case Nom" if ($f eq "nom") ;
	    push @hfs, "Case Gen" if ($f eq "gen") ;
	    push @hfs, "Case Dat" if ($f eq "dat") ;
	    push @hfs, "Case Acc" if ($f eq "acc") ;
	    push @hfs, "Case Abl" if ($f eq "abl") ;
	    push @hfs, "Case Voc" if ($f eq "voc") ;
	    push @hfs, "Number Sg" if ($f eq "sg") ;
	    push @hfs, "Number Pl" if ($f eq "pl") ;
	    push @hfs, "Voice Active" if ($f eq "active") ;
	    push @hfs, "Voice Passive" if ($f eq "passive") ;
	    push @hfs, "Voice Deponens" if ($f eq "deponens") ;
	    push @hfs, "POS ADJ" if ($f eq "ADJ") ;
	    push @hfs, "POS ADV" if ($f eq "ADV") ;
	    push @hfs, "POS CONJ" if ($f eq "CONJ") ;
	    push @hfs, "POS INTJ" if ($f eq "INTJ") ;
	    push @hfs, "POS N" if ($f eq "N") ;
	    push @hfs, "POS NUM" if ($f eq "NUM") ;
	    push @hfs, "POS PN" if ($f eq "PN") ;
	    push @hfs, "POS PREP" if ($f eq "PREP") ;
	    push @hfs, "POS PRO" if ($f eq "PRO") ;
	    push @hfs, "POS V" if ($f eq "V") ;
	    push @hfs, "POS PART" if ($f eq "PART") ;
	    push @hfs, "Tense Pres" if ($f eq "pres") ;
	    push @hfs, "Tense FutureI" if ($f eq "futureI") ;
	    push @hfs, "Tense FutureII" if ($f eq "futureII") ;
	    push @hfs, "Tense Future" if ($f eq "future") ;
	    push @hfs, "Tense Imperf" if ($f eq "imperf") ;
	    push @hfs, "Tense Perf" if ($f eq "perf") ;
	    push @hfs, "Tense Pqperf" if ($f eq "pqperf") ;
	    push @hfs, "Degree Positive" if ($f eq "positive") ;
	    push @hfs, "Degree Comparative" if ($f eq "comparative") ;
	    push @hfs, "Degree Superlative" if ($f eq "superlative") ;
	    push @hfs, "Mood Ind" if ($f eq "ind") ;
	    push @hfs, "Mood Subj" if ($f eq "subj") ;
	    push @hfs, "NumberType Card" if ($f eq "card") ;
	    push @hfs, "NumberType Card" if ($f eq "ord") ;
	    push @hfs, "NumberType Card" if ($f eq "dist") ;
	    push @hfs, "NumberType Card" if ($f eq "dig") ;
	    push @hfs, "PronounType Dem" if ($f eq "dem") ;
	    push @hfs, "PronounType Indef" if ($f eq "indef") ;
	    push @hfs, "PronounType Pers" if ($f eq "pers") ;
	    push @hfs, "PronounType Poss" if ($f eq "poss") ;
	    push @hfs, "PronounType Quest" if ($f eq "quest") ;
	    push @hfs, "PronounType Refl" if ($f eq "refl") ;
	    push @hfs, "PronounType Rel" if ($f eq "rel") ;
	    push @hfs, "PronounType Adj" if ($f eq "adj") ;
	    push @hfs, "VerbType SupinI" if ($f eq "supinI") ;
	    push @hfs, "VerbType SupinII" if ($f eq "supinII") ;
	    push @hfs, "VerbType Gerund" if ($f eq "gerund") ;
	    push @hfs, "VerbType Gerundivum" if ($f eq "gerundivum") ;
	    push @hfs, "VerbType Inf" if ($f eq "inf") ;
	    push @hfs, "VerbType Imp" if ($f eq "imp") ;
	    push @hfs, "VerbType Part" if ($f eq "part") ;
	    push @hfs, "Wordform Cap" if ($f eq "Cap") ;
	    push @hfs, "Wordform UC" if ($f eq "UC") ;
	    push @hfs, "Wordform I2j" if ($f eq "i2j") ;
	    push @hfs, "Wordform Alt" if ($f eq "alt") ;
	}
	my $pfs = join ",", @hfs ;
	push @pls, "$pl [$pfs]" ;
    }
    my $j = join ",", @pls ;
    my $pa = "$pal [$j]" ;
    push @als, $pa ;
}
print join "\n", @als ;
#print "import Morpho" ;
#print "let analyses = [" ;
#print join ",", @als ;
#print "]\n" ;
#print "main = putStrLn \"Finished\"";  

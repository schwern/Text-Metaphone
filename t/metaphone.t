# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl test.pl'

######################### We start with some black magic to print on failure.

# Change 1..1 below to 1..last_test_to_print .
# (It may become useful if the test is moved to ./t subdirectory.)

use strict;
my $loaded;
BEGIN { $| = 1; print "1..19\n"; }
END {print "not ok 1\n" unless $loaded;}
use Text::Metaphone;
$loaded = 1;
print "ok 1\n";

######################### End of black magic.

# Insert your test code below (better if it prints "ok 13"
# (correspondingly "not ok 13") depending on the success of chunk 13
# of the test code):
my $t_idx = 2;

my %test_phones = (
		   'recrudescence' => 'RKRTSNS',
		   'moist' => 'MST',
		   'Gutenberg' => 'KTNBRK',
		   'recridessence' => 'RKRTSNS',
		   'crapulance' => 'KRPLNS',
		   'cough' => 'KF',
		   'coffee' => 'KF',
		   'tchrist' => 'TKRST',
		   'Schwern' => 'XWRN',
		   'Schwartz' => 'XWRTS',
		   'Avulsion' => 'AFLXN',
		   'Aeon' => 'EN',
		   'Mushrooms' => 'MXRMS',
		   'Way'       => 'W',
		   'What'      => 'HT',
		   'Wierd'     => 'WRT',
		   ''          => '',
		   'picklehead'=> 'PKLHT',
		   );

foreach my $word (keys %test_phones) {
    my $phoned = Metaphone($word);
    print "not ($phoned) " unless $phoned eq $test_phones{$word};
    print "ok ".$t_idx++." $word -> ", $test_phones{$word}, "\n";
}



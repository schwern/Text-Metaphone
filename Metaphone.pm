package Text::Metaphone;

use strict;
use vars qw($VERSION @ISA @EXPORT @EXPORT_OK);

require Exporter;
require DynaLoader;

use integer;

@ISA = qw(Exporter DynaLoader);

@EXPORT = qw(
	     Metaphone
);

$VERSION = 1.96;

bootstrap Text::Metaphone $VERSION;

# I should probably do this in XS, too...
sub Metaphone {
    my($word, $len) = @_;
    my($phoned);
    $len = 0 unless defined $len;
    metaphone($word, $len, $phoned);
    return $phoned;
}

1;

__END__
=pod

=head1 NAME

Text::Metaphone - A modern soundex.  Phonetic encoding of words.


=head1 SYNOPSIS

  use Text::Metaphone;
  $phoned_words = Metaphone('Schwern');
  

=head1 DESCRIPTION

C<Metaphone()> is a function whereby a string/word is broken down into
a rough approximation of its english phonetic pronunciation.  Very
similar in concept and purpose to soundex, but much more
comprehensive in its approach.


=head1 FUNCTIONS

=over 4

=item B<Metaphone>

    $phoned_word = Metaphone($word, $max_phone_len);

Takes a word and encodes it according to the Metaphone algorithm.
The algorithm only deals with alphabetical characters, all else is ignored.

If $max_phone_len is provided, Metaphone will only encode up to that many
characters for each word.

'sh' is encoded as 'X', 'th' is encoded as '0'.  This can be changed
in the metaphone.h header file.

=back


=head1 CAVEATS

=over 4

=item Metaphone algorithm changes

I have made a few minor changes to the traditional metaphone algorithm found
in the books.  The most significant one is that it will differenciate between
SCH and SCHW making the former K (As in School) and the latter sh (as in
Schwartz and Schwern).

My changes can be turned off by defining the USE_TRADITIONAL_METAPHONE
flag in metaphone.h.

Due to these changes, any users of Metaphone v1.00 or earlier which have stored
metaphonetic encodings, they should recalculate those with the new verison.


=head1 AUTHOR

Michael G Schwern <schwern@pobox.com>

=head1 SEE ALSO

=head2 Man pages

L<Text::Soundex>

=head2 Books, Journals and Magazines

=over 3

=item Binstock, Andrew & Rex, John. "Metaphone:  A Modern Soundex." I<Practical Algorithms For Programmers.>  Reading, Mass:  Addion-Wesley, 1995  pp160-169 

Contains an explaination of the basic metaphone concept & algorithm and C code
from which I learned of Metaphone and ported this module.

=item Parker, Gary. "A Better Phonetic Search." I<C Gazette>, Vol. 5, No. 4 (June/July), 1990.

This is the public-domain C version of metaphone from which Binstock & Rex 
based their own..  I haven't actually read it.

=item  Philips, Lawrence. I<Computer Language>, Vol. 7, No. 12 (December), 1990.  

And here's the original Metaphone algorithm as presented in Pick BASIC.

=back

=head1 COPYRIGHT, et al.

Copyright (c) 1997-1999 Michael G Schwern.  All Rights Reserved.
This program is free software; you can redistribute it and/or
modify it under the same terms as Perl itself.

=cut


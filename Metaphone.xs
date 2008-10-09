#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"

#include <stdio.h>
#include "metaphone.h"

MODULE = Text::Metaphone		PACKAGE = Text::Metaphone

PROTOTYPES: ENABLE

flag
metaphone(word, max_phoneme, phoned_word)
	char* word
	int max_phoneme
	char * &phoned_word = NO_INIT
	PROTOTYPE: $$$
	CODE:
	RETVAL = metaphone(word, max_phoneme, &phoned_word);
/*	printf("phoned_word:  %s\n", phoned_word); */
	XST_mPV(3, phoned_word);
/*	safefree(phoned_word);*/
	OUTPUT:
	phoned_word
#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"

#include "metaphone.h"

MODULE = Text::Metaphone        PACKAGE = Text::Metaphone

PROTOTYPES: ENABLE

SV *
_real_metaphone(word, max_length)
        char* word
        int max_length
        PROTOTYPE: $;$
        INIT:
            char* phoned_word;
        CODE:
            metaphone(word, max_length, &phoned_word);
            RETVAL = newSVpv(phoned_word, 0);
            free(phoned_word);
        OUTPUT:
            RETVAL

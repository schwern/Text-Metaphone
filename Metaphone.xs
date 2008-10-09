#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"

#include "metaphone.h"

MODULE = Text::Metaphone        PACKAGE = Text::Metaphone

PROTOTYPES: ENABLE

SV *
Metaphone(word, ...)
        char* word
        int max_length
        PROTOTYPE: $;$
        PREINIT:
            int max_length = 0;
        INIT:
            char* phoned_word;
        CODE:
            if( items > 1 ) {
                max_length = SvIV(ST(1));
            }
            metaphone(word, max_length, &phoned_word);
            RETVAL = newSVpv(phoned_word, 0);
            free(phoned_word);
        OUTPUT:
            RETVAL

#ifdef __cplusplus
extern "C" {
#endif
#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"
#ifdef __cplusplus
}
#endif

#include <stdio.h>
#include "metaphone.h"

static int
not_here(s)
char *s;
{
    croak("%s not implemented on this architecture", s);
    return -1;
}

static double
constant(name, arg)
char *name;
int arg;
{
    errno = 0;
    switch (*name) {
    case 'A':
	break;
    case 'B':
	break;
    case 'C':
	break;
    case 'D':
	break;
    case 'E':
	break;
    case 'F':
	break;
    case 'G':
	break;
    case 'H':
	break;
    case 'I':
	break;
    case 'J':
	break;
    case 'K':
	break;
    case 'L':
	break;
    case 'M':
	break;
    case 'N':
	break;
    case 'O':
	break;
    case 'P':
	break;
    case 'Q':
	break;
    case 'R':
	break;
    case 'S':
	if (strEQ(name, "SH"))
#ifdef SH
	    return SH;
#else
	    goto not_there;
#endif
	break;
    case 'T':
	if (strEQ(name, "TH"))
#ifdef TH
	    return TH;
#else
	    goto not_there;
#endif
	break;
    case 'U':
	break;
    case 'V':
	break;
    case 'W':
	break;
    case 'X':
	break;
    case 'Y':
	break;
    case 'Z':
	break;
    }
    errno = EINVAL;
    return 0;

not_there:
    errno = ENOENT;
    return 0;
}


MODULE = Text::Metaphone		PACKAGE = Text::Metaphone

PROTOTYPES: ENABLE

double
constant(name,arg)
	char *		name
	int		arg



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
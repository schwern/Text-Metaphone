#ifndef __METAPHONE_H__
#define __METAPHONE_H__
/**************************************************************************
	metaphone -- Breaks english phrases down into their phonemes.
	
	Input
		word			-- 	An english word to be phonized
		max_phonemes 	-- 	How many phonemes to calculate.  If 0, then it
							will phonize the entire phrase.
		phoned_word  	-- 	The final phonized word.  (We'll allocate the
							memory.)
	Output
		error	--	A simple error flag, returns TRUE or FALSE
		
	NOTES:  ALL non-alpha characters are ignored, this includes whitespace,
	although non-alpha characters will break up phonemes.
****************************************************************************/


#include "mytypes.h"
#include "myconsts.h"


/*  I add modifications to the traditional metaphone algorithm that you
	might find in books.  Define this if you want metaphone to behave
	traditionally */
#undef USE_TRADITIONAL_METAPHONE

/* Special encodings */
#define  SH 	'X'
#define  TH		'0'


flag metaphone (
	/* IN */
	char * 	word,
	int 	max_phonemes,
	/* OUT */
	char **	phoned_word
);


#endif

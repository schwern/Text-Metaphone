#ifndef __MY_CONSTS_H__
#define __MY_CONSTS_H__

/**************************************************************************
	my constants -- constants I like
	
	Probably redundant.
	
***************************************************************************/

/* What is truth?  Is this necessary? */
#ifndef TRUE
#define TRUE 	 	(1 == 1)
#define FALSE 	 	(!TRUE)
#endif /* TRUE */

#ifndef ERROR
#define ERROR   	FALSE
#endif
#ifndef SUCCESS
#define SUCCESS		TRUE
#endif
#ifndef FAILURE
#define FAILURE		FALSE
#endif

#ifndef NULL                         
#define NULL            0                                               
#endif

/* 	Garbage character for use with memory debugging.  
	Need to make it OS dependant. */
#define GARBAGE   0xA3

#endif

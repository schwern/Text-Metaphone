#ifndef __MY_MEMORY_H__
#define __MY_MEMORY_H__

/************************************************************************
	memory wrappers -- routines to make memory manipulation safer
	
	mostly from _Writing Solid Code_ by Steve Macguire (c) 1993
	
	wrapper routines
		NewMemory	--	for malloc()
		FreeMemory	--	for free()
		GrowMemory	--	for realloc() to enlarge memory
		ShrinkMemory --	for realloc() to shrink memory
		ResizeMemory --	for realloc() to change memory size
		FillMemory	--	for memset()
*************************************************************************/

/* Flag, TRUE, FALSE, etc.... */
#include "mytypes.h"
#include "myconsts.h"
#include <assert.h>
#include <sys/types.h>
#include <stdlib.h>
#ifdef DEBUG
#include <string.h>
#endif

/*	-------------------------
	NewMemory -- Allocate new memory
		Input
			ppv  -- pointer to a pointer to where you want allocated
			size -- how much memory do you want?
		Output
			error flag
	
	NOTE:  Null pointers and/or size will cause a run-time error.
	
	If debugging, it will fill the allocated memory with garbage to ease
	tracking of memory allocation errors.
	-------------------------- */
flag NewMemory(void **ppv, size_t size);

/*	---------------------------------
	FreeMemory -- Deallocate memory
		Input
			pv -- pointer to a block of memory to be freed
			
	NOTE:  Null pointers will cause a run-time error.
	
	If debugging, will fill the deallocated memory with garbage.
	--------------------------------- */
void FreeMemory (void *pv);


/*	---------------------------------------
	ResizeMemory -- Resize a block of memory
		Input
			ppv	--	pointer to a pointer to a block of memory to be resized
			size_new -- requested size of your new block
		Output
			error flag
	---------------------------------------- */
flag ResizeMemory(void **ppv, size_t sizeNew);

/*	---------------------------------
	FillMemory -- Fill memory in a block with a given byte
		Input
			pv	--	Pointer to the memory block to be filled
			fill --	byte to fill the memory with
			size -- how much memory to fill
	
	NOTE:  Will assert if pv doesn't point to at least size memory
	---------------------------------- */
/* REMEMBER:  Add macro to replace FillMemory with memset */
void FillMemory(void *pv, byte fill, size_t size);


#endif


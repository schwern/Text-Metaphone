#include "my_memory.h"

flag NewMemory(void **ppv, size_t size) {
	byte **ppb = (byte **)ppv;
	
	assert(ppv != NULL  &&  size != 0);
	
	*ppb = (byte *)malloc(size);
	
#ifdef DEBUG 
	{
		if( *ppb != NULL )
			memset(*ppb, GARBAGE, size);
	}
#endif /* DEBUG */
	
	return (*ppb != NULL);
}



void FreeMemory (void *pv) {
	assert(pv != NULL);
	
#ifdef DEBUG
/*	{
 *		memset(pv, GARBAGE, sizeofBlock(pv));
 *	}
 */
#endif
	
	free(pv);
}




flag ResizeMemory(void **ppv, size_t sizeNew) {
	byte **ppb = (byte **)ppv;
	byte *pbNew;
#ifdef DEBUG
		size_t sizeOld;
#endif
	
	assert(ppb != NULL  && sizeNew != 0);
#if 0  /* COMMENT */	
#ifdef DEBUG
	{
		sizeOld = sizeofBlock(*ppb);
		
		/* 	If the block is shrinking, pre-fill the soon-to-be
		 *	released memory.  If expanding, force it to move by
		 *	faking a realloc.  This is to allow us to scramble
		 *	the contents
		 */
		
		/* erase the tail if we're shrinking */
		if (sizeNew < sizeOld)
			memset((*ppb)+sizeNew, GARBAGE, sizeOld-sizeNew);
		else if (sizeNew > sizeOld) {
			byte *pbForceNew;
			
			if(NewMemory(&pbForceNew, sizeNew)) {
				memcpy(pbForceNew, *ppb, sizeOld);
				FreeMemory(*ppb);
				*ppb = pbForceNew;
			}
		}
	}
#endif /* DEBUG */
#endif /* COMMENT */
	pbNew = (byte *)realloc(*ppb, sizeNew);
	if (pbNew != NULL) {
#ifdef DEBUG
		{
			/* Initialize the new tail if expanding */
			if (sizeNew > sizeOld)
				memset(pbNew+sizeOld, GARBAGE, sizeNew-sizeOld);
		}
#endif /* DEBUG */
		
		*ppb = pbNew;
	}
	
	return (pbNew != NULL);
}









/* void FillMemory(void *pv, byte fill, size_t size) { */
/* 	assert(ValidPointer(pv, size)); */
/* 	 */
/* 	memset(pv, fill, size); */
/* } */



#ifndef MAND_TRANSLATION_INCLUDED
#define MAND_TRANSLATION_INCLUDED


#include "NAString.h"

//typedef struct MandTranslation MandTranslation;
//
//MandTranslation* mandAllocTranslation(const NAUTF8Char* tablename, const NAUTF8Char** keys, NAInt keycount);
//void mandDeallocTranslation(MandTranslation* translation);

NAString* mandGetBundleString(NAUTF8Char* collection, const NAUTF8Char* key);


#endif // MAND_TRANSLATION_INCLUDED

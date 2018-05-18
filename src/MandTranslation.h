

#ifndef MAND_TRANSLATION_INCLUDED
#define MAND_TRANSLATION_INCLUDED


#include "NAString.h"


NAString* mandNewBundleString(NAUTF8Char* collection, const NAUTF8Char* key);
NAString* mandNewBundleStringWithArguments(NAUTF8Char* collection, const NAUTF8Char* key, va_list argumentlist);


#endif // MAND_TRANSLATION_INCLUDED

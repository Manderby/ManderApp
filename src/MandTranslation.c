
#include "MandTranslation.h"
#include "Carbon/Carbon.h"

//struct MandTranslation{
//  const NAUTF8Char* tablename;
//  const NAUTF8Char** keys;
//  NAString** strings;
//  NAInt keycount;
//};
//
//
//
//MandTranslation* mandAllocTranslation(const NAUTF8Char* tablename, const NAUTF8Char** keys, NAInt keycount){
//  MandTranslation* translation = naAlloc(MandTranslation);
//  translation->tablename = tablename;
//  translation->keys = keys;
//  NAInt stringarraysize = keycount * naSizeof(NAString*);
//  translation->strings = naMalloc(stringarraysize);
//  naNulln(translation->strings, stringarraysize);
//  #ifndef NDEBUG
//    translation->keycount = keycount;
//  #endif
//  return translation;
//}
//
//
//
//void mandDeallocTranslation(MandTranslation* translation){
//  for(NAInt i=0; i<translation->keycount; i++){
//    naDelete(translation->strings[i]);
//  }
//}



NAString* mandNewBundleString(NAUTF8Char* collection, const NAUTF8Char* key){
  CFBundleRef bundle = CFBundleGetMainBundle();
  CFStringRef keystr = CFStringCreateWithCString(NA_NULL, key, kCFStringEncodingUTF8);
  CFStringRef retstr;
  if(collection){
    CFStringRef tablestr = CFStringCreateWithCString(NA_NULL, collection, kCFStringEncodingUTF8);
    retstr = CFBundleCopyLocalizedString(bundle, keystr, NA_NULL, tablestr);
    CFRelease(tablestr);
  }else{
    retstr = CFBundleCopyLocalizedString(bundle, keystr, NA_NULL, NA_NULL);
  }
  CFRelease(keystr);
  CFIndex requredLen;
  CFRange range = CFRangeMake(0, CFStringGetLength(retstr));
  CFStringGetBytes(retstr, range, kCFStringEncodingUTF8, 0, NA_FALSE, NA_NULL, 0, &requredLen);
  NAUTF8Char* buffer = naMalloc(requredLen);
  CFStringGetBytes(retstr, range, kCFStringEncodingUTF8, 0, NA_FALSE, (UInt8*)buffer, requredLen, NA_NULL);
  CFRelease(retstr);
  return naNewStringWithMutableUTF8Buffer(buffer, requredLen, (NAMutator)naFree);
}

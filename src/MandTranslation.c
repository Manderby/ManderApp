
#include "MandTranslation.h"
#include "Carbon/Carbon.h"



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
  CFIndex requiredLen;
  CFRange range = CFRangeMake(0, CFStringGetLength(retstr));
  CFStringGetBytes(retstr, range, kCFStringEncodingUTF8, 0, NA_FALSE, NA_NULL, 0, &requiredLen);
  NAUTF8Char* buffer = naMalloc(requiredLen);
  CFStringGetBytes(retstr, range, kCFStringEncodingUTF8, 0, NA_FALSE, (UInt8*)buffer, requiredLen, NA_NULL);
  CFRelease(retstr);
  
  return naNewStringWithMutableUTF8Buffer(buffer, requiredLen, (NAMutator)naFree);
}



NAString* mandNewBundleStringWithArguments(NAUTF8Char* collection, const NAUTF8Char* key, va_list argumentlist){
  va_list argumentlist2;
  va_copy(argumentlist2, argumentlist);
    NAString* keystring = mandNewBundleString(collection, key);
    NAString* finalstring = naNewStringWithArguments(naGetStringUTF8Pointer(keystring), argumentlist2);  
    naDelete(keystring);
  va_end(argumentlist2);
  
  return finalstring;
}

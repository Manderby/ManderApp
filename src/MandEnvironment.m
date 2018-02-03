

#import <Cocoa/Cocoa.h>
#include "MandEnvironment.h"



void mandInitModifierKeyState(ModifierKeyState* mks){
  mks->alt = NA_FALSE;
  mks->command = NA_FALSE;
  mks->control = NA_FALSE;
  mks->fn = NA_FALSE;
  mks->shift = NA_FALSE;
}



void mandInitUserDefaultBool(NABool value, const char* key){
  NSUserDefaults* userdefaults = [NSUserDefaults standardUserDefaults];
  NSString* nskey = [NSString stringWithUTF8String:key];
  if([userdefaults integerForKey:nskey] == 0){
    [userdefaults setInteger:(value?1:-1) forKey:nskey];
  }
}
void mandInitUserDefaultInt(NAInt value, const char* key){
  NSUserDefaults* userdefaults = [NSUserDefaults standardUserDefaults];
  NSString* nskey = [NSString stringWithUTF8String:key];
  if([userdefaults integerForKey:nskey] == 0){
    [userdefaults setInteger:value forKey:nskey];
  }
}
void mandInitUserDefaultEnum(NAInt value, const char* key){
  NSUserDefaults* userdefaults = [NSUserDefaults standardUserDefaults];
  NSString* nskey = [NSString stringWithUTF8String:key];
  if([userdefaults integerForKey:nskey] == 0){
    [userdefaults setInteger:value + 1 forKey:nskey];
  }
}
void mandInitUserDefaultDouble(double value, const char* key){
  NSUserDefaults* userdefaults = [NSUserDefaults standardUserDefaults];
  NSString* nskey = [NSString stringWithUTF8String:key];
  if([userdefaults doubleForKey:nskey] == 0.){
    [userdefaults setDouble:value forKey:nskey];
  }
}



void mandSetUserDefaultBool(NABool value, const char* key){
  NSUserDefaults* userdefaults = [NSUserDefaults standardUserDefaults];
  NSString* nskey = [NSString stringWithUTF8String:key];
  [userdefaults setInteger:(value?1:-1) forKey:nskey];
}
void mandSetUserDefaultInt(NAInt value, const char* key){
  NSUserDefaults* userdefaults = [NSUserDefaults standardUserDefaults];
  NSString* nskey = [NSString stringWithUTF8String:key];
  [userdefaults setInteger:value forKey:nskey];
}
void mandSetUserDefaultEnum(NAInt value, const char* key){
  NSUserDefaults* userdefaults = [NSUserDefaults standardUserDefaults];
  NSString* nskey = [NSString stringWithUTF8String:key];
  [userdefaults setInteger:value + 1 forKey:nskey];
}
void mandSetUserDefaultDouble(double value, const char* key){
  NSUserDefaults* userdefaults = [NSUserDefaults standardUserDefaults];
  NSString* nskey = [NSString stringWithUTF8String:key];
  [userdefaults setDouble:value forKey:nskey];
}



NABool mandGetUserDefaultBool(const char* key){
  NSUserDefaults* userdefaults = [NSUserDefaults standardUserDefaults];
  NSString* nskey = [NSString stringWithUTF8String:key];
  return (([userdefaults integerForKey:nskey] == 1) ? NA_TRUE : NA_FALSE);
}
NAInt mandGetUserDefaultInt(const char* key){
  NSUserDefaults* userdefaults = [NSUserDefaults standardUserDefaults];
  NSString* nskey = [NSString stringWithUTF8String:key];
  return (NAInt)[userdefaults integerForKey:nskey];
}
NAInt mandGetUserDefaultEnum(const char* key){
  NSUserDefaults* userdefaults = [NSUserDefaults standardUserDefaults];
  NSString* nskey = [NSString stringWithUTF8String:key];
  return (NAInt)[userdefaults integerForKey:nskey] - 1;
}
double mandGetUserDefaultDouble(const char* key){
  NSUserDefaults* userdefaults = [NSUserDefaults standardUserDefaults];
  NSString* nskey = [NSString stringWithUTF8String:key];
  return [userdefaults doubleForKey:nskey];
}



NABool mandToggleUserDefaultBool(const char* key){
  NSUserDefaults* userdefaults = [NSUserDefaults standardUserDefaults];
  NSString* nskey = [NSString stringWithUTF8String:key];
  NABool value = (([userdefaults integerForKey:nskey] == 1) ? NA_TRUE : NA_FALSE);
  [userdefaults setInteger:(value?-1:1) forKey:nskey];
  return !value;
}



void mandHideMouseCursorUntilMouseMoves(NABool hide){
  [NSCursor setHiddenUntilMouseMoves:hide ? YES : NO];
}



void mandSwitchApplicationToGraphiteAppearance(void){
  [[NSUserDefaults standardUserDefaults] setVolatileDomain:@{@"AppleAquaColorVariant": @6} forName:NSArgumentDomain];
}

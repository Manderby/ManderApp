

#import <Cocoa/Cocoa.h>
#include "MandEnvironment.h"
#include "NAString.h"




void mandInitModifierKeyState(ModifierKeyState* mks){
  mks->alt = NA_FALSE;
  mks->command = NA_FALSE;
  mks->control = NA_FALSE;
  mks->fn = NA_FALSE;
  mks->shift = NA_FALSE;
}


typedef NSUserDefaults MandUserDefaults;


MandUserDefaults* mandGetSystemUserDefaults(){
//  return [[NSUserDefaults alloc] initWithSuiteName:@"group.ch.manderim.hueslipapier"];
  return [NSUserDefaults standardUserDefaults];
}


void mandInitUserDefaultBool(NABool value, const char* key){
  MandUserDefaults* userdefaults = mandGetSystemUserDefaults();
  NSString* nskey = [NSString stringWithUTF8String:key];
  if([userdefaults integerForKey:nskey] == 0){
    [userdefaults setInteger:(value?1:-1) forKey:nskey];
  }
}
void mandInitUserDefaultInt(NAInt value, const char* key){
  MandUserDefaults* userdefaults = mandGetSystemUserDefaults();
  NSString* nskey = [NSString stringWithUTF8String:key];
  if([userdefaults integerForKey:nskey] == 0){
    [userdefaults setInteger:value forKey:nskey];
  }
}
void mandInitUserDefaultEnum(NAInt value, const char* key){
  MandUserDefaults* userdefaults = mandGetSystemUserDefaults();
  NSString* nskey = [NSString stringWithUTF8String:key];
  if([userdefaults integerForKey:nskey] == 0){
    [userdefaults setInteger:value + 1 forKey:nskey];
  }
}
void mandInitUserDefaultDouble(double value, const char* key){
  MandUserDefaults* userdefaults = mandGetSystemUserDefaults();
  NSString* nskey = [NSString stringWithUTF8String:key];
  if([userdefaults doubleForKey:nskey] == 0.){
    [userdefaults setDouble:value forKey:nskey];
  }
}
void mandInitUserDefaultString(NAString* value, const char* key){
  MandUserDefaults* userdefaults = mandGetSystemUserDefaults();
  NSString* nskey = [NSString stringWithUTF8String:key];
  if([userdefaults objectForKey:nskey] == nil){
    NSString* valueobj = [NSString stringWithUTF8String:naGetStringUTF8Pointer(value)];
    [userdefaults setObject:valueobj forKey:nskey];
  }
}



void mandSetUserDefaultBool(NABool value, const char* key){
  MandUserDefaults* userdefaults = mandGetSystemUserDefaults();
  NSString* nskey = [NSString stringWithUTF8String:key];
  [userdefaults setInteger:(value?1:-1) forKey:nskey];
}
void mandSetUserDefaultInt(NAInt value, const char* key){
  MandUserDefaults* userdefaults = mandGetSystemUserDefaults();
  NSString* nskey = [NSString stringWithUTF8String:key];
  [userdefaults setInteger:value forKey:nskey];
}
void mandSetUserDefaultEnum(NAInt value, const char* key){
  MandUserDefaults* userdefaults = mandGetSystemUserDefaults();
  NSString* nskey = [NSString stringWithUTF8String:key];
  [userdefaults setInteger:value + 1 forKey:nskey];
}
void mandSetUserDefaultDouble(double value, const char* key){
  MandUserDefaults* userdefaults = mandGetSystemUserDefaults();
  NSString* nskey = [NSString stringWithUTF8String:key];
  [userdefaults setDouble:value forKey:nskey];
}
void mandSetUserDefaultString(NAString* value, const char* key){
  MandUserDefaults* userdefaults = mandGetSystemUserDefaults();
  NSString* nskey = [NSString stringWithUTF8String:key];
  NSString* valueobj = [NSString stringWithUTF8String:naGetStringUTF8Pointer(value)];
  [userdefaults setObject:valueobj forKey:nskey];
}



NABool mandGetUserDefaultBool(const char* key){
  MandUserDefaults* userdefaults = mandGetSystemUserDefaults();
  NSString* nskey = [NSString stringWithUTF8String:key];
  return (([userdefaults integerForKey:nskey] == 1) ? NA_TRUE : NA_FALSE);
}
NAInt mandGetUserDefaultInt(const char* key){
  MandUserDefaults* userdefaults = mandGetSystemUserDefaults();
  NSString* nskey = [NSString stringWithUTF8String:key];
  return (NAInt)[userdefaults integerForKey:nskey];
}
NAInt mandGetUserDefaultEnum(const char* key){
  MandUserDefaults* userdefaults = mandGetSystemUserDefaults();
  NSString* nskey = [NSString stringWithUTF8String:key];
  return (NAInt)[userdefaults integerForKey:nskey] - 1;
}
double mandGetUserDefaultDouble(const char* key){
  MandUserDefaults* userdefaults = mandGetSystemUserDefaults();
  NSString* nskey = [NSString stringWithUTF8String:key];
  return [userdefaults doubleForKey:nskey];
}
NAString* mandNewUserDefaultString(const char* key){
  MandUserDefaults* userdefaults = mandGetSystemUserDefaults();
  NSString* nskey = [NSString stringWithUTF8String:key];
  NSString* valueobj = [userdefaults stringForKey:nskey];
  return naNewStringWithFormat("%s", [valueobj UTF8String]);
}



NABool mandToggleUserDefaultBool(const char* key){
  MandUserDefaults* userdefaults = mandGetSystemUserDefaults();
  NSString* nskey = [NSString stringWithUTF8String:key];
  NABool value = (([userdefaults integerForKey:nskey] == 1) ? NA_TRUE : NA_FALSE);
  [userdefaults setInteger:(value?-1:1) forKey:nskey];
  return !value;
}



void mandHideMouseCursorUntilMouseMoves(NABool hide){
  [NSCursor setHiddenUntilMouseMoves:hide ? YES : NO];
}



void mandSwitchApplicationToGraphiteAppearance(void){
  [mandGetSystemUserDefaults() setVolatileDomain:@{@"AppleAquaColorVariant": @6} forName:NSArgumentDomain];
}



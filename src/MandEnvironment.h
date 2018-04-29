
#ifndef MAND_ENVIRONMENT_INCLUDED
#define MAND_ENVIRONMENT_INCLUDED

#include "NABase.h"
#include "NAString.h"

typedef struct ModifierKeyState ModifierKeyState;
struct ModifierKeyState{
  NABool shift;
  NABool alt;
  NABool command;
  NABool control;
  NABool fn;
};

void mandInitModifierKeyState(ModifierKeyState* mks);

void mandInitUserDefaultBool(NABool value, const char* key);
void mandInitUserDefaultInt(NAInt value, const char* key);
void mandInitUserDefaultEnum(NAInt value, const char* key);
void mandInitUserDefaultDouble(double value, const char* key);
void mandInitUserDefaultString(NAString* value, const char* key);

void mandSetUserDefaultBool(NABool value, const char* key);
void mandSetUserDefaultInt(NAInt value, const char* key);
void mandSetUserDefaultEnum(NAInt value, const char* key);
void mandSetUserDefaultDouble(double value, const char* key);
void mandSetUserDefaultString(NAString* value, const char* key);

NABool mandGetUserDefaultBool(const char* key);
NAInt mandGetUserDefaultInt(const char* key);
NAInt mandGetUserDefaultEnum(const char* key);
double mandGetUserDefaultDouble(const char* key);
NAString* mandNewUserDefaultString(const char* key);

NABool mandToggleUserDefaultBool(const char* key);

void mandHideMouseCursorUntilMouseMoves(NABool hide);
void mandSwitchApplicationToGraphiteAppearance(void);

#endif // MAND_ENVIRONMENT_INCLUDED


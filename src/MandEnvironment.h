
#ifndef MAND_ENVIRONMENT_INCLUDED
#define MAND_ENVIRONMENT_INCLUDED

#include "NASystem.h"

void mandInitUserDefaultBool(NABool value, const char* key);
void mandInitUserDefaultInt(NAInt value, const char* key);
void mandInitUserDefaultEnum(NAInt value, const char* key);
void mandInitUserDefaultDouble(double value, const char* key);

void mandSetUserDefaultBool(NABool value, const char* key);
void mandSetUserDefaultInt(NAInt value, const char* key);
void mandSetUserDefaultEnum(NAInt value, const char* key);
void mandSetUserDefaultDouble(double value, const char* key);

NABool mandGetUserDefaultBool(const char* key);
NAInt mandGetUserDefaultInt(const char* key);
NAInt mandGetUserDefaultEnum(const char* key);
double mandGetUserDefaultDouble(const char* key);

NABool mandToggleUserDefaultBool(const char* key);

#endif // MAND_ENVIRONMENT_INCLUDED


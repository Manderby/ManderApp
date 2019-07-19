
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

void mandHideMouseCursorUntilMouseMoves(NABool hide);
void mandSwitchApplicationToGraphiteAppearance(void);

#endif // MAND_ENVIRONMENT_INCLUDED


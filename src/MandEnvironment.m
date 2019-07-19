

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




void mandHideMouseCursorUntilMouseMoves(NABool hide){
  [NSCursor setHiddenUntilMouseMoves:hide ? YES : NO];
}



void mandSwitchApplicationToGraphiteAppearance(void){
  [[NSUserDefaults standardUserDefaults] setVolatileDomain:@{@"AppleAquaColorVariant": @6} forName:NSArgumentDomain];
}




#include "ManderAppPreferences.h"
#include MAND_NALIB_PATH(NAUI.h)

const char* ManderAppPrefs[ManderAppPrefsCount] = {
  "lastOpenedVersion"
};

void mandInitManderAppPrefs(void){
  // It is not useful to initialize the LastOpenedVersion with any value.
  // But this is how it could be done:
  // NAString* initialVersion = naNewStringWithFormat("0");
  // naInitPreferencesString(ManderAppPrefs[LastOpenedVersion], initialVersion);
  // naDelete(initialVersion);
}


#include "ManderApp.h"
#include MAND_NALIB_PATH(NAPreferences.h)

enum{
  LastOpenedVersion,
  
  ManderAppPrefsCount
};

extern const char* ManderAppPrefs[ManderAppPrefsCount];

void mandInitManderAppPrefs(void);

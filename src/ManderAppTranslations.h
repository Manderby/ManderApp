
#include "ManderApp.h"
#include MAND_NALIB_PATH(NATranslator.h)

enum{
  MandNewVersionAlertTitle,
  
  MandAbout,
  MandDone,
  MandVersionBuild,
  MandOnlineHelp,
};

const NAUTF8Char* mandTranslate(NAInt id);
void mandInitManderAppTranslations(void);


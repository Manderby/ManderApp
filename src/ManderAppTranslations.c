
#include "ManderAppTranslations.h"

NAInt manderAppTranslatorGroup;

const NAUTF8Char* mandTranslate(NAInt id){
  return naTranslate(manderAppTranslatorGroup, id);
}

void mandInitManderAppTranslations(void){
  manderAppTranslatorGroup = naRegisterTranslatorGroup();
  #include "res/ManderApp_eng.h"
  #include "res/ManderApp_deu.h"
}


#include "ManderAppTranslations.h"

NAInt manderAppTranslatorGroup;

const NAUTF8Char* mandTranslate(NAInt id){
  return naTranslate(manderAppTranslatorGroup, id);
}

void mandInitManderAppTranslations(void){
  manderAppTranslatorGroup = naRegisterTranslatorGroup();
  #include "ManderApp_eng.h"
  #include "ManderApp_deu.h"
}

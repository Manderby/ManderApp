
#include "ManderApp.h"
#include "ManderAppPreferences.h"
#include "ManderAppTranslations.h"
#include "ManderAppAbout.h"
#include "NAUI.h"

void mandPrestartupManderApp(void){
  mandInitManderAppTranslations();
  mandInitManderAppPrefs();
}

void mandPoststartupManderApp(void){
  mandCreateAboutWindow();

//  NSMenu* applicationmenu = [[[NSApp mainMenu] itemAtIndex:0] submenu];
//  NSMenuItem* aboutmenuitem = [applicationmenu itemAtIndex:0];
//  [aboutmenuitem setTarget:self];
//  [aboutmenuitem setAction:@selector(showAbout:)];
}

void mandAlertNewVersion(const NAUTF8Char* infoText){
  NAString* curVersion = naNewBundleVersionString();
  NAString* lastOpenedVersion = naNewPreferencesString(ManderAppPrefs[LastOpenedVersion]);
  if(!naEqualStringToString(curVersion, lastOpenedVersion, NA_TRUE)){
    naSetPreferencesString(ManderAppPrefs[LastOpenedVersion], curVersion);
    
    const NAUTF8Char* formatstring = mandTranslate(MandNewVersionAlertTitle);
    NAString* applicationname = naNewBundleApplicationName();
    NAString* titleText = naNewStringWithFormat(formatstring, naGetStringUTF8Pointer(applicationname), naGetStringUTF8Pointer(curVersion));
    naPresentAlertBox(NA_ALERT_BOX_INFO, naGetStringUTF8Pointer(titleText), infoText);
    naDelete(applicationname);
    naDelete(titleText);
  }
  naDelete(lastOpenedVersion);
  naDelete(curVersion);
}

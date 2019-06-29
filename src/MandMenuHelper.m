
#import "ManderApp.h"
#import "MandMenuHelper.h"
#include "ManderAppTranslations.h"



void trySetMenuItemTranslation(NSMenuItem* item, NAInt id){
  if(item){
    NAString* transstring = mandTranslate(id);
    NSString* nsstring = [NSString stringWithUTF8String:naGetStringUTF8Pointer(transstring)];
    naDelete(transstring);
    if([item hasSubmenu]){
      [[item submenu] setTitle: nsstring];
    }else{
      [item setTitle: nsstring];
    }
  }
}




void trySetMenuItemTranslationWithApplication(NSMenuItem* item, NAInt id){
  if(item){
    NAString* applicationname = [(ManderApp*)NSApp newApplicationNameString];
    NAString* transstring = mandTranslate(id, naGetStringUTF8Pointer(applicationname));
    NSString* nsstring = [NSString stringWithUTF8String:naGetStringUTF8Pointer(transstring)];
    naDelete(transstring);
    [item setTitle: nsstring];
    naDelete(applicationname);
  }
}



@implementation MandMenuHelper

- (void)setupAppMenu{
  trySetMenuItemTranslationWithApplication(appAboutAppItem, MandSubmenuAbout);
  trySetMenuItemTranslation(appPreferencesItem, MandSubmenuPreferences);
  trySetMenuItemTranslation(appServicesItem, MandSubmenuServices);
  trySetMenuItemTranslationWithApplication(appHideAppItem, MandSubmenuHideApp);
  trySetMenuItemTranslation(appHideOthersItem, MandSubmenuHideOthers);
  trySetMenuItemTranslation(appShowAllItem, MandSubmenuShowAllApps);
  trySetMenuItemTranslationWithApplication(appQuitAppItem, MandSubmenuQuitApp);
}



- (void)setupFileMenu{
  trySetMenuItemTranslation(fileMenuItem, MandMenuFile);
  trySetMenuItemTranslation(fileNewItem, MandSubmenuNew);
  trySetMenuItemTranslation(fileOpenItem, MandSubmenuOpen);
  trySetMenuItemTranslation(fileRecentDocsItem, MandSubmenuRecentDocs);
  trySetMenuItemTranslation(fileCloseItem, MandSubmenuClose);
  trySetMenuItemTranslation(fileSaveItem, MandSubmenuSave);
  trySetMenuItemTranslation(fileSaveAsItem, MandSubmenuSaveAs);
  trySetMenuItemTranslation(fileExportItem, MandSubmenuExport);
  trySetMenuItemTranslation(fileRevertItem, MandSubmenuRevert);
  trySetMenuItemTranslation(filePageSetupItem, MandSubmenuPageSetup);
  trySetMenuItemTranslation(filePrintItem, MandSubmenuPrint);
}



- (void)setupEditMenu{
  trySetMenuItemTranslation(editMenuItem, MandMenuEdit);
  trySetMenuItemTranslation(editUndoItem, MandSubmenuUndo);
  trySetMenuItemTranslation(editRedoItem, MandSubmenuRedo);
  trySetMenuItemTranslation(editCutItem, MandSubmenuCut);
  trySetMenuItemTranslation(editCopyItem, MandSubmenuCopy);
  trySetMenuItemTranslation(editPasteItem, MandSubmenuPaste);
  trySetMenuItemTranslation(editClearItem, MandSubmenuClear);
  trySetMenuItemTranslation(editSelectAllItem, MandSubmenuSelectAll);
  trySetMenuItemTranslation(editDeselectAllItem, MandSubmenuDeselectAll);
}



- (void)setupWindowMenu{
  trySetMenuItemTranslation(windowMenuItem, MandMenuWindow);
  trySetMenuItemTranslation(windowMinimizeItem, MandSubmenuMinimize);
  trySetMenuItemTranslation(windowMaximizeItem, MandSubmenuMaximize);
  trySetMenuItemTranslation(windowBringAllToFrontItem, MandSubmenuBringAllToFront);
}

@end

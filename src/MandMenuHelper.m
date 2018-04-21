
#import "MandApplication.h"
#import "MandMenuHelper.h"
#include "MandTranslation.h"


#define MAND_SUBMENU_ABOUT        "MandSubmenuAbout"
#define MAND_SUBMENU_PREFERENCES  "MandSubmenuPreferences"
#define MAND_SUBMENU_SERVICES     "MandSubmenuServices"
#define MAND_SUBMENU_HIDE_APP     "MandSubmenuHideApp"
#define MAND_SUBMENU_HIDE_OTHERS  "MandSubmenuHideOthers"
#define MAND_SUBMENU_SHOW_ALL     "MandSubmenuShowAllApps"
#define MAND_SUBMENU_QUIT_APP     "MandSubmenuQuitApp"

#define MAND_MENU_FILE            "MandMenuFile"
#define MAND_SUBMENU_NEW          "MandSubmenuNew"
#define MAND_SUBMENU_OPEN         "MandSubmenuOpen"
#define MAND_SUBMENU_RECENT_DOCS  "MandSubmenuRecentDocs"
#define MAND_SUBMENU_CLOSE        "MandSubmenuClose"
#define MAND_SUBMENU_SAVE         "MandSubmenuSave"
#define MAND_SUBMENU_SAVE_AS      "MandSubmenuSaveAs"
#define MAND_SUBMENU_EXPORT       "MandSubmenuExport"
#define MAND_SUBMENU_REVERT       "MandSubmenuRevert"
#define MAND_SUBMENU_PAGE_SETUP   "MandSubmenuPageSetup"
#define MAND_SUBMENU_PRINT        "MandSubmenuPrint"

#define MAND_MENU_EDIT            "MandMenuEdit"
#define MAND_SUBMENU_UNDO         "MandSubmenuUndo"
#define MAND_SUBMENU_REDO         "MandSubmenuRedo"
#define MAND_SUBMENU_CUT          "MandSubmenuCut"
#define MAND_SUBMENU_COPY         "MandSubmenuCopy"
#define MAND_SUBMENU_PASTE        "MandSubmenuPaste"
#define MAND_SUBMENU_CLEAR        "MandSubmenuClear"
#define MAND_SUBMENU_SELECT_ALL   "MandSubmenuSelectAll"
#define MAND_SUBMENU_DESELECT_ALL "MandSubmenuDeselectAll"

#define MAND_MENU_WINDOW                "MandMenuWindow"
#define MAND_SUBMENU_MINIMIZE           "MandSubmenuMinimize"
#define MAND_SUBMENU_MAXIMIZE           "MandSubmenuMaximize"
#define MAND_SUBMENU_BRING_ALL_TO_FRONT "MandSubmenuBringAllToFront"



void trySetMenuItemTranslation(NSMenuItem* item, const NAUTF8Char* key){
  if(item){
    NAString* transstring = mandGetBundleString(MAND_TRANSLATION_COLLECTION, key);
    if([item hasSubmenu]){
      [[item submenu] setTitle: [NSString stringWithUTF8String:naGetStringUTF8Pointer(transstring)]];
    }else{
      [item setTitle: [NSString stringWithUTF8String:naGetStringUTF8Pointer(transstring)]];
    }
    naDelete(transstring);
  }
}




void trySetMenuItemTranslationWithApplication(NSMenuItem* item, NAUTF8Char* key){
  if(item){
    NAString* applicationname = [(MandApplication*)NSApp applicationName];
    NAString* transstring = mandGetBundleString(MAND_TRANSLATION_COLLECTION, key);
    NSString* formatstring = [NSString stringWithFormat:[NSString stringWithUTF8String:naGetStringUTF8Pointer(transstring)], naGetStringUTF8Pointer(applicationname)];
    [item setTitle: formatstring];
    naDelete(transstring);
    naDelete(applicationname);
  }
}



@implementation MandMenuHelper

- (void)setupAppMenu{
  trySetMenuItemTranslationWithApplication(appAboutAppItem, MAND_SUBMENU_ABOUT);
  trySetMenuItemTranslation(appPreferencesItem, MAND_SUBMENU_PREFERENCES);
  trySetMenuItemTranslation(appServicesItem, MAND_SUBMENU_SERVICES);
  trySetMenuItemTranslationWithApplication(appHideAppItem, MAND_SUBMENU_HIDE_APP);
  trySetMenuItemTranslation(appHideOthersItem, MAND_SUBMENU_HIDE_OTHERS);
  trySetMenuItemTranslation(appShowAllItem, MAND_SUBMENU_SHOW_ALL);
  trySetMenuItemTranslationWithApplication(appQuitAppItem, MAND_SUBMENU_QUIT_APP);
}



- (void)setupFileMenu{
  trySetMenuItemTranslation(fileMenuItem, MAND_MENU_FILE);
  trySetMenuItemTranslation(fileNewItem, MAND_SUBMENU_NEW);
  trySetMenuItemTranslation(fileOpenItem, MAND_SUBMENU_OPEN);
  trySetMenuItemTranslation(fileRecentDocsItem, MAND_SUBMENU_RECENT_DOCS);
  trySetMenuItemTranslation(fileCloseItem, MAND_SUBMENU_CLOSE);
  trySetMenuItemTranslation(fileSaveItem, MAND_SUBMENU_SAVE);
  trySetMenuItemTranslation(fileSaveAsItem, MAND_SUBMENU_SAVE_AS);
  trySetMenuItemTranslation(fileExportItem, MAND_SUBMENU_EXPORT);
  trySetMenuItemTranslation(fileRevertItem, MAND_SUBMENU_REVERT);
  trySetMenuItemTranslation(filePageSetupItem, MAND_SUBMENU_PAGE_SETUP);
  trySetMenuItemTranslation(filePrintItem, MAND_SUBMENU_PRINT);
}



- (void)setupEditMenu{
  trySetMenuItemTranslation(editMenuItem, MAND_MENU_EDIT);
  trySetMenuItemTranslation(editUndoItem, MAND_SUBMENU_UNDO);
  trySetMenuItemTranslation(editRedoItem, MAND_SUBMENU_REDO);
  trySetMenuItemTranslation(editCutItem, MAND_SUBMENU_CUT);
  trySetMenuItemTranslation(editCopyItem, MAND_SUBMENU_COPY);
  trySetMenuItemTranslation(editPasteItem, MAND_SUBMENU_PASTE);
  trySetMenuItemTranslation(editClearItem, MAND_SUBMENU_CLEAR);
  trySetMenuItemTranslation(editSelectAllItem, MAND_SUBMENU_SELECT_ALL);
  trySetMenuItemTranslation(editDeselectAllItem, MAND_SUBMENU_DESELECT_ALL);
}



- (void)setupWindowMenu{
  trySetMenuItemTranslation(windowMenuItem, MAND_MENU_WINDOW);
  trySetMenuItemTranslation(windowMinimizeItem, MAND_SUBMENU_MINIMIZE);
  trySetMenuItemTranslation(windowMaximizeItem, MAND_SUBMENU_MAXIMIZE);
  trySetMenuItemTranslation(windowBringAllToFrontItem, MAND_SUBMENU_BRING_ALL_TO_FRONT);
}

@end

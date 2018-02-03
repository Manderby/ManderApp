
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



void trySetMenuTranslation(NSMenuItem* item, const NAUTF8Char* key){
  if(item){
    NAString* transstring = mandGetBundleString(MAND_TRANSLATION_COLLECTION, key);
    [item setTitle: [NSString stringWithUTF8String:naGetStringUTF8Pointer(transstring)]];
    naDelete(transstring);
  }
}



void trySetMenuTranslationWithApplication(NSMenuItem* item, NAUTF8Char* key){
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
  trySetMenuTranslationWithApplication(appAboutAppItem, MAND_SUBMENU_ABOUT);
  trySetMenuTranslation(appPreferencesItem, MAND_SUBMENU_PREFERENCES);
  trySetMenuTranslation(appServicesItem, MAND_SUBMENU_SERVICES);
  trySetMenuTranslationWithApplication(appHideAppItem, MAND_SUBMENU_HIDE_APP);
  trySetMenuTranslation(appHideOthersItem, MAND_SUBMENU_HIDE_OTHERS);
  trySetMenuTranslation(appShowAllItem, MAND_SUBMENU_SHOW_ALL);
  trySetMenuTranslationWithApplication(appQuitAppItem, MAND_SUBMENU_QUIT_APP);
}



- (void)setupFileMenu{
  trySetMenuTranslation(fileMenuItem, MAND_MENU_FILE);
  trySetMenuTranslation(fileNewItem, MAND_SUBMENU_NEW);
  trySetMenuTranslation(fileOpenItem, MAND_SUBMENU_OPEN);
  trySetMenuTranslation(fileRecentDocsItem, MAND_SUBMENU_RECENT_DOCS);
  trySetMenuTranslation(fileCloseItem, MAND_SUBMENU_CLOSE);
  trySetMenuTranslation(fileSaveItem, MAND_SUBMENU_SAVE);
  trySetMenuTranslation(fileSaveAsItem, MAND_SUBMENU_SAVE_AS);
  trySetMenuTranslation(fileExportItem, MAND_SUBMENU_EXPORT);
  trySetMenuTranslation(fileRevertItem, MAND_SUBMENU_REVERT);
  trySetMenuTranslation(filePageSetupItem, MAND_SUBMENU_PAGE_SETUP);
  trySetMenuTranslation(filePrintItem, MAND_SUBMENU_PRINT);
}



- (void)setupEditMenu{
  trySetMenuTranslation(editMenuItem, MAND_MENU_EDIT);
  trySetMenuTranslation(editUndoItem, MAND_SUBMENU_UNDO);
  trySetMenuTranslation(editRedoItem, MAND_SUBMENU_REDO);
  trySetMenuTranslation(editCutItem, MAND_SUBMENU_CUT);
  trySetMenuTranslation(editCopyItem, MAND_SUBMENU_COPY);
  trySetMenuTranslation(editPasteItem, MAND_SUBMENU_PASTE);
  trySetMenuTranslation(editClearItem, MAND_SUBMENU_CLEAR);
  trySetMenuTranslation(editSelectAllItem, MAND_SUBMENU_SELECT_ALL);
  trySetMenuTranslation(editDeselectAllItem, MAND_SUBMENU_DESELECT_ALL);
}



- (void)setupWindowMenu{
  trySetMenuTranslation(windowMenuItem, MAND_MENU_WINDOW);
  trySetMenuTranslation(windowMinimizeItem, MAND_SUBMENU_MINIMIZE);
  trySetMenuTranslation(windowMaximizeItem, MAND_SUBMENU_MAXIMIZE);
  trySetMenuTranslation(windowBringAllToFrontItem, MAND_SUBMENU_BRING_ALL_TO_FRONT);
}

@end

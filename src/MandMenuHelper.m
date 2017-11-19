
#import "MandApplication.h"
#import "MandMenuHelper.h"


#define MAND_SUBMENU_ABOUT        @"MandSubmenuAbout"
#define MAND_SUBMENU_PREFERENCES  @"MandSubmenuPreferences"
#define MAND_SUBMENU_SERVICES     @"MandSubmenuServices"
#define MAND_SUBMENU_HIDE_APP     @"MandSubmenuHideApp"
#define MAND_SUBMENU_HIDE_OTHERS  @"MandSubmenuHideOthers"
#define MAND_SUBMENU_SHOW_ALL     @"MandSubmenuShowAllApps"
#define MAND_SUBMENU_QUIT_APP     @"MandSubmenuQuitApp"

#define MAND_MENU_FILE            @"MandMenuFile"
#define MAND_SUBMENU_NEW          @"MandSubmenuNew"
#define MAND_SUBMENU_OPEN         @"MandSubmenuOpen"
#define MAND_SUBMENU_RECENT_DOCS  @"MandSubmenuRecentDocs"
#define MAND_SUBMENU_CLOSE        @"MandSubmenuClose"
#define MAND_SUBMENU_SAVE         @"MandSubmenuSave"
#define MAND_SUBMENU_SAVE_AS      @"MandSubmenuSaveAs"
#define MAND_SUBMENU_EXPORT       @"MandSubmenuExport"
#define MAND_SUBMENU_REVERT       @"MandSubmenuRevert"
#define MAND_SUBMENU_PAGE_SETUP   @"MandSubmenuPageSetup"
#define MAND_SUBMENU_PRINT        @"MandSubmenuPrint"

#define MAND_MENU_EDIT            @"MandMenuEdit"
#define MAND_SUBMENU_UNDO         @"MandSubmenuUndo"
#define MAND_SUBMENU_REDO         @"MandSubmenuRedo"
#define MAND_SUBMENU_CUT          @"MandSubmenuCut"
#define MAND_SUBMENU_COPY         @"MandSubmenuCopy"
#define MAND_SUBMENU_PASTE        @"MandSubmenuPaste"
#define MAND_SUBMENU_CLEAR        @"MandSubmenuClear"
#define MAND_SUBMENU_SELECT_ALL   @"MandSubmenuSelectAll"
#define MAND_SUBMENU_DESELECT_ALL @"MandSubmenuDeselectAll"

#define MAND_MENU_WINDOW                @"MandMenuWindow"
#define MAND_SUBMENU_MINIMIZE           @"MandSubmenuMinimize"
#define MAND_SUBMENU_MAXIMIZE           @"MandSubmenuMaximize"
#define MAND_SUBMENU_BRING_ALL_TO_FRONT @"MandSubmenuBringAllToFront"



@implementation MandMenuHelper

- (void)setupAppMenu{
  NSString* transstring;
  NSString* applicationname = [(MandApplication*)NSApp applicationName];
  
  if(appAboutAppItem){
    transstring = [[NSBundle mainBundle] localizedStringForKey:MAND_SUBMENU_ABOUT value:nil table:@"MandApplication"];
    transstring = [NSString stringWithFormat:transstring, applicationname];
    [appAboutAppItem setTitle: transstring];
  }

  if(appPreferencesItem){
    transstring = [[NSBundle mainBundle] localizedStringForKey:MAND_SUBMENU_PREFERENCES value:nil table:@"MandApplication"];
    [appPreferencesItem setTitle: transstring];
  }

  if(appServicesItem){
    transstring = [[NSBundle mainBundle] localizedStringForKey:MAND_SUBMENU_SERVICES value:nil table:@"MandApplication"];
    [appServicesItem setTitle: transstring];
  }

  if(appHideAppItem){
    transstring = [[NSBundle mainBundle] localizedStringForKey:MAND_SUBMENU_HIDE_APP value:nil table:@"MandApplication"];
    transstring = [NSString stringWithFormat:transstring, applicationname];
    [appHideAppItem setTitle: transstring];
  }

  if(appHideOthersItem){
    transstring = [[NSBundle mainBundle] localizedStringForKey:MAND_SUBMENU_HIDE_OTHERS value:nil table:@"MandApplication"];
    [appHideOthersItem setTitle: transstring];
  }

  if(appShowAllItem){
    transstring = [[NSBundle mainBundle] localizedStringForKey:MAND_SUBMENU_SHOW_ALL value:nil table:@"MandApplication"];
    [appShowAllItem setTitle: transstring];
  }

  if(appQuitAppItem){
    transstring = [[NSBundle mainBundle] localizedStringForKey:MAND_SUBMENU_QUIT_APP value:nil table:@"MandApplication"];
    transstring = [NSString stringWithFormat:transstring, applicationname];
    [appQuitAppItem setTitle: transstring];
  }
}



- (void)setupFileMenu{
  NSString* transstring;
  
  if(fileMenuItem){
    transstring = [[NSBundle mainBundle] localizedStringForKey:MAND_MENU_FILE value:nil table:@"MandApplication"];
    [[fileMenuItem submenu] setTitle: transstring];
  }

  if(fileNewItem){
    transstring = [[NSBundle mainBundle] localizedStringForKey:MAND_SUBMENU_NEW value:nil table:@"MandApplication"];
    [fileNewItem setTitle: transstring];
  }

  if(fileOpenItem){
    transstring = [[NSBundle mainBundle] localizedStringForKey:MAND_SUBMENU_OPEN value:nil table:@"MandApplication"];
    [fileOpenItem setTitle: transstring];
  }

  if(fileRecentDocsItem){
    transstring = [[NSBundle mainBundle] localizedStringForKey:MAND_SUBMENU_RECENT_DOCS value:nil table:@"MandApplication"];
    [fileRecentDocsItem setTitle: transstring];
  }

  if(fileCloseItem){
    transstring = [[NSBundle mainBundle] localizedStringForKey:MAND_SUBMENU_CLOSE value:nil table:@"MandApplication"];
    [fileCloseItem setTitle: transstring];
  }

  if(fileSaveItem){
    transstring = [[NSBundle mainBundle] localizedStringForKey:MAND_SUBMENU_SAVE value:nil table:@"MandApplication"];
    [fileSaveItem setTitle: transstring];
  }

  if(fileSaveAsItem){
    transstring = [[NSBundle mainBundle] localizedStringForKey:MAND_SUBMENU_SAVE_AS value:nil table:@"MandApplication"];
    [fileSaveAsItem setTitle: transstring];
  }

  if(fileExportItem){
    transstring = [[NSBundle mainBundle] localizedStringForKey:MAND_SUBMENU_EXPORT value:nil table:@"MandApplication"];
    [fileExportItem setTitle: transstring];
  }

  if(fileRevertItem){
    transstring = [[NSBundle mainBundle] localizedStringForKey:MAND_SUBMENU_REVERT value:nil table:@"MandApplication"];
    [fileRevertItem setTitle: transstring];
  }

  if(filePageSetupItem){
    transstring = [[NSBundle mainBundle] localizedStringForKey:MAND_SUBMENU_PAGE_SETUP value:nil table:@"MandApplication"];
    [filePageSetupItem setTitle: transstring];
  }

  if(filePrintItem){
    transstring = [[NSBundle mainBundle] localizedStringForKey:MAND_SUBMENU_PRINT value:nil table:@"MandApplication"];
    [filePrintItem setTitle: transstring];
  }
}



- (void)setupEditMenu{
  NSString* transstring;
  
  if(editMenuItem){
    transstring = [[NSBundle mainBundle] localizedStringForKey:MAND_MENU_EDIT value:nil table:@"MandApplication"];
    [[editMenuItem submenu] setTitle: transstring];
  }

  if(editUndoItem){
    transstring = [[NSBundle mainBundle] localizedStringForKey:MAND_SUBMENU_UNDO value:nil table:@"MandApplication"];
    [editUndoItem setTitle: transstring];
  }

  if(editRedoItem){
    transstring = [[NSBundle mainBundle] localizedStringForKey:MAND_SUBMENU_REDO value:nil table:@"MandApplication"];
    [editRedoItem setTitle: transstring];
  }

  if(editCutItem){
    transstring = [[NSBundle mainBundle] localizedStringForKey:MAND_SUBMENU_CUT value:nil table:@"MandApplication"];
    [editCutItem setTitle: transstring];
  }

  if(editCopyItem){
    transstring = [[NSBundle mainBundle] localizedStringForKey:MAND_SUBMENU_COPY value:nil table:@"MandApplication"];
    [editCopyItem setTitle: transstring];
  }

  if(editPasteItem){
    transstring = [[NSBundle mainBundle] localizedStringForKey:MAND_SUBMENU_PASTE value:nil table:@"MandApplication"];
    [editPasteItem setTitle: transstring];
  }

  if(editClearItem){
    transstring = [[NSBundle mainBundle] localizedStringForKey:MAND_SUBMENU_CLEAR value:nil table:@"MandApplication"];
    [editClearItem setTitle: transstring];
  }

  if(editSelectAllItem){
    transstring = [[NSBundle mainBundle] localizedStringForKey:MAND_SUBMENU_SELECT_ALL value:nil table:@"MandApplication"];
    [editSelectAllItem setTitle: transstring];
  }

  if(editDeselectAllItem){
    transstring = [[NSBundle mainBundle] localizedStringForKey:MAND_SUBMENU_DESELECT_ALL value:nil table:@"MandApplication"];
    [editDeselectAllItem setTitle: transstring];
  }
}



- (void)setupWindowMenu{
  NSString* transstring;
  
  if(windowMenuItem){
    transstring = [[NSBundle mainBundle] localizedStringForKey:MAND_MENU_WINDOW value:nil table:@"MandApplication"];
    [[windowMenuItem submenu] setTitle: transstring];
  }

  if(windowMinimizeItem){
    transstring = [[NSBundle mainBundle] localizedStringForKey:MAND_SUBMENU_MINIMIZE value:nil table:@"MandApplication"];
    [windowMinimizeItem setTitle: transstring];
  }

  if(windowMaximizeItem){
    transstring = [[NSBundle mainBundle] localizedStringForKey:MAND_SUBMENU_MAXIMIZE value:nil table:@"MandApplication"];
    [windowMaximizeItem setTitle: transstring];
  }

  if(windowBringAllToFrontItem){
    transstring = [[NSBundle mainBundle] localizedStringForKey:MAND_SUBMENU_BRING_ALL_TO_FRONT value:nil table:@"MandApplication"];
    [windowBringAllToFrontItem setTitle: transstring];
  }
}

@end

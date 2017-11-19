

#import <Cocoa/Cocoa.h>



@interface MandMenuHelper : NSObject{
  IBOutlet NSMenuItem* appAboutAppItem;
  IBOutlet NSMenuItem* appPreferencesItem;
  IBOutlet NSMenuItem* appServicesItem;
  IBOutlet NSMenuItem* appHideAppItem;
  IBOutlet NSMenuItem* appHideOthersItem;
  IBOutlet NSMenuItem* appShowAllItem;
  IBOutlet NSMenuItem* appQuitAppItem;

  IBOutlet NSMenuItem* fileMenuItem;
  IBOutlet NSMenuItem* fileNewItem;
  IBOutlet NSMenuItem* fileOpenItem;
  IBOutlet NSMenuItem* fileRecentDocsItem;
  IBOutlet NSMenuItem* fileCloseItem;
  IBOutlet NSMenuItem* fileSaveItem;
  IBOutlet NSMenuItem* fileSaveAsItem;
  IBOutlet NSMenuItem* fileExportItem;
  IBOutlet NSMenuItem* fileRevertItem;
  IBOutlet NSMenuItem* filePageSetupItem;
  IBOutlet NSMenuItem* filePrintItem;

  IBOutlet NSMenuItem* editMenuItem;
  IBOutlet NSMenuItem* editUndoItem;
  IBOutlet NSMenuItem* editRedoItem;
  IBOutlet NSMenuItem* editCutItem;
  IBOutlet NSMenuItem* editCopyItem;
  IBOutlet NSMenuItem* editPasteItem;
  IBOutlet NSMenuItem* editClearItem;
  IBOutlet NSMenuItem* editSelectAllItem;
  IBOutlet NSMenuItem* editDeselectAllItem;

  IBOutlet NSMenuItem* windowMenuItem;
  IBOutlet NSMenuItem* windowMinimizeItem;
  IBOutlet NSMenuItem* windowMaximizeItem;
  IBOutlet NSMenuItem* windowBringAllToFrontItem;
}

- (void)setupAppMenu;
- (void)setupFileMenu;
- (void)setupEditMenu;
- (void)setupWindowMenu;

@end



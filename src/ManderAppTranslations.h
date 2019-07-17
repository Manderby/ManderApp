
#include "NATranslator.h"

extern NAInt manderAppTranslatorGroup;

#define MANDER_APP_TRANSLATE(id) naTranslate(manderAppTranslatorGroup, id)

enum{
  MandNewVersionAlertTitle,
  
  MandAbout,
  MandPreferences,
  MandDone,
  MandHelp,
  MandVersionBuild,

  MandSubmenuAbout,
  MandSubmenuPreferences,
  MandSubmenuServices,
  MandSubmenuHideApp,
  MandSubmenuHideOthers,
  MandSubmenuShowAllApps,
  MandSubmenuQuitApp,

  MandMenuFile,
  MandSubmenuNew,
  MandSubmenuOpen,
  MandSubmenuRecentDocs,
  MandSubmenuClose,
  MandSubmenuSave,
  MandSubmenuSaveAs,
  MandSubmenuExport,
  MandSubmenuRevert,
  MandSubmenuPageSetup,
  MandSubmenuPrint,

  MandMenuEdit,
  MandSubmenuUndo,
  MandSubmenuRedo,
  MandSubmenuCut,
  MandSubmenuCopy,
  MandSubmenuPaste,
  MandSubmenuClear,
  MandSubmenuSelectAll,
  MandSubmenuDeselectAll,

  MandMenuWindow,
  MandSubmenuMinimize,
  MandSubmenuMaximize,
  MandSubmenuBringAllToFront,
};

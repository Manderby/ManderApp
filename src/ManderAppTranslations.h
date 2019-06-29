
#include "NATranslator.h"
#include "ManderApp.h"

#define MANDER_APP_TRANSLATE(id) naTranslate([(ManderApp*)NSApp getManderAppTranslatorGroup], id)

enum{
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

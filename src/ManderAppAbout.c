
#include "ManderAppAbout.h"
#include "ManderAppTranslations.h"

NAWindow* aboutWindow;
NAImageSpace* iconSpace;
NALabel* appName;
NALabel* appVersion;
NALabel* appDesc;
NAImageSpace* manderCSpace;
NALabel* helpLink;
NAButton* doneButton;



NABool pressAboutDone(NAReaction reaction){
  NA_UNUSED(reaction);
  naCloseWindow(aboutWindow);
  return NA_TRUE;
}



void mandCreateAboutController(void){
  NAString* bundleApplicationName = naNewApplicationName();

  NARect windowrect = naMakeRectS(20, 260, 340, 348);
  const NAUTF8Char* aboutWindowTitleFormatString = mandTranslate(MandAbout);
  NAString* aboutWindowTitleString = naNewStringWithFormat(aboutWindowTitleFormatString, naGetStringUTF8Pointer(bundleApplicationName));
  aboutWindow = naNewWindow(naGetStringUTF8Pointer(aboutWindowTitleString), windowrect, NA_FALSE, 0);
  naDelete(aboutWindowTitleString);
  
  NASpace* space = naGetWindowContentSpace(aboutWindow);

  iconSpace = naNewImageSpace(naMakeRectS(106, 200, 128, 128));
  NAString* bundleIconPath = naNewApplicationIconPath();
  naSetImageSpacePath(iconSpace, naGetStringUTF8Pointer(bundleIconPath));
  naDelete(bundleIconPath);
  naAddSpaceChild(space, iconSpace);

  appName = naNewLabel(naGetStringUTF8Pointer(bundleApplicationName), naMakeRectS(20, 162, 300, 22));
  naSetLabelFontKind(appName, NA_FONT_KIND_TITLE);
  naSetLabelTextAlignment(appName, NA_TEXT_ALIGNMENT_CENTER);
  naAddSpaceChild(space, appName);

  NAString* bundleVersionString = naNewApplicationVersionString();
  NAString* bundleBuildString = naNewApplicationBuildString();
  const NAUTF8Char* aboutVersionFormatString = mandTranslate(MandVersionBuild);
  NAString* aboutVersionString = naNewStringWithFormat(aboutVersionFormatString, naGetStringUTF8Pointer(bundleVersionString), naGetStringUTF8Pointer(bundleBuildString));
  appVersion = naNewLabel(naGetStringUTF8Pointer(aboutVersionString), naMakeRectS(20, 140, 300, 22));
  naDelete(aboutVersionString);
  naDelete(bundleVersionString);
  naDelete(bundleBuildString);
  naSetLabelTextAlignment(appVersion, NA_TEXT_ALIGNMENT_CENTER);
  naAddSpaceChild(space, appVersion);

  appDesc = naNewLabel("", naMakeRectS(20, 74, 300, 66));
  naSetLabelTextAlignment(appDesc, NA_TEXT_ALIGNMENT_CENTER);
  naAddSpaceChild(space, appDesc);

  helpLink = naNewLabel(mandTranslate(MandOnlineHelp), naMakeRectS(20, 65, 300, 22));
  naSetLabelTextAlignment(helpLink, NA_TEXT_ALIGNMENT_CENTER);
  naSetLabelLink(helpLink, "http://manderc.com");
  naAddSpaceChild(space, helpLink);

//  manderCSpace = naNewImageSpace(naMakeRectS(120, 70, 100, 21));
//  NAString* bundleResourcePath = naNewApplicationResourcePath("manderc", "png");
//  naSetImageSpacePath(manderCSpace, naGetStringUTF8Pointer(bundleResourcePath));
//  naDelete(bundleResourcePath);
//  naAddSpaceChild(space, manderCSpace);

  doneButton = naNewPushButton(mandTranslate(MandDone), naMakeRectS(130, 20, 80, 24));
  naAddUIReaction(doneButton, NA_UI_COMMAND_PRESSED, pressAboutDone, NA_NULL);
  naAddSpaceChild(space, doneButton);

  naSetButtonSubmit(doneButton, pressAboutDone, NA_NULL);
  naSetButtonAbort(doneButton, pressAboutDone, NA_NULL);

  naDelete(bundleApplicationName);
}



void mandSetAboutDescriptionAndHelpURL(const NAUTF8Char* desc, const NAUTF8Char* helpURL){
  naSetLabelText(appDesc, desc);
  if(helpURL){
    naSetLabelLink(helpLink, helpURL);
  }
}



void mandShowAboutController(void){
  naShowWindow(aboutWindow);
}

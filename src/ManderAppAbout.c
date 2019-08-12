
#include "ManderAppAbout.h"
#include "ManderAppTranslations.h"

NAWindow* aboutWindow;
NAImageSpace* iconSpace;
NALabel* appName;
NALabel* appVersion;
NALabel* appDesc;
NAImageSpace* manderCSpace;
NALabel* manderCLink;
NAButton* doneButton;



NABool pressAboutDone(void* controller, NAUIElement* uielement, NAUICommand command, void* arg){
  NA_UNUSED(controller);
  NA_UNUSED(uielement);
  NA_UNUSED(command);
  NA_UNUSED(arg);
  naCloseWindow(aboutWindow);
  return NA_TRUE;
}



void mandCreateAboutController(void){
  NAString* bundleApplicationName = naNewBundleApplicationName();

  NARect windowrect = naMakeRectS(20, 280, 340, 388);
  const NAUTF8Char* aboutWindowTitleFormatString = mandTranslate(MandAbout);
  NAString* aboutWindowTitleString = naNewStringWithFormat(aboutWindowTitleFormatString, naGetStringUTF8Pointer(bundleApplicationName));
  aboutWindow = naNewWindow(naGetStringUTF8Pointer(aboutWindowTitleString), windowrect, NA_FALSE);
  naDelete(aboutWindowTitleString);
  
  NASpace* space = naGetWindowContentSpace(aboutWindow);

  iconSpace = naNewImageSpace(naMakeRectS(106, 240, 128, 128));
  NAString* bundleIconPath = naNewBundleIconPath();
  naSetImageSpacePath(iconSpace, naGetStringUTF8Pointer(bundleIconPath));
  naDelete(bundleIconPath);
  naAddSpaceChild(space, iconSpace);

  appName = naNewLabel(naGetStringUTF8Pointer(bundleApplicationName), naMakeRectS(20, 202, 300, 22));
  naSetLabelFontKind(appName, NA_FONT_KIND_TITLE);
  naSetLabelTextAlignment(appName, NA_TEXT_ALIGNMENT_CENTER);
  naAddSpaceChild(space, appName);

  NAString* bundleVersionString = naNewBundleVersionString();
  NAString* bundleBuildString = naNewBundleBuildString();
  const NAUTF8Char* aboutVersionFormatString = mandTranslate(MandVersionBuild);
  NAString* aboutVersionString = naNewStringWithFormat(aboutVersionFormatString, naGetStringUTF8Pointer(bundleVersionString), naGetStringUTF8Pointer(bundleBuildString));
  appVersion = naNewLabel(naGetStringUTF8Pointer(aboutVersionString), naMakeRectS(20, 180, 300, 22));
  naDelete(aboutVersionString);
  naDelete(bundleVersionString);
  naDelete(bundleBuildString);
  naSetLabelTextAlignment(appVersion, NA_TEXT_ALIGNMENT_CENTER);
  naAddSpaceChild(space, appVersion);

  appDesc = naNewLabel("", naMakeRectS(20, 114, 300, 66));
  naSetLabelTextAlignment(appDesc, NA_TEXT_ALIGNMENT_CENTER);
  naAddSpaceChild(space, appDesc);

  manderCSpace = naNewImageSpace(naMakeRectS(120, 92, 100, 21));
  NAString* bundleResourcePath = naNewBundleResourcePath("manderc", "png");
  naSetImageSpacePath(manderCSpace, naGetStringUTF8Pointer(bundleResourcePath));
  naDelete(bundleResourcePath);
  naAddSpaceChild(space, manderCSpace);

  manderCLink = naNewLabel("http://manderc.com", naMakeRectS(20, 65, 300, 22));
  naSetLabelTextAlignment(manderCLink, NA_TEXT_ALIGNMENT_CENTER);
  naSetLabelLink(manderCLink, "http://manderc.com");
  naAddSpaceChild(space, manderCLink);

  doneButton = naNewButton(mandTranslate(MandDone), naMakeRectS(130, 20, 80, 24));
  naAddUIReaction(NA_NULL, doneButton, NA_UI_COMMAND_PRESSED, pressAboutDone);
  naAddSpaceChild(space, doneButton);

  naDelete(bundleApplicationName);
}



void mandSetAboutDescription(const NAUTF8Char* desc){
  naSetLabelText(appDesc, desc);
}



void mandShowAboutController(void){
  naShowWindow(aboutWindow);
}
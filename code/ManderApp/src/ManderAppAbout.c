
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

  NARect windowrect = naMakeRectS(20, 300, 340, 348);
  const NAUTF8Char* aboutWindowTitleFormatString = mandTranslate(MandAbout);
  NAString* aboutWindowTitleString = naNewStringWithFormat(aboutWindowTitleFormatString, naGetStringUTF8Pointer(bundleApplicationName));
  // We have no storage tag as the about window is not really part of the application
  aboutWindow = naNewWindow(naGetStringUTF8Pointer(aboutWindowTitleString), windowrect, NA_FALSE, 0);
  naDelete(aboutWindowTitleString);
  
  NASpace* space = naGetWindowContentSpace(aboutWindow);

  NAString* iconPath = naNewApplicationIconPath();
  NABabyImage* iconImage = naCreateBabyImageFromFilePath(naGetStringUTF8Pointer(iconPath));
  NAUIImage* iconCUIImage = naNewUIImage(iconImage, NA_NULL, NA_UIIMAGE_RESOLUTION_2x, NA_BLEND_ZERO);
  naReleaseBabyImage(iconImage);
  naDelete(iconPath);
  iconSpace = naNewImageSpace(iconCUIImage, naMakeSize(128, 128));
  naAddSpaceChild(space, iconSpace, naMakePos(106., 200.));
  naRelease(iconCUIImage);

  appName = naNewLabel(naGetStringUTF8Pointer(bundleApplicationName), naMakeSize(300, 22));
  naSetLabelFontKind(appName, NA_FONT_KIND_TITLE);
  naSetLabelTextAlignment(appName, NA_TEXT_ALIGNMENT_CENTER);
  naAddSpaceChild(space, appName, naMakePos(20., 162.));

  NAString* bundleVersionString = naNewApplicationVersionString();
  NAString* bundleBuildString = naNewApplicationBuildString();
  const NAUTF8Char* aboutVersionFormatString = mandTranslate(MandVersionBuild);
  NAString* aboutVersionString = naNewStringWithFormat(aboutVersionFormatString, naGetStringUTF8Pointer(bundleVersionString), naGetStringUTF8Pointer(bundleBuildString));
  appVersion = naNewLabel(naGetStringUTF8Pointer(aboutVersionString), naMakeSize(300, 22));
  naDelete(aboutVersionString);
  naDelete(bundleVersionString);
  naDelete(bundleBuildString);
  naSetLabelTextAlignment(appVersion, NA_TEXT_ALIGNMENT_CENTER);
  naAddSpaceChild(space, appVersion, naMakePos(20., 140.));

  appDesc = naNewLabel("", naMakeSize(300, 56));
  naSetLabelTextAlignment(appDesc, NA_TEXT_ALIGNMENT_CENTER);
  naAddSpaceChild(space, appDesc, naMakePos(20., 76.));

  helpLink = naNewLabel(mandTranslate(MandOnlineHelp), naMakeSize(300, 22));
  naSetLabelTextAlignment(helpLink, NA_TEXT_ALIGNMENT_CENTER);
  naAddSpaceChild(space, helpLink, naMakePos(20., 54.));

  doneButton = naNewPushButton(mandTranslate(MandDone), naMakeSize(80, 24));
  naAddUIReaction(doneButton, NA_UI_COMMAND_PRESSED, pressAboutDone, NA_NULL);
  naAddSpaceChild(space, doneButton, naMakePos(130., 20.));

  naSetButtonSubmit(doneButton, pressAboutDone, NA_NULL);
  naSetButtonAbort(doneButton, pressAboutDone, NA_NULL);

  naDelete(bundleApplicationName);
}



void mandSetAboutDescriptionAndHelpURL(const NAUTF8Char* desc, const NAUTF8Char* helpURL){
  if(!appDesc){
    #ifndef NDEBUG
        naError("UI not available. Probably a call to mandCreateUI is missing.");
    #endif
    return;
  }
  naSetLabelText(appDesc, desc);
  if(helpURL){
    naSetLabelLink(helpLink, helpURL);
  }
}



void mandShowAboutController(void){
  if(!aboutWindow){
    #ifndef NDEBUG
        naError("UI not available. Probably a call to mandCreateUI is missing.");
    #endif
    return;
  }
  naShowWindow(aboutWindow);
}



void mandSetAboutWindowStorageTag(NAInt storageTag){
  NARect rect = naGetUIElementRect(aboutWindow, NA_NULL, NA_FALSE);
  rect = naSetWindowStorageTag(aboutWindow, storageTag, rect, NA_FALSE);
  naSetWindowRect(aboutWindow, rect);
}



// Copyright(c) Tobias Stamm
// 
// Permission is hereby granted, free of charge, to any person obtaining a
// copy of this softwareand associated documentation files(the "Software"),
// to deal in the Software without restriction, including without limitation
// the rights to use, copy, modify, merge, publish, distribute, sublicense,
// and /or sell copies of the Software, and to permit persons to whom the
// Software is furnished to do so, subject to the following conditions :
// 
// The above copyright noticeand this permission notice shall be included in
// all copies or substantial portions of the Software.
// 
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
// FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
// DEALINGS IN THE SOFTWARE.

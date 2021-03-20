
#include "ManderApp.h"
#include "ManderAppPreferences.h"
#include "ManderAppTranslations.h"
#include "ManderAppAbout.h"
#include MAND_NALIB_PATH(NAUI.h)



void mandInitManderApp(void){
  mandInitManderAppTranslations();
  mandInitManderAppPrefs();
}



void mandCreateUI(void){
  mandCreateAboutController();
}



void mandAlertNewVersion(const NAUTF8Char* infoText){
  NAString* curVersion = naNewApplicationVersionString();
  NAString* lastOpenedVersion = naNewPreferencesString(ManderAppPrefs[LastOpenedVersion]);
  if(!lastOpenedVersion || !naEqualStringToString(curVersion, lastOpenedVersion, NA_TRUE)){
    naSetPreferencesString(ManderAppPrefs[LastOpenedVersion], curVersion);
    
    const NAUTF8Char* formatstring = mandTranslate(MandNewVersionAlertTitle);
    NAString* applicationname = naNewApplicationName();
    NAString* titleText = naNewStringWithFormat(formatstring, naGetStringUTF8Pointer(applicationname), naGetStringUTF8Pointer(curVersion));
    naPresentAlertBox(NA_ALERT_BOX_INFO, naGetStringUTF8Pointer(titleText), infoText);
    naDelete(applicationname);
    naDelete(titleText);
  }
  if(lastOpenedVersion){naDelete(lastOpenedVersion);}
  naDelete(curVersion);
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

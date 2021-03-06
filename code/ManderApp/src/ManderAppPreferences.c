
#include "ManderAppPreferences.h"
#include MAND_NALIB_PATH(NAUI.h)

const char* ManderAppPrefs[ManderAppPrefsCount] = {
  "lastOpenedVersion"
};

void mandInitManderAppPrefs(void){
  // It is not useful to initialize the LastOpenedVersion with any value.
  // But this is how it could be done:
  // NAString* initialVersion = naNewStringWithFormat("0");
  // naInitPreferencesString(ManderAppPrefs[LastOpenedVersion], initialVersion);
  // naDelete(initialVersion);
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

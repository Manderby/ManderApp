
#include "NABase.h"
#if (NA_OS == NA_OS_MAC_OS_X) && (NA_CONFIG_COMPILE_GUI == 1)

#include "NACoord.h"
#include "NAString.h"

typedef struct NASelector NASelector;

// NSObject
void releaseNSObject(void* nsobj);

// NSControl
void naTellNSControlSetAction(void* nscontrol, NASelector* action);
void naTellNSControlSetTarget(void* nscontrol, void* target);

// NSView
void naTellNSViewSetVisible(void* nsview, NABool visible);

// NSButton
void* allocNSButton(void);
void* allocNSButtonWithFrame(NARect frame);
void  naTellNSButtonSetTitle(void* nsbutton, const NAUTF8Char* title);
void  naTellNSButtonSetToolTip(void* nsbutton, const NAUTF8Char* tooltip);
void  naTellNSButtonSetState(void* nsbutton, NABool state);
void  naTellNSButtonSetTag(void* nsbutton, NAInt tag);
void  naTellNSButtonSetImage(void* nsbutton, void* nsimage);
void  naTellNSButtonSetAlternativeImage(void* nsbutton, void* nsimage);
void  naTellNSButtonSetImagePosition(void* nsbutton, int position);
void  naTellNSButtonSetImageScaling(void* nsbutton, int scaling);
void  naTellNSButtonSetBordered(void* nsbutton, NABool set);
void  naTellNSButtonSetButtonType(void* nsbutton, int type);
void  naTellNSButtonSetBezelStyle(void* nsbutton, int style);
NABool naAskNSButtonState(void* nsbutton);

// NSImage
void* allocNSImage(void);
void* allocNSImageWithSize(NASizei size);
void* allocNSImageWithContentsOfUrl(void* nsurl);
void  naTellNSImageAddRepresentation(void* nsimage, CGImageRef rep);

// NSCursor
void* allocNSCursor(void);
void* allocNSCursorWithImage(void* nsimage, NAPos hotspot);

// NSSlider
void naTellNSSliderSetDoubleValue(void* nsslider, double value);
double naAskNSSliderDoubleValue(void* nsslider);

// NSTextField
void naTellNSTextFieldSetStringValue(void* nstextfield, const NAUTF8Char* value);
void naTellNSTextFieldSetTextColor(void* nstextfield, const float* rgba);
NAString* naAskNSTextFieldStringValue(void* nstextfield);

// NSColor
void* allocNSColor(void);
void* allocNSColorWithLinearRGBA(const float* rgba);
void naTellNSColorSet(void* nscolor);

#endif

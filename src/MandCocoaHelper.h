
#include "NACoord.h"
#include "NAString.h"

typedef struct NASelector NASelector;

// NSObject
void releaseNSObject(void* nsobj);

// NSControl
void naSendNSControlSetAction(void* nscontrol, NASelector* action);
void naSendNSControlSetTarget(void* nscontrol, void* target);

// NSButton
void* allocNSButton(void);
void* allocNSButtonWithFrame(NARect frame);
void  naSendNSButtonSetTitle(void* nsbutton, const NAString* title);
void  naSendNSButtonSetToolTip(void* nsbutton, const NAString* tooltip);
void  naSendNSButtonSetState(void* nsbutton, NABool state);
void  naSendNSButtonSetTag(void* nsbutton, NAInt tag);
void  naSendNSButtonSetImage(void* nsbutton, void* nsimage);
void  naSendNSButtonSetAlternativeImage(void* nsbutton, void* nsimage);
void  naSendNSButtonSetImagePosition(void* nsbutton, int position);
void  naSendNSButtonSetImageScaling(void* nsbutton, int scaling);
void  naSendNSButtonSetBordered(void* nsbutton, NABool set);
void  naSendNSButtonSetButtonType(void* nsbutton, int type);
void  naSendNSButtonSetBezelStyle(void* nsbutton, int style);

// NSImage
void* allocNSImage(void);
void* allocNSImageWithSize(NASizei size);
void* allocNSImageWithContentsOfUrl(void* nsurl);
void  naSendNSImageAddRepresentation(void* nsimage, CGImageRef rep);

// NSCursor
void* allocNSCursor(void);
void* allocNSCursorWithImage(void* nsimage, NAPos hotspot);

// NSSlider
void naSendNSSliderSetDoubleValue(void* nsslider, double value);

// NSTextField
void naSendNSTextFieldSetStringValue(void* nstextfield, const NAString* value);
void naSendNSTextFieldSetTextColor(void* nstextfield, const float* rgba);

// NSColor
void* allocNSColor(void);
void* allocNSColorWithLinearRGBA(const float* rgba);
void naSendNSColorSet(void* nscolor);




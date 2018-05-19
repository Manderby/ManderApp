
#import <Cocoa/Cocoa.h>
#include "MandCocoaHelper.h"

struct NASelector{
  SEL sel;
};



// NSButton

void releaseNSObject(void* nsobj){
  NSObject* obj = nsobj;
  [obj release];
}



// NSControl

void naSendNSControlSetAction(void* nscontrol, NASelector* action){
  NSControl* control = nscontrol;
  [control setAction:(SEL)(action->sel)];
}

void naSendNSControlSetTarget(void* nscontrol, void* target){
  NSControl* control = nscontrol;
  [control setTarget:(id)target];
}



// NSButton

void* allocNSButton(void){
  return [NSButton alloc];
}

void* allocNSButtonWithFrame(NARect frame){
  return [(NSButton*)allocNSButton() initWithFrame:naMakeNSRectWithRect(frame)];
}

void naSendNSButtonSetTitle(void* nsbutton, const NAString* title){
  NSButton* button = nsbutton;
  [button setTitle:naAllocNSStringWithNAString(title)];
}

void naSendNSButtonSetToolTip(void* nsbutton, const NAString* tooltip){
  NSButton* button = nsbutton;
  [button setToolTip:naAllocNSStringWithNAString(tooltip)];
}

void naSendNSButtonSetState(void* nsbutton, NABool state){
  NSButton* button = nsbutton;
  [button setState:state ? NSOnState : NSOffState];
}

void naSendNSButtonSetTag(void* nsbutton, NAInt tag){
  NSButton* button = nsbutton;
  [button setTag:(NSInteger)tag];
}

void naSendNSButtonSetImage(void* nsbutton, void* nsimage){
  NSButton* button = nsbutton;
  NSImage* image = nsimage;
  [button setImage:image];
}

void naSendNSButtonSetAlternativeImage(void* nsbutton, void* nsimage){
  NSButton* button = nsbutton;
  NSImage* image = nsimage;
  [button setAlternateImage:image];
}

void naSendNSButtonSetImagePosition(void* nsbutton, int position){
  NSButton* button = nsbutton;
  [button setImagePosition:(NSCellImagePosition)position];
}

void naSendNSButtonSetImageScaling(void* nsbutton, int scaling){
  NSButton* button = nsbutton;
  [button setImageScaling:(NSImageScaling)scaling];
}

void naSendNSButtonSetBordered(void* nsbutton, NABool set){
  NSButton* button = nsbutton;
  [button setBordered:(bool)set];
}

void naSendNSButtonSetButtonType(void* nsbutton, int type){
  NSButton* button = nsbutton;
  [button setButtonType:(NSButtonType)type];
}

void naSendNSButtonSetBezelStyle(void* nsbutton, int style){
  NSButton* button = nsbutton;
  [button setBezelStyle:(NSBezelStyle)style];
}



// NSImage

void* allocNSImage(void){
  return [NSImage alloc];
}

void* allocNSImageWithSize(NASizei size){
  return [(NSImage*)allocNSImage() initWithSize:NSMakeSize(size.width, size.height)];
}

void* allocNSImageWithContentsOfUrl(void* nsurl){
  NSURL* url = nsurl;
  return [(NSImage*)allocNSImage() initWithContentsOfURL:url];
}

void naSendNSImageAddRepresentation(void* nsimage, CGImageRef rep){
  NSImage* image = nsimage;
  NSBitmapImageRep* nsrep = [[[NSBitmapImageRep alloc] initWithCGImage:rep] autorelease];
  [image addRepresentation:nsrep];
}



// NSCursor

void* allocNSCursor(void){
  return [NSCursor alloc];
}

void* allocNSCursorWithImage(void* nsimage, NAPos hotspot){
  return [(NSCursor*)allocNSCursor() initWithImage:nsimage hotSpot:naMakeNSPointWithPos(hotspot)];
}



// NSSlider

void naSendNSSliderSetDoubleValue(void* nsslider, double value){
  NSSlider* slider = nsslider;
  [slider setDoubleValue:value];
}



// NSTextField

void naSendNSTextFieldSetStringValue(void* nstextfield, const NAString* value){
  NSTextField* textfield = nstextfield;
  [textfield setStringValue:naAllocNSStringWithNAString(value)];
}

void naSendNSTextFieldSetTextColor(void* nstextfield, const float* rgba){
  NSTextField* textfield = nstextfield;
  [textfield setTextColor:allocNSColorWithLinearRGBA(rgba)];
}



// NSColor

void* allocNSColor(void){
  return [NSColor alloc];
}

void* allocNSColorWithLinearRGBA(const float* rgba){
  CGFloat colorvalues[4] = {naPowf(rgba[0], 1.f/2.2f), naPowf(rgba[1], 1.f/2.2f), naPowf(rgba[2], 1.f/2.2f), rgba[3]};
  CGColorSpaceRef colorspace = CGColorSpaceCreateWithName(kCGColorSpaceSRGB);
  CGColorRef cgcolor = CGColorCreate(colorspace, colorvalues);
  NSColor* color = [NSColor colorWithCGColor:cgcolor];
  CGColorRelease(cgcolor);
  CGColorSpaceRelease(colorspace);
  return color;
}

void naSendNSColorSet(void* nscolor){
  NSColor* color = nscolor;
  [color set];
}



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

void naTellNSControlSetAction(void* nscontrol, NASelector* action){
  NSControl* control = nscontrol;
  [control setAction:(SEL)(action->sel)];
}

void naTellNSControlSetTarget(void* nscontrol, void* target){
  NSControl* control = nscontrol;
  [control setTarget:(id)target];
}



// NSView

void naTellNSViewSetVisible(void* nsview, NABool visible){
  NSView* view = nsview;
  [view setHidden:visible ? NO : YES];
}



// NSButton

void* allocNSButton(void){
  return [NSButton alloc];
}

void* allocNSButtonWithFrame(NARect frame){
  return [(NSButton*)allocNSButton() initWithFrame:naMakeNSRectWithRect(frame)];
}

void naTellNSButtonSetTitle(void* nsbutton, const NAUTF8Char* title){
  NSButton* button = nsbutton;
  [button setTitle:[NSString stringWithUTF8String:title]];
}

void naTellNSButtonSetToolTip(void* nsbutton, const NAUTF8Char* tooltip){
  NSButton* button = nsbutton;
  [button setToolTip:[NSString stringWithUTF8String:tooltip]];
}

void naTellNSButtonSetState(void* nsbutton, NABool state){
  NSButton* button = nsbutton;
  [button setState:state ? NSOnState : NSOffState];
}

void naTellNSButtonSetTag(void* nsbutton, NAInt tag){
  NSButton* button = nsbutton;
  [button setTag:(NSInteger)tag];
}

void naTellNSButtonSetImage(void* nsbutton, void* nsimage){
  NSButton* button = nsbutton;
  NSImage* image = nsimage;
  [button setImage:image];
}

void naTellNSButtonSetAlternativeImage(void* nsbutton, void* nsimage){
  NSButton* button = nsbutton;
  NSImage* image = nsimage;
  [button setAlternateImage:image];
}

void naTellNSButtonSetImagePosition(void* nsbutton, int position){
  NSButton* button = nsbutton;
  [button setImagePosition:(NSCellImagePosition)position];
}

void naTellNSButtonSetImageScaling(void* nsbutton, int scaling){
  NSButton* button = nsbutton;
  [button setImageScaling:(NSImageScaling)scaling];
}

void naTellNSButtonSetBordered(void* nsbutton, NABool set){
  NSButton* button = nsbutton;
  [button setBordered:(bool)set];
}

void naTellNSButtonSetButtonType(void* nsbutton, int type){
  NSButton* button = nsbutton;
  [button setButtonType:(NSButtonType)type];
}

void naTellNSButtonSetBezelStyle(void* nsbutton, int style){
  NSButton* button = nsbutton;
  [button setBezelStyle:(NSBezelStyle)style];
}

NABool naAskNSButtonState(void* nsbutton){
  NSButton* button = nsbutton;
  return ([button state] == NSOnState);
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

void naTellNSImageAddRepresentation(void* nsimage, CGImageRef rep){
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

void naTellNSSliderSetDoubleValue(void* nsslider, double value){
  NSSlider* slider = nsslider;
  [slider setDoubleValue:value];
}

double naAskNSSliderDoubleValue(void* nsslider){
  NSSlider* slider = nsslider;
  return [slider doubleValue];
}


// NSTextField

void naTellNSTextFieldSetStringValue(void* nstextfield, const NAUTF8Char* value){
  NSTextField* textfield = nstextfield;
  [textfield setStringValue:[NSString stringWithUTF8String:value]];
}

void naTellNSTextFieldSetTextColor(void* nstextfield, const float* rgba){
  NSTextField* textfield = nstextfield;
  [textfield setTextColor:allocNSColorWithLinearRGBA(rgba)];
}

NAString* naAskNSTextFieldStringValue(void* nstextfield){
  NSTextField* textfield = nstextfield;
  return naNewStringWithFormat([[textfield stringValue] UTF8String]);
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

void naTellNSColorSet(void* nscolor){
  NSColor* color = nscolor;
  [color set];
}


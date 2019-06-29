
#include "MandConfiguration.h"
#include "MandMenuHelper.h"
#include "MandEnvironment.h"

#import <Cocoa/Cocoa.h>
#include "NABase.h"


#define MAND_LINE_HEIGHT_POINTS 12
#define MAND_SCROLL_SPEED 0.15

@class MandAboutWindowController;
@class MandHelpWindowController;



NSURL* urlForFile(const NAUTF8Char* basename, const NAUTF8Char* suffix, const NAUTF8Char* folder);


NAString* mandTranslate(NAInt id, ...);


@interface ManderApp : NSApplication <NSApplicationDelegate> {
  IBOutlet NSMenu* menu;
  IBOutlet NSMenuItem* helpMenuItem;
  IBOutlet MandAboutWindowController* aboutwindowcontroller;
//  MandHelpWindowController* helpwindowcontroller;
  NSArray* aboutWindowNibObjects;
  const NAUTF8Char* desc;
  NAInt manderAppTranslatorGroup;
}

//- (void)setHelpDocument:(NSURL*)url;

- (NAString*)newApplicationNameString;
- (void)setApplicationDescription:(const NAUTF8Char*) desc;
- (NAInt)getManderAppTranslatorGroup;

+ (BOOL)loadNibNamed:(NSString*)nibName ifNotNil:(id)testObject owner:(id)owner topLevelObjects:(NSArray**)objects;
+ (NSCursor*)allocCursorFromBasename:(NSString*)basename pointX:(CGFloat)x pointY:(CGFloat)y;
+ (CGFloat)getUIScaleFactorForWindow:(NSWindow*)window;
+ (CGFloat)getScrollingDeltaX:(NSEvent*)event;
+ (CGFloat)getScrollingDeltaY:(NSEvent*)event;
+ (ModifierKeyState)makeModifierKeyState:(NSEvent*)event;
+ (CGFloat)getWindowBottomBorder;
+ (void)openDocumentWithURL:(NSURL*)url;

@end

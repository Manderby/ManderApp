
#include "MandConfiguration.h"
#include "MandMenuHelper.h"
#include "MandEnvironment.h"

#import <Cocoa/Cocoa.h>
#include "NASystem.h"


#define MAND_LINE_HEIGHT_POINTS 12
#define MAND_SCROLL_SPEED 0.15

#define MAND_TRANSLATION_COLLECTION "MandApplication"

@class MandAboutWindowController;
@class MandHelpWindowController;



NSURL* urlForFile(const NAUTF8Char* basename, const NAUTF8Char* suffix, const NAUTF8Char* folder);


NSString* mandTranslate(NAUTF8Char* collection, const NAUTF8Char* key);


@interface MandApplication : NSApplication <NSApplicationDelegate> {
  IBOutlet NSMenu* menu;
  IBOutlet NSMenuItem* helpMenuItem;
  IBOutlet MandAboutWindowController* aboutwindowcontroller;
  MandHelpWindowController* helpwindowcontroller;
  NSArray* aboutWindowNibObjects;
}

- (void)setHelpDocument:(NSURL*)url;

- (NAString*)applicationName;

+ (BOOL)loadNibNamed:(NSString*)nibName ifNotNil:(id)testObject owner:(id)owner topLevelObjects:(NSArray**)objects;
+ (NSCursor*)allocCursorFromBasename:(NSString*)basename pointX:(CGFloat)x pointY:(CGFloat)y;
+ (CGFloat)getUIScaleFactorForWindow:(NSWindow*)window;
+ (CGFloat)getScrollingDeltaX:(NSEvent*)event;
+ (CGFloat)getScrollingDeltaY:(NSEvent*)event;
+ (ModifierKeyState)makeModifierKeyState:(NSEvent*)event;
+ (CGFloat)getWindowBottomBorder;
+ (void)openDocumentWithURL:(NSURL*)url;

@end

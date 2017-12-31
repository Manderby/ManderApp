// Entwickelt von Tobias Stamm, Manderim GmbH, http://manderim.ch

#include "MandConfiguration.h"
#include "MandMenuHelper.h"

#import <Cocoa/Cocoa.h>
#include "NASystem.h"


#define MAND_LINE_HEIGHT_POINTS 12
#define MAND_SCROLL_SPEED 0.15

@class MandAboutWindowController;
@class MandHelpWindowController;



typedef struct ModifierKeyState ModifierKeyState;
struct ModifierKeyState{
  NABool shift;
  NABool alt;
  NABool command;
  NABool control;
  NABool fn;
};



@interface MandApplication : NSApplication <NSApplicationDelegate> {
  IBOutlet NSMenu* menu;
  IBOutlet NSMenuItem* aboutMenuItem;
  IBOutlet NSMenuItem* helpMenuItem;
  IBOutlet MandAboutWindowController* aboutwindowcontroller;
  MandHelpWindowController* helpwindowcontroller;
  NSArray* aboutWindowNibObjects;
}

- (void)setHelpDocument:(NSURL*)url;

- (NSString*)applicationName;

+ (BOOL)loadNibNamed:(NSString*)nibName ifNotNil:(id)testObject owner:(id)owner topLevelObjects:(NSArray**)objects;
+ (NSCursor*)allocCursorFromBasename:(NSString*)basename pointX:(CGFloat)x pointY:(CGFloat)y;
+ (CGFloat)getUIScaleFactorForWindow:(NSWindow*)window;
+ (CGFloat)getScrollingDeltaX:(NSEvent*)event;
+ (CGFloat)getScrollingDeltaY:(NSEvent*)event;
+ (ModifierKeyState)makeModifierKeyState:(NSEvent*)event;
+ (CGFloat)getWindowBottomBorder;
+ (void)openDocumentWithURL:(NSURL*)url;

@end

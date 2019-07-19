
#include "MandMenuHelper.h"
#include "MandEnvironment.h"

#import <Cocoa/Cocoa.h>
#include "NABase.h"
#include "NAUI.h"


#define MAND_LINE_HEIGHT_POINTS 12
#define MAND_SCROLL_SPEED 0.15

@class MandAboutWindowController;




NAString* mandTranslate(NAInt id, ...);


@interface ManderApp : NSApplication <NSApplicationDelegate> {
  IBOutlet NSMenu* menu;
  const NAUTF8Char* desc;
  
  NAWindow* aboutWindow;
}

- (void)setApplicationDescription:(const NAUTF8Char*) desc;
- (void)alertNewVersion:(NAInt)infoTextId translatorGroup:(NAInt)translatorGroup;

+ (BOOL)loadNibNamed:(NSString*)nibName ifNotNil:(id)testObject owner:(id)owner topLevelObjects:(NSArray**)objects;
+ (NSCursor*)allocCursorFromBasename:(NSString*)basename pointX:(CGFloat)x pointY:(CGFloat)y;
+ (CGFloat)getUIScaleFactorForWindow:(NSWindow*)window;
+ (CGFloat)getScrollingDeltaX:(NSEvent*)event;
+ (CGFloat)getScrollingDeltaY:(NSEvent*)event;
+ (ModifierKeyState)makeModifierKeyState:(NSEvent*)event;

@end

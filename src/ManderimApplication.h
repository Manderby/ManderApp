// Entwickelt von Tobias Stamm, Manderim GmbH, http://manderim.ch


#import <Cocoa/Cocoa.h>
#include "NASystem.h"




@class ManderimAboutWindowController;
@class ManderimHelpWindowController;


@interface ManderimApplication : NSApplication <NSApplicationDelegate> {
  IBOutlet ManderimAboutWindowController* aboutwindowcontroller;
  NSArray* aboutWindowNibObjects;
  ManderimHelpWindowController* helpwindowcontroller;
}

// If there is a HTML help which shall be displayed for a specific menu item,
// set it with the setHelpDocument. Everything else will be taken care of.
- (void)setHelpDocument:(NSURL*)url forMenuItem:(NSMenuItem*)menuitem;

- (NSString*)applicationName;

+ (NSCursor*)allocCursorFromBasename:(NSString*)basename pointX:(CGFloat)x pointY:(CGFloat)y;
+ (CGFloat)getUIScaleFactorForWindow:(NSWindow*)window;
+ (CGFloat)getWindowBottomBorder;
+ (void)openDocumentWithURL:(NSURL*)url;

@end

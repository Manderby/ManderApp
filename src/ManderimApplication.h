// Entwickelt von Tobias Stamm, Manderim GmbH, http://manderim.ch


#import <Cocoa/Cocoa.h>
#include "NASystem.h"




@class ManderimAboutWindowController;


@interface ManderimApplication : NSApplication <NSApplicationDelegate> {
  ManderimAboutWindowController* aboutwindowcontroller;
  NSArray* aboutWindowNibObjects;
}

- (void)showAbout:(id)sender;

+ (NSCursor*)allocCursorFromBasename:(NSString*)basename pointX:(CGFloat)x pointY:(CGFloat)y;
+ (CGFloat)getUIScaleFactorForWindow:(NSWindow*)window;
+ (CGFloat)getWindowBottomBorder;
+ (void)openDocumentWithURL:(NSURL*)url;

@end

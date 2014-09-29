// Entwickelt von Tobias Stamm, Manderim GmbH, http://manderim.ch

#import <Cocoa/Cocoa.h>

@class ManderimAboutWindowController;


@interface ManderimApplication : NSApplication <NSApplicationDelegate> {
  IBOutlet ManderimAboutWindowController* aboutwindowcontroller;
  NSString* description;
}

- (id)initWithDescription:(NSString*)desc;
- (IBAction)showAbout:(id)sender;

+ (NSCursor*)allocCursorFromBasename:(NSString*)basename pointX:(double)x pointY:(double)y;
+ (CGFloat)getUIScaleFactorForWindow:(NSWindow*)window;
+ (CGFloat)getWindowBottomBorder;
+ (void)openDocumentWithURL:(NSURL*)url;

@end

// Entwickelt von Tobias Stamm, Manderim GmbH, http://manderim.ch

#include "ManderimApplicationConfiguration.h"

#import <Cocoa/Cocoa.h>
#include "NASystem.h"




@class ManderimAboutWindowController;
@class ManderimHelpWindowController;


@interface ManderimApplication : NSApplication <NSApplicationDelegate> {
  IBOutlet NSMenuItem* aboutMenuItem;
  IBOutlet NSMenuItem* helpMenuItem;
  IBOutlet ManderimAboutWindowController* aboutwindowcontroller;
  ManderimHelpWindowController* helpwindowcontroller;
  NSArray* aboutWindowNibObjects;
}

- (void)setHelpDocument:(NSURL*)url;

- (NSString*)applicationName;

+ (BOOL)loadNibNamed:(NSString*)nibName ifNotNil:(id)testObject owner:(id)owner topLevelObjects:(NSArray**)objects;
+ (NSCursor*)allocCursorFromBasename:(NSString*)basename pointX:(CGFloat)x pointY:(CGFloat)y;
+ (CGFloat)getUIScaleFactorForWindow:(NSWindow*)window;
+ (CGFloat)getWindowBottomBorder;
+ (void)openDocumentWithURL:(NSURL*)url;

+ (void)initUserDefault:(NSUserDefaults*) userdefaults key:(NSString*)key intValue:(NSInteger)value;
+ (void)initUserDefault:(NSUserDefaults*) userdefaults key:(NSString*)key doubleValue:(double)value;

@end

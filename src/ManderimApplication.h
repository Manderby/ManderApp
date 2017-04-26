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


// Sets an initial default value if the given key is zero.
+ (void)initUserDefaultBoolValue:(NABool)value forKey:(NSString*)key;
+ (void)initUserDefaultIntValue:(NSInteger)value forKey:(NSString*)key;
+ (void)initUserDefaultDoubleValue:(double)value forKey:(NSString*)key;

+ (void)setUserDefaultBoolValue:(NABool)value forKey:(NSString*)key;
+ (void)setUserDefaultIntValue:(NSInteger)value forKey:(NSString*)key;
+ (void)setUserDefaultDoubleValue:(double)value forKey:(NSString*)key;

+ (NABool)getUserDefaultBoolValueForKey:(NSString*)key;
+ (NAInt)getUserDefaultIntValueForKey:(NSString*)key;
+ (double)getUserDefaultDoubleValueForKey:(NSString*)key;

+ (NABool)toggleUserDefaultBoolValueForKey:(NSString*)key;


@end

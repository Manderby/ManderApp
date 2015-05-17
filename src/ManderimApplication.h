// Entwickelt von Tobias Stamm, Manderim GmbH, http://manderim.ch

//#define MANDERIM_APPLICATION_REGISTRATION

#import <Cocoa/Cocoa.h>
#include "NASystem.h"




typedef enum{
  MANDERIM_METADATA_PRICE,            // (NAInt*)
  MANDERIM_METADATA_COUNT
} ManderimMetaData;


#ifdef MANDERIM_APPLICATION_REGISTRATION
  #define MANDERIM_REGISTRATION_PAID 0x01  // Assumes the user has paid
  #define MANDERIM_REGISTRATION_OFFLINE_WARNING   0x02
#endif



@class ManderimAboutWindowController;


@interface ManderimApplication : NSApplication <NSApplicationDelegate> {
  IBOutlet ManderimAboutWindowController* aboutwindowcontroller;
  void* metadata[MANDERIM_METADATA_COUNT];

  #ifdef MANDERIM_APPLICATION_REGISTRATION
    NAInt registrationstate;
    NSMenuItem* registermenuitem;
    NSThread* registrationthread;
  #endif
}

- (void)setMetaData:(void*)newdata forIndex:(NSUInteger)index;
- (IBAction)showAbout:(id)sender;

+ (NSCursor*)allocCursorFromBasename:(NSString*)basename pointX:(CGFloat)x pointY:(CGFloat)y;
+ (CGFloat)getUIScaleFactorForWindow:(NSWindow*)window;
+ (CGFloat)getWindowBottomBorder;
+ (void)openDocumentWithURL:(NSURL*)url;

@end

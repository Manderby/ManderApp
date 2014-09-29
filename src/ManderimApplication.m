// Entwickelt von Tobias Stamm, Manderim GmbH, http://manderim.ch

#import "ManderimApplication.h"
#import "ManderimAboutWindowController.h"



@implementation ManderimApplication





- (id)initWithDescription:(NSString*)desc{
  self = [super init];
  description = desc;
  [self setDelegate:self];
  return self;
}


- (IBAction)showAbout:(id)sender{
  if(!aboutwindowcontroller){[NSBundle loadNibNamed:@"ManderimAboutWindow" owner:self];}
  [aboutwindowcontroller setDescription:description];
  [aboutwindowcontroller showDialog];
}





+ (NSCursor*)allocCursorFromBasename:(NSString*)basename pointX:(double)x pointY:(double)y{
  #if defined __MAC_10_7
    // Starting with MAC OS X, HIDPI allows to provide 2 Cursors in 1 TIFF
    // To make this work, you have to compile this code in XCode 4. The cursor
    // images must be present as 2 images with the names ???.png and ???@2x.png
    NSString* cursorsuffix = @"tiff";
  #else
    NSString* cursorsuffix = @"png";
  #endif
  NSURL* url = [[NSBundle mainBundle] URLForResource:basename withExtension:cursorsuffix];
  NSImage* cursorimage = [[[NSImage alloc] initWithContentsOfURL:url] autorelease];
  return [[NSCursor alloc] initWithImage:cursorimage hotSpot:NSMakePoint(x, y)];
}


+ (CGFloat) getUIScaleFactorForWindow:(NSWindow*)window{
  #ifdef NSAppKitVersionNumber10_7
    if(NSAppKitVersionNumber >= NSAppKitVersionNumber10_7){
      #if defined __MAC_10_7
        return [window backingScaleFactor];
      #endif
    }else{
      return [window userSpaceScaleFactor];
    }
  #else
    return [window userSpaceScaleFactor];
  #endif
}


+ (CGFloat)getWindowBottomBorder{
  CGFloat border = 22.f;    // This corresponds to the default bottom border
                            // thickness in recent OSX versions. There seems
                            // to be no other way of defining it with a
                            // constant
  return border;
}


+ (void)openDocumentWithURL:(NSURL*)url{
  if([[NSDocumentController sharedDocumentController] respondsToSelector:@selector(openDocumentWithContentsOfURL:display:completionHandler:)]){
    #if defined __MAC_10_7
      [[NSDocumentController sharedDocumentController] openDocumentWithContentsOfURL:url display:YES completionHandler:nil];
    #endif
  }else{
    [[NSDocumentController sharedDocumentController] openDocumentWithContentsOfURL:url display:YES error:nil];
  }
}

@end

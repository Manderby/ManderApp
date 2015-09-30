// Entwickelt von Tobias Stamm, Manderim GmbH, http://manderim.ch

#import "ManderimApplication.h"
#import "ManderimAboutWindowController.h"
#import "ManderimHelpWindowController.h"


@implementation ManderimApplication


- (id)init{
  self = [super init];
  [self setDelegate:self];
  return self;
}


- (void)applicationDidFinishLaunching:(NSNotification *)notification{
  NA_UNUSED(notification);

  aboutwindowcontroller = nil;
  aboutWindowNibObjects = nil;
  NSMenu* applicationmenu = [[[NSApp mainMenu] itemAtIndex:0] submenu];
  NSMenuItem* aboutmenuitem = [applicationmenu itemAtIndex:0];
  [aboutmenuitem setTarget:self];
  [aboutmenuitem setAction:@selector(showAbout:)];
  
  helpwindowcontroller = nil;
}


- (void)dealloc{
  [aboutwindowcontroller release];
  [aboutWindowNibObjects release];
  [helpwindowcontroller release];
  [super dealloc];
}



// Note: the sender is needed as these methods are used as an action.
- (void)showAbout:(id)sender{
  NA_UNUSED(sender);
  
  if(!aboutWindowNibObjects){
    if([[NSBundle mainBundle] respondsToSelector:@selector(loadNibNamed:owner:topLevelObjects:)]){
      #ifdef __MAC_10_8
        NSArray* topLevelObjects;
        if(!aboutwindowcontroller){
          BOOL success = [[NSBundle mainBundle] loadNibNamed:@"ManderimAboutWindow" owner:self topLevelObjects:&topLevelObjects];
          if(success){
            aboutWindowNibObjects = [[NSArray alloc] initWithArray:topLevelObjects];
          }else{
            return;
          }
        }
      
      #endif
    }else{
      #ifndef __MAC_10_8
        if(!aboutwindowcontroller){[NSBundle loadNibNamed:@"ManderimAboutWindow" owner:self];}
      #endif
    }
  }

  [aboutwindowcontroller showDialog];
}



- (void)setHelpDocument:(NSURL*)url forMenuItem:(NSMenuItem*)menuitem{
  if(!helpwindowcontroller){
    helpwindowcontroller = [[ManderimHelpWindowController alloc] init];
  }
  [helpwindowcontroller setBaseURL:url];

  [menuitem setTarget:self];
  [menuitem setAction:@selector(showHelp:)];
}



// Note: the sender is needed as these methods are used as an action.
- (void)showHelp:(id)sender{
  NA_UNUSED(sender);
  if(!helpwindowcontroller){return;}
  [helpwindowcontroller showDialog];
}



- (NSString*)applicationName{
  NSString* applicationname = [[NSBundle mainBundle] localizedStringForKey:@"CFBundleDisplayName" value:nil table:@"InfoPlist"];
  if(!applicationname){
    applicationname = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleDisplayName"];
  }
  return applicationname;
}


+ (NSCursor*)allocCursorFromBasename:(NSString*)basename pointX:(CGFloat)x pointY:(CGFloat)y{
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
      #ifdef __MAC_10_7
        return [window backingScaleFactor];
      #else
        return 1;
      #endif
    }else{
      #ifndef __MAC_10_7
        return [window userSpaceScaleFactor];
      #else
        return 1;
      #endif
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
      [[NSDocumentController sharedDocumentController] openDocumentWithContentsOfURL:url display:YES completionHandler:^(NSDocument *document, BOOL documentWasAlreadyOpen, NSError *error){
        NA_UNUSED(document);
        NA_UNUSED(documentWasAlreadyOpen);
        NA_UNUSED(error);
      }];
    #endif
  }else{
    [[NSDocumentController sharedDocumentController] openDocumentWithContentsOfURL:url display:YES error:nil];
  }
}



@end

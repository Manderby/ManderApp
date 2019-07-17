
#import "ManderApp.h"
#include "MandCocoaHelper.h"
#include "ManderAppTranslations.h"
#include "AboutWindow.h"



NAInt manderAppTranslatorGroup;



NSURL* urlForFile(const NAUTF8Char* basename, const NAUTF8Char* suffix, const NAUTF8Char* folder){
  return [[NSBundle mainBundle] URLForResource:[NSString stringWithUTF8String:basename] withExtension:[NSString stringWithUTF8String:suffix] subdirectory:[NSString stringWithUTF8String:folder]];
}



NAString* mandTranslate(NAInt id, ...){
  va_list argumentlist;
  va_start(argumentlist, id);
  const NAUTF8Char* keystring = MANDER_APP_TRANSLATE(id);
  NAString* finalstring = naNewStringWithArguments(keystring, argumentlist);  
  va_end(argumentlist);
  return finalstring;
}



@implementation ManderApp


- (id)init{
  self = [super init];
  [self setDelegate:self];
  return self;
}


- (void)applicationWillFinishLaunching:(NSNotification *)notification{
  NA_UNUSED(notification);

  manderAppTranslatorGroup = naRegisterTranslatorGroup();
  #include "ManderApp_eng.h"
  #include "ManderApp_deu.h"
}

- (void)applicationDidFinishLaunching:(NSNotification *)notification{
  NA_UNUSED(notification);

  aboutWindow = createAboutWindow();

  aboutWindowNibObjects = nil;
  NSMenu* applicationmenu = [[[NSApp mainMenu] itemAtIndex:0] submenu];
  NSMenuItem* aboutmenuitem = [applicationmenu itemAtIndex:0];
  [aboutmenuitem setTarget:self];
  [aboutmenuitem setAction:@selector(showAbout:)];
}


- (void)dealloc{
  [aboutWindowNibObjects release];
  [super dealloc];
}



// Note: the sender is needed as these methods are used as an action.
- (void)showAbout:(id)sender{
  NA_UNUSED(sender);
  mandSetAboutWindowDescription(desc);
  naShowWindow(aboutWindow);
}




- (void)setApplicationDescription:(const NAUTF8Char*) newdesc{
  desc = newdesc;
}



+ (BOOL)loadNibNamed:(NSString*)nibName ifNotNil:(id)testObject owner:(id)owner topLevelObjects:(NSArray**)objects{
  BOOL success = NO;
  if(!testObject){
    if([[NSBundle mainBundle] respondsToSelector:@selector(loadNibNamed:owner:topLevelObjects:)]){
      #ifdef __MAC_10_8
        NSArray* topLevelObjects;
        success = [[NSBundle mainBundle] loadNibNamed:nibName owner:owner topLevelObjects:&topLevelObjects];
        if(success){
          *objects = [[NSArray alloc] initWithArray:topLevelObjects];
        }
      #endif
    }else{
      [NSBundle loadNibNamed:nibName owner:owner];
      success = (testObject?YES:NO);
    }
  }
  return success;
}



+ (NSCursor*)allocCursorFromBasename:(NSString*)basename pointX:(CGFloat)x pointY:(CGFloat)y{
  #if defined __MAC_10_7
    // Starting with MAC OS X, HIDPI allows to provide 2 Cursors in 1 TIFF
    // To make this work, you have to compile this code in XCode 4 or higher.
    // The cursor images must be present as 2 images with the names ???.png and ???@2x.png
    NSString* cursorsuffix = @"tiff";
  #else
    NSString* cursorsuffix = @"png";
  #endif
  NSURL* url = [[NSBundle mainBundle] URLForResource:basename withExtension:cursorsuffix];
  NSImage* cursorimage = allocNSImageWithContentsOfUrl(url);
  NSCursor* cursor = [[NSCursor alloc] initWithImage:cursorimage hotSpot:NSMakePoint(x, y)];
  [cursorimage release];
  return cursor;
}



+ (CGFloat) getUIScaleFactorForWindow:(NSWindow*)window{
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
}



+ (CGFloat) getScrollingDeltaX:(NSEvent*)event{
  if(NSAppKitVersionNumber >= NSAppKitVersionNumber10_7){
    if([event hasPreciseScrollingDeltas]){
      return [event scrollingDeltaX];
    }
  }
  return [event deltaX] * MAND_LINE_HEIGHT_POINTS;
}



+ (CGFloat) getScrollingDeltaY:(NSEvent*)event{
  if(NSAppKitVersionNumber >= NSAppKitVersionNumber10_7){
    if([event hasPreciseScrollingDeltas]){
      return [event scrollingDeltaY];
    }
  }
  return [event deltaY] * MAND_LINE_HEIGHT_POINTS;
}



+ (ModifierKeyState)makeModifierKeyState:(NSEvent*)event{
  ModifierKeyState mks;
  mks.shift   = ([event modifierFlags] & NSShiftKeyMask)    ?NA_TRUE:NA_FALSE;
  mks.alt     = ([event modifierFlags] & NSAlternateKeyMask)?NA_TRUE:NA_FALSE;
  mks.command = ([event modifierFlags] & NSCommandKeyMask)  ?NA_TRUE:NA_FALSE;
  mks.control = ([event modifierFlags] & NSControlKeyMask)  ?NA_TRUE:NA_FALSE;
  mks.fn      = ([event modifierFlags] & NSFunctionKeyMask) ?NA_TRUE:NA_FALSE;
  return mks;
}



+ (CGFloat)getWindowBottomBorder{
  CGFloat border = 22.f;    // This corresponds to the default bottom border
                            // thickness in recent OSX versions. There seems
                            // to be no other way of defining it with a
                            // constant
  return border;
}



+ (void)openDocumentWithURL:(NSURL*)url{
  NSDocumentController* documentcontroller = [NSDocumentController sharedDocumentController];
  if([documentcontroller respondsToSelector:@selector(openDocumentWithContentsOfURL:display:completionHandler:)]){
    #if defined __MAC_10_7
      [documentcontroller openDocumentWithContentsOfURL:url display:YES completionHandler:^(NSDocument *document, BOOL documentWasAlreadyOpen, NSError *error){
        NA_UNUSED(document);
        NA_UNUSED(documentWasAlreadyOpen);
        NA_UNUSED(error);
      }];
    #endif
  }else{
    [documentcontroller openDocumentWithContentsOfURL:url display:YES error:nil];
  }
}


@end

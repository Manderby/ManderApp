// Entwickelt von Tobias Stamm, Manderim GmbH, http://manderim.ch

#import "ManderimApplication.h"
#import "ManderimAboutWindowController.h"
#include "NADateTime.h"


#ifdef MANDERIM_APPLICATION_REGISTRATION
  @interface ManderimApplication (_Private)
    - (void)showRegistration:(id)sender;
    - (void)checkRegistration:(id)obj;
  @end
  #define MANDERIM_OFFLINE_USES_TILL_WARNING 3
  #define MANDERIM_MAX_OFFLINE_USES 6
#endif


@implementation ManderimApplication


- (id)init{
  self = [super init];
  for(NAInt i=0; i<MANDERIM_METADATA_COUNT; i++){metadata[i] = nil;}
  [self setDelegate:self];
  return self;
}


- (void)setMetaData:(void*)newdata forIndex:(NSUInteger)index{
  metadata[index] = newdata;
}


- (void)applicationDidFinishLaunching:(NSNotification *)notification{
  NSMenu* applicationmenu = [[[NSApp mainMenu] itemAtIndex:0] submenu];
  NSMenuItem* aboutmenuitem = [applicationmenu itemAtIndex:0];
  [aboutmenuitem setTarget:self];
  [aboutmenuitem setAction:@selector(showAbout:)];
  
  #ifdef MANDERIM_APPLICATION_REGISTRATION
    registermenuitem = [[NSMenuItem alloc] initWithTitle:@"Registration & Updates" action:@selector(showRegistration:) keyEquivalent:@""];
    [registermenuitem setTarget:self];
    [applicationmenu insertItem:registermenuitem atIndex:[applicationmenu indexOfItem:aboutmenuitem] + 1];

    registrationstate = [[NSUserDefaults standardUserDefaults] integerForKey:@"RegistrationState"];
    registrationthread = [[NSThread alloc] initWithTarget:self selector:@selector(checkRegistration:) object:nil];
    [registrationthread start];
  #endif
}


- (void)dealloc{
  [aboutwindowcontroller release];
  #ifdef MANDERIM_APPLICATION_REGISTRATION
    [registermenuitem release];
    [registrationthread release];
  #endif
  [(id)metadata[MANDERIM_METADATA_DESCRIPTION] release];
  free(metadata[MANDERIM_METADATA_PRICE]);
  [super dealloc];
}



- (IBAction)showAbout:(id)sender{
  if(!aboutwindowcontroller){[NSBundle loadNibNamed:@"ManderimAboutWindow" owner:self];}
  [aboutwindowcontroller setDescription:metadata[MANDERIM_METADATA_DESCRIPTION]];
  [aboutwindowcontroller showDialog];
}



#ifdef MANDERIM_APPLICATION_REGISTRATION
  - (IBAction)showRegistration:(id)sender{
    printf("Here we are\n");
  }


  - (void)checkRegistration:(id)obj{
    if(!metadata[MANDERIM_METADATA_PRICE]){return;}
    if(*(NAInt*)(metadata[MANDERIM_METADATA_PRICE]) == 0){return;}
    
    NSAutoreleasePool* autoreleasepool = [[NSAutoreleasePool alloc] init];
    NABool mustshowwindow = NA_FALSE;
    NABool forceregister = NA_FALSE;
    NADateTime now = naMakeDateTimeNow();

    // First, get and correct the local settings if necessary
    int64 fusn = [[NSUserDefaults standardUserDefaults] integerForKey:@"FirstUncertainSecondNumber"];
    int64 lastokchecknum = [[NSUserDefaults standardUserDefaults] integerForKey:@"LastSuccessfulRegistrationCheck"];
    int64 lastbadchecknum = [[NSUserDefaults standardUserDefaults] integerForKey:@"LastUnsuccessfulRegistrationCheck"];
    int64 usessincelastsuccessfulcheck = [[NSUserDefaults standardUserDefaults] integerForKey:@"UsesSinceLastSuccessfulCheck"];

    NADateTime lastokcheckdate;
    if(lastokchecknum){
      if(lastokchecknum <= now.sisec){
        lastokcheckdate = naMakeDateTimeWithNALibSecondNumber(lastokchecknum);
      }else{
        mustshowwindow = NA_TRUE;
        forceregister = NA_TRUE;
        printf("You seem to have an invalid value in your settings. Let me check your registration...");
        lastokcheckdate = now;
      }
    }else{
      lastokcheckdate = now;
    }
    double okdiff = naGetDateTimeDiff(&now, &lastokcheckdate);

    NADateTime lastbadcheckdate;
    if(lastbadchecknum){
      if(lastbadchecknum < now.sisec){
        lastbadcheckdate = naMakeDateTimeWithNALibSecondNumber(lastbadchecknum);
      }else{
        mustshowwindow = NA_TRUE;
        forceregister = NA_TRUE;
        printf("You seem to have an invalid value in your settings. Let me check your registration...");
        lastbadcheckdate = now;
      }
    }else{
      lastbadcheckdate = now;
    }
    double baddiff = naGetDateTimeDiff(&now, &lastbadcheckdate);

    if(usessincelastsuccessfulcheck < 0){
      mustshowwindow = NA_TRUE;
      forceregister = NA_TRUE;
      printf("You seem to have an invalid value in your settings. Let me check your registration...");
      usessincelastsuccessfulcheck = 0;
    }
    if(usessincelastsuccessfulcheck >= MANDERIM_MAX_OFFLINE_USES){
      mustshowwindow = NA_TRUE;
      forceregister = NA_TRUE;
      printf("You can no longer use this application. Let me check your registration...");
      usessincelastsuccessfulcheck = 0;
    }
    usessincelastsuccessfulcheck++;
    
    if(fusn){
      NAInt correctconst = naGetLeapSecondCorrectionConstant(fusn);
      switch(correctconst){
      case NO_CORRECTION_NEEDED: break;
      case INVALID_UNCERTAIN_SECOND_NUMBER:
        mustshowwindow = NA_TRUE;
        forceregister = NA_TRUE;
        printf("You seem to have an invalid value in your settings. Let me check your registration...");
        break;
      case NEW_LIBRARY_IS_OLDER_THAN_BEFORE: break;
        // The user has downgraded the application. No valid method possible.
        mustshowwindow = NA_TRUE;
        forceregister = NA_TRUE;
        printf("You seem to have an invalid value in your settings. Let me check your registration...");
      default:
        naCorrectDateTimeForLeapSeconds(&lastokcheckdate, correctconst);
        naCorrectDateTimeForLeapSeconds(&lastbadcheckdate, correctconst);
        break;
      }
    }

    if(mustshowwindow){
//      [registrationwindow show];
    }

    NSURL* url;
    url = [NSURL URLWithString:@"http://localhost"];
    NSString* returnstring = [NSString stringWithContentsOfURL:url encoding:NSUTF8StringEncoding error:NULL];
    returnstring = nil;
    
    if(returnstring){
      usessincelastsuccessfulcheck = 0;
      lastokcheckdate = naMakeDateTimeNow();
    }else{
      if(forceregister){
        // If we force to register, there is no way around it.
        printf("Registration required. Please connect to the Internet and restart this application.");
      }else{
        if(usessincelastsuccessfulcheck <= MANDERIM_OFFLINE_USES_TILL_WARNING){
          // Just go along with it.
        }else{
          printf("You have not used this application while connected to the Internet lately.\nI must check your registration.\n\nYou can use this application %d more times without connecting to the Internet.", (MANDERIM_MAX_OFFLINE_USES - (int)usessincelastsuccessfulcheck) + 1);
        }
      }
    }
    
    [[NSUserDefaults standardUserDefaults] setInteger:lastokcheckdate.sisec forKey:@"LastSuccessfulRegistrationCheck"];
    [[NSUserDefaults standardUserDefaults] setInteger:lastbadcheckdate.sisec forKey:@"LastUnsuccessfulRegistrationCheck"];
    [[NSUserDefaults standardUserDefaults] setInteger:naGetFirstUncertainSecondNumber() forKey:@"FirstUncertainSecondNumber"];
    [[NSUserDefaults standardUserDefaults] setInteger:usessincelastsuccessfulcheck forKey:@"UsesSinceLastSuccessfulCheck"];

    [autoreleasepool release];
  }
#endif


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

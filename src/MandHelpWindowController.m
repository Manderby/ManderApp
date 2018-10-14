


#import "MandApplication.h"
#import "MandHelpWindowController.h"
#import "MandTranslation.h"


#define MAND_HELP_KEY        "MandHelp"



@implementation MandHelpWindowController

-(id)init{

  #if defined MAND_USES_WEB_HELP
    NSRect windowrect = NSMakeRect(100, 100, 800, 400);
    NSWindow* window = [[NSWindow alloc] initWithContentRect:windowrect styleMask:NSTitledWindowMask | NSClosableWindowMask | NSMiniaturizableWindowMask | NSResizableWindowMask backing:NSBackingStoreBuffered defer:YES];
    self = [super initWithWindow:window];

    // Set the window title
    NAString* helpstring = mandNewBundleString(MAND_TRANSLATION_COLLECTION, MAND_HELP_KEY);
    NAString* applicationname = [(MandApplication*)NSApp newApplicationNameString];
    NAString* applicationhelpstring = naNewStringWithFormat(naGetStringUTF8Pointer(helpstring), naGetStringUTF8Pointer(applicationname));
    [[self window] setTitle:[NSString stringWithUTF8String:naGetStringUTF8Pointer(applicationhelpstring)]];
    naDelete(applicationhelpstring);
    naDelete(applicationname);
    naDelete(helpstring);


    webview = [[WebView alloc] initWithFrame:[[[self window] contentView] frame] frameName:nil groupName:nil];
    [webview setAutoresizingMask:NSViewMinXMargin | NSViewWidthSizable | NSViewMaxXMargin | NSViewMinYMargin | NSViewHeightSizable | NSViewMaxYMargin];
    
    
    [[self window] setContentView:webview];
    
    return self;

  #else
  
    return [super init];
  
  #endif
  
}



- (void)dealloc{
  #if defined MAND_USES_WEB_HELP
    [webview release];
  #endif
  [baseurl release];
  [super dealloc];
}



- (void)showDialog{
  [[self window] makeKeyAndOrderFront:self];
}



- (void)setBaseURL:(NSURL*)url{
  #if defined MAND_USES_WEB_HELP
    baseurl = [url retain];
    [[webview mainFrame] loadRequest:[NSURLRequest requestWithURL:baseurl]];
  #else
    NA_UNUSED(url);
    #ifndef NDEBUG
      naError("setBaseURL", "Web Help viewer requires MAND_USES_WEB_HELP in MandConfiguration.h");
    #endif
  #endif
}

@end




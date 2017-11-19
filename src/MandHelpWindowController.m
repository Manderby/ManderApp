// Entwickelt von Tobias Stamm, Manderim GmbH, http://manderim.ch



#import "MandApplication.h"
#import "MandHelpWindowController.h"


#define MAND_HELP_KEY        @"MandHelp"



@implementation MandHelpWindowController

-(id)init{

  #if defined MAND_USES_WEB_HELP
    NSRect windowrect = NSMakeRect(100, 100, 800, 400);
    NSWindow* window = [[NSWindow alloc] initWithContentRect:windowrect styleMask:NSTitledWindowMask | NSClosableWindowMask | NSMiniaturizableWindowMask | NSResizableWindowMask backing:NSBackingStoreBuffered defer:YES];
    self = [super initWithWindow:window];

    // Set the window title
    NSString* helpstring = [[NSBundle mainBundle] localizedStringForKey:MAND_HELP_KEY value:nil table:@"MandApplication"];
    [[self window] setTitle:[NSString stringWithFormat:helpstring, [(MandApplication*)NSApp applicationName]]];



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




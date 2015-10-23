// Entwickelt von Tobias Stamm, Manderim GmbH, http://manderim.ch



#import "ManderimApplication.h"

#define MANDERIM_APPLICATION_HELP_KEY @"ManderimApplicationHelp"

#import "ManderimHelpWindowController.h"

@implementation ManderimHelpWindowController

-(id)init{

  #if defined MANDERIM_APPLICATION_USES_WEB_HELP
    NSRect windowrect = NSMakeRect(100, 100, 800, 400);
    NSWindow* window = [[NSWindow alloc] initWithContentRect:windowrect styleMask:NSTitledWindowMask | NSClosableWindowMask | NSMiniaturizableWindowMask | NSResizableWindowMask backing:NSBackingStoreBuffered defer:YES];
    self = [super initWithWindow:window];

    // Set the window title
    NSString* helpstring = [[NSBundle mainBundle] localizedStringForKey:MANDERIM_APPLICATION_HELP_KEY value:nil table:@"ManderimApplication"];
    [[self window] setTitle:[NSString stringWithFormat:helpstring, [(ManderimApplication*)NSApp applicationName]]];



    webview = [[WebView alloc] initWithFrame:[[[self window] contentView] frame] frameName:nil groupName:nil];
    [webview setAutoresizingMask:NSViewMinXMargin | NSViewWidthSizable | NSViewMaxXMargin | NSViewMinYMargin | NSViewHeightSizable | NSViewMaxYMargin];
    
    
    [[self window] setContentView:webview];
    
    return self;

  #else
  
    return [super init];
  
  #endif
  
}



- (void)dealloc{
  #if defined MANDERIM_APPLICATION_USES_WEB_HELP
    [webview release];
  #endif
  [baseurl release];
  [super dealloc];
}



- (void)showDialog{
  [[self window] makeKeyAndOrderFront:self];
}



- (void)setBaseURL:(NSURL*)url{
  #if defined MANDERIM_APPLICATION_USES_WEB_HELP
    baseurl = [url retain];
    [[webview mainFrame] loadRequest:[NSURLRequest requestWithURL:baseurl]];
  #else
    NA_UNUSED(url);
    #ifndef NDEBUG
      naError("setBaseURL", "Web Help viewer requires MANDERIM_APPLICATION_USES_WEB_HELP in ManderimApplicationConfiguration.h");
    #endif
  #endif
}

@end




// Entwickelt von Tobias Stamm, Manderim GmbH, http://manderim.ch



#define MANDERIM_APPLICATION_HELP_KEY @"ManderimApplicationHelp"

#import "ManderimHelpWindowController.h"
#import "ManderimApplication.h"


@implementation ManderimHelpWindowController

-(id)init{

  NSRect windowrect = NSMakeRect(100, 100, 400, 400);
  NSWindow* window = [[NSWindow alloc] initWithContentRect:windowrect styleMask:NSTitledWindowMask | NSClosableWindowMask | NSMiniaturizableWindowMask | NSResizableWindowMask backing:NSBackingStoreBuffered defer:YES];
  self = [super initWithWindow:window];

  // Set the window title
  NSString* helpstring = [[NSBundle mainBundle] localizedStringForKey:MANDERIM_APPLICATION_HELP_KEY value:nil table:@"ManderimApplication"];
  [[self window] setTitle:[NSString stringWithFormat:helpstring, [(ManderimApplication*)NSApp applicationName]]];



  webview = [[WebView alloc] initWithFrame:[[[self window] contentView] frame] frameName:nil groupName:nil];
  [webview setAutoresizingMask:NSViewMinXMargin | NSViewWidthSizable | NSViewMaxXMargin | NSViewMinYMargin | NSViewHeightSizable | NSViewMaxYMargin];
  
  
  [[self window] setContentView:webview];
  
  return self;
}



- (void)dealloc{
  [webview release];
  [baseurl release];
  [super dealloc];
}



- (void)showDialog{
  [[self window] makeKeyAndOrderFront:self];
}



- (void)setBaseURL:(NSURL*)url{
  baseurl = [url retain];
  [[webview mainFrame] loadRequest:[NSURLRequest requestWithURL:baseurl]];
}

@end

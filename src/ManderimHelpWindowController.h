// Entwickelt von Tobias Stamm, Manderim GmbH, http://manderim.ch


#import <Cocoa/Cocoa.h>
#import <WebKit/WebKit.h>


@interface ManderimHelpWindowController : NSWindowController <NSWindowDelegate>{
  NSURL* baseurl;
  WebView* webview;
}

- (id)init;
- (void)showDialog;
- (void)setBaseURL:(NSURL*)url;

@end

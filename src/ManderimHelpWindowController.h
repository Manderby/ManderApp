// Entwickelt von Tobias Stamm, Manderim GmbH, http://manderim.ch


#import "ManderimApplication.h"

#if defined MANDERIM_APPLICATION_USES_WEB_HELP
  #import <WebKit/WebKit.h>
#endif


@interface ManderimHelpWindowController : NSWindowController <NSWindowDelegate>{
  NSURL* baseurl;
  #if defined MANDERIM_APPLICATION_USES_WEB_HELP
    WebView* webview;
  #endif
}

- (id)init;
- (void)showDialog;
- (void)setBaseURL:(NSURL*)url;

@end



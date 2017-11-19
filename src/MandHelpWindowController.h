// Entwickelt von Tobias Stamm, Manderim GmbH, http://manderim.ch


#import "MandApplication.h"

#if defined MAND_USES_WEB_HELP
  #import <WebKit/WebKit.h>
#endif


@interface MandHelpWindowController : NSWindowController <NSWindowDelegate>{
  NSURL* baseurl;
  #if defined MAND_USES_WEB_HELP
    WebView* webview;
  #endif
}

- (id)init;
- (void)showDialog;
- (void)setBaseURL:(NSURL*)url;

@end



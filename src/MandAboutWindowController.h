
#import "ManderApp.h"

@interface MandAboutWindowController : NSWindowController {
  IBOutlet NSTextField* applicationnamefield;
  IBOutlet NSTextField* aboutdescription;
  IBOutlet NSTextField* version;
  IBOutlet NSTextField* websitelink;
  IBOutlet NSImageView* iconview;
  IBOutlet NSButton* donebutton;
}
- (void)showDialog;
- (void)setApplicationDescription:(const NAUTF8Char*) desc;

@end



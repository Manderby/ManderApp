
#import <Cocoa/Cocoa.h>
#include "NASystem.h"

@interface ManderimAboutWindowController : NSWindowController {
  IBOutlet NSTextField* applicationname;
  IBOutlet NSTextField* aboutdescription;
  IBOutlet NSTextField* version;
  IBOutlet NSTextField* websitelink;
  IBOutlet NSImageView* iconview;
}
- (void)showDialog;
- (IBAction)goToWebsite:(id)sender;

@end



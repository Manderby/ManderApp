
#import <Cocoa/Cocoa.h>


@interface ManderimAboutWindowController : NSWindowController {
  IBOutlet NSTextField* applicationname;
  IBOutlet NSTextField* aboutdescription;
  IBOutlet NSTextField* version;
  IBOutlet NSTextField* websitelink;
  IBOutlet NSImageView* iconview;
}
- (void)awakeFromNib;
- (void)setDescription:(NSString*)desc;
- (void)showDialog;
- (IBAction)goToWebsite:(id)sender;

@end



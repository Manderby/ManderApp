
#import "MandAboutWindowController.h"


#define MAND_ABOUT_KEY       @"MandAbout"
#define MAND_DONE_KEY        @"MandDone"
#define MAND_DESCRIPTION_KEY @"MandDescription"


@implementation MandAboutWindowController



- (void)awakeFromNib{

  NSURL* url;
  NSString* applicationname = [(MandApplication*)NSApp applicationName];
  NSString* iconfilename = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleIconFile"];
  NSString* iconbasename = [iconfilename stringByDeletingPathExtension];

  // Set the window title
  NSString* aboutstring = [[NSBundle mainBundle] localizedStringForKey:MAND_ABOUT_KEY value:nil table:@"MandApplication"];
  [[self window] setTitle:[NSString stringWithFormat:aboutstring, applicationname]];

  // Set the button text
  NSString* donestring = [[NSBundle mainBundle] localizedStringForKey:MAND_DONE_KEY value:nil table:@"MandApplication"];
  [donebutton setTitle:donestring];

  // Set the application icon
  url = [[NSBundle mainBundle] URLForResource:iconbasename withExtension:@"icns"];
  NSImage* iconimage = [[[NSImage alloc] initWithContentsOfURL:url] autorelease];
  [iconview setImage:iconimage];

  // Set the application name
  [applicationnamefield setStringValue:applicationname];

  // Set the version
  NSString* versionstring = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleShortVersionString"];
  NSString* buildstring = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleVersion"];
  [version setStringValue:[NSString stringWithFormat:@"Version %@ (Build %@)", versionstring, buildstring]];

  NSString* descriptionstring = [[NSBundle mainBundle] localizedStringForKey:MAND_DESCRIPTION_KEY value:nil table:nil];
  [aboutdescription setStringValue:descriptionstring];

  // Set the Link to Manderim
  
  // both are needed, otherwise hyperlink won't accept mousedown
  [websitelink setAllowsEditingTextAttributes: YES];
  [websitelink setSelectable: YES];

  NSMutableAttributedString* attrString = [[NSMutableAttributedString alloc] initWithString: @"http://manderim.ch"];
  NSRange range = NSMakeRange(0, [attrString length]);

  url = [NSURL URLWithString:@"http://manderim.ch"];
  [attrString beginEditing];
  [attrString addAttribute:NSLinkAttributeName value:[url absoluteString] range:range];
  [attrString addAttribute:NSUnderlineStyleAttributeName value:[NSNumber numberWithInt:NSUnderlineStyleSingle] range:range];
  [attrString addAttribute:NSForegroundColorAttributeName value:[NSColor blueColor] range:range];
  [attrString endEditing];

  [websitelink setAttributedStringValue: attrString];

  [attrString release];
}




- (void)showDialog{
  [[self window] makeKeyAndOrderFront:self];
}


@end






#import "ManderimAboutWindowController.h"


@implementation ManderimAboutWindowController


#define MANDERIM_APPLICATION_DESCRIPTION_KEY @"ManderimApplicationDescription"
#define MANDERIM_APPLICATION_ABOUT_KEY @"ManderimApplicationAbout"


- (void)awakeFromNib{

  NSURL* url;
  NSString* applicationstring = [[NSBundle mainBundle] localizedStringForKey:@"CFBundleDisplayName" value:nil table:@"InfoPlist"];
  if(!applicationstring){
    applicationstring = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleDisplayName"];
  }
  NSString* iconfilename = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleIconFile"];
  NSString* iconbasename = [iconfilename stringByDeletingPathExtension];
\
  // Set the application icon
  url = [[NSBundle mainBundle] URLForResource:iconbasename withExtension:@"icns"];
  NSImage* iconimage = [[[NSImage alloc] initWithContentsOfURL:url] autorelease];
  [iconview setImage:iconimage];

  // Set the window title
  NSString* aboutstring = [[NSBundle mainBundle] localizedStringForKey:MANDERIM_APPLICATION_ABOUT_KEY value:nil table:@"ManderimApplication"];
  [[self window] setTitle:[NSString stringWithFormat:@"%@ %@", aboutstring, applicationstring]];

  // Set the application name
  [applicationname setStringValue:applicationstring];

  // Set the version
  NSString* versionstring = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleShortVersionString"];
  NSString* buildstring = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleVersion"];
  [version setStringValue:[NSString stringWithFormat:@"Version %@ (Build %@)", versionstring, buildstring]];

  NSString* descriptionstring = [[NSBundle mainBundle] localizedStringForKey:MANDERIM_APPLICATION_DESCRIPTION_KEY value:nil table:nil];
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
  [attrString addAttribute:NSUnderlineStyleAttributeName value:[NSNumber numberWithInt:NSSingleUnderlineStyle] range:range];
  [attrString addAttribute:NSForegroundColorAttributeName value:[NSColor blueColor] range:range];
  [attrString endEditing];

  [websitelink setAttributedStringValue: attrString];

  [attrString release];
}




- (void)showDialog{
  [[self window] makeKeyAndOrderFront:self];
}


- (IBAction)goToWebsite:(id)sender{
  NA_UNUSED(sender);
  [[NSWorkspace sharedWorkspace] openURL:[NSURL URLWithString:@"http://manderim.ch"]];
}

@end





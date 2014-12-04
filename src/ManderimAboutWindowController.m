
#import "ManderimAboutWindowController.h"


@implementation ManderimAboutWindowController



- (void)awakeFromNib{

  NSURL* url;
  NSString* applicationstring = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleExecutable"];
  NSString* iconfilename = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleIconFile"];
  NSString* iconbasename = [iconfilename stringByDeletingPathExtension];

  // Set the application icon
  url = [[NSBundle mainBundle] URLForResource:iconbasename withExtension:@"icns"];
  NSImage* iconimage = [[[NSImage alloc] initWithContentsOfURL:url] autorelease];
  [iconview setImage:iconimage];

  // Set the window title
  [[self window] setTitle:[NSString stringWithFormat:@"%@%@", @"About ", applicationstring]];

  // Set the application name
  [applicationname setStringValue:applicationstring];

  // Set the version
  NSString* versionstring = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleShortVersionString"];
  NSString* buildstring = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleVersion"];
  [version setStringValue:[NSString stringWithFormat:@"Version %@ (Build %@)", versionstring, buildstring]];


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




- (void)setDescription:(NSString*)desc{
  if(desc){
    [aboutdescription setStringValue:desc];
  }else{
    [aboutdescription setStringValue:@""];
  }
}


- (void)showDialog{
  [[self window] makeKeyAndOrderFront:self];
}


- (IBAction)goToWebsite:(id)sender{
  [[NSWorkspace sharedWorkspace] openURL:[NSURL URLWithString:@"http://manderim.ch"]];
}

@end





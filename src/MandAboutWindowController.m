
#import "MandAboutWindowController.h"
#include "NAString.h"
#include "MandCocoaHelper.h"
#include "ManderAppTranslations.h"


#define MAND_BUNDLE_ICON_FILE_KEY @"CFBundleIconFile"
#define MAND_BUNDLE_VERSION_SHORT_KEY @"CFBundleShortVersionString"
#define MAND_BUNDLE_VERSION_KEY @"CFBundleVersion"

@implementation MandAboutWindowController

- (void)awakeFromNib{

  NSURL* url;
  NAString* applicationname = [(ManderApp*)NSApp newApplicationNameString];
  NSString* iconfilename = [[NSBundle mainBundle] objectForInfoDictionaryKey:MAND_BUNDLE_ICON_FILE_KEY];
  NSString* iconbasename = [iconfilename stringByDeletingPathExtension];

  // Set the window title
  NAString* naaboutstring = mandTranslate(MandAbout, naGetStringUTF8Pointer(applicationname));
  NSString* nsaboutstring = [NSString stringWithUTF8String:naGetStringUTF8Pointer(naaboutstring)];
  naDelete(naaboutstring);
  [[self window] setTitle:nsaboutstring];

  // Set the button text
  NAString* nadonestring = mandTranslate(MandDone);
  NSString* nsdonestring = [NSString stringWithUTF8String:naGetStringUTF8Pointer(nadonestring)];
  naDelete(nadonestring);
  [donebutton setTitle:nsdonestring];

  // Set the application icon
  url = [[NSBundle mainBundle] URLForResource:iconbasename withExtension:@"icns"];
  NSImage* iconimage = allocNSImageWithContentsOfUrl(url);
  [iconview setImage:iconimage];
  [iconimage release];

  // Set the application name
  naTellNSTextFieldSetStringValue(applicationnamefield, naGetStringUTF8Pointer(applicationname));

  // Set the version
  NSString* versionstring = [[NSBundle mainBundle] objectForInfoDictionaryKey:MAND_BUNDLE_VERSION_SHORT_KEY];
  NSString* buildstring = [[NSBundle mainBundle] objectForInfoDictionaryKey:MAND_BUNDLE_VERSION_KEY];
  NAString* versionbuildstring = mandTranslate(MandVersionBuild, [versionstring UTF8String], [buildstring UTF8String]);
  naTellNSTextFieldSetStringValue(version, naGetStringUTF8Pointer(versionbuildstring));
  naDelete(versionbuildstring);

  // Set the Link to the website
  
  // both are needed, otherwise hyperlink won't accept mousedown
  [websitelink setAllowsEditingTextAttributes: YES];
  [websitelink setSelectable: YES];

  NSMutableAttributedString* attrString = [[NSMutableAttributedString alloc] initWithString: @"http://manderc.com"];
  NSRange range = NSMakeRange(0, [attrString length]);

  url = [NSURL URLWithString:@"http://manderc.com"];
  [attrString beginEditing];
  [attrString addAttribute:NSLinkAttributeName value:[url absoluteString] range:range];
  [attrString addAttribute:NSUnderlineStyleAttributeName value:[NSNumber numberWithInt:NSUnderlineStyleSingle] range:range];
  [attrString addAttribute:NSForegroundColorAttributeName value:[NSColor blueColor] range:range];
  [attrString endEditing];

  [websitelink setAttributedStringValue: attrString];

  [attrString release];
  naDelete(applicationname);
}




- (void)showDialog{
  [[self window] makeKeyAndOrderFront:self];
}


- (void)setApplicationDescription:(const NAUTF8Char*) desc{
  naTellNSTextFieldSetStringValue(aboutdescription, desc);
}


@end





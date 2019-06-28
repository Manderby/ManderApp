
#import "MandAboutWindowController.h"
#include "MandTranslation.h"
#include "NAString.h"
#include "MandCocoaHelper.h"


#define MAND_ABOUT_KEY         "MandAbout"
#define MAND_DONE_KEY          "MandDone"
#define MAND_VERSION_BUILD_KEY "MandVersionBuild"

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
  NSString* aboutstring = mandTranslate(MAND_TRANSLATION_COLLECTION, MAND_ABOUT_KEY, naGetStringUTF8Pointer(applicationname));
  [[self window] setTitle:aboutstring];

  // Set the button text
  NSString* donestring = mandTranslate(MAND_TRANSLATION_COLLECTION, MAND_DONE_KEY);
  [donebutton setTitle:donestring];

  // Set the application icon
  url = [[NSBundle mainBundle] URLForResource:iconbasename withExtension:@"icns"];
  NSImage* iconimage = allocNSImageWithContentsOfUrl(url);
  [iconview setImage:iconimage];
  [iconimage release];

  // Set the application name
  naTellNSTextFieldSetStringValue(applicationnamefield, applicationname);

  // Set the version
  NSString* versionstring = [[NSBundle mainBundle] objectForInfoDictionaryKey:MAND_BUNDLE_VERSION_SHORT_KEY];
  NSString* buildstring = [[NSBundle mainBundle] objectForInfoDictionaryKey:MAND_BUNDLE_VERSION_KEY];
  NAString* transstring = mandNewBundleString(MAND_TRANSLATION_COLLECTION, MAND_VERSION_BUILD_KEY);
  NAString* versionbuildstring = naNewStringWithFormat(naGetStringUTF8Pointer(transstring), [versionstring UTF8String], [buildstring UTF8String]);
  naTellNSTextFieldSetStringValue(version, versionbuildstring);
  naDelete(versionbuildstring);
  naDelete(transstring);

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
  NAString* descstring = naNewStringWithFormat(desc);
  naTellNSTextFieldSetStringValue(aboutdescription, descstring);
  naDelete(descstring);
}


@end





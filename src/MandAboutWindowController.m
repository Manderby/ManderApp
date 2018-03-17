
#import "MandAboutWindowController.h"
#include "MandTranslation.h"
#include "NAString.h"


#define MAND_ABOUT_KEY         "MandAbout"
#define MAND_DONE_KEY          "MandDone"
#define MAND_DESCRIPTION_KEY   "MandDescription"
#define MAND_VERSION_BUILD_KEY "MandVersionBuild"

#define MAND_BUNDLE_ICON_FILE_KEY @"CFBundleIconFile"
#define MAND_BUNDLE_VERSION_SHORT_KEY @"CFBundleShortVersionString"
#define MAND_BUNDLE_VERSION_KEY @"CFBundleVersion"

@implementation MandAboutWindowController

- (void)awakeFromNib{

  NSURL* url;
  NAString* applicationname = [(MandApplication*)NSApp applicationName];
  NSString* iconfilename = [[NSBundle mainBundle] objectForInfoDictionaryKey:MAND_BUNDLE_ICON_FILE_KEY];
  NSString* iconbasename = [iconfilename stringByDeletingPathExtension];

  // Set the window title
  NAString* aboutstring = mandGetBundleString(MAND_TRANSLATION_COLLECTION, MAND_ABOUT_KEY);
  [[self window] setTitle:[NSString stringWithFormat:[NSString stringWithUTF8String:naGetStringUTF8Pointer(aboutstring)], naGetStringUTF8Pointer(applicationname)]];
  naDelete(aboutstring);

  // Set the button text
  NAString* donestring = mandGetBundleString(MAND_TRANSLATION_COLLECTION, MAND_DONE_KEY);
  [donebutton setTitle:[NSString stringWithUTF8String:naGetStringUTF8Pointer(donestring)]];
  naDelete(donestring);

  // Set the application icon
  url = [[NSBundle mainBundle] URLForResource:iconbasename withExtension:@"icns"];
  NSImage* iconimage = [[NSImage alloc] initWithContentsOfURL:url];
  [iconview setImage:iconimage];
  [iconimage release];

  // Set the application name
  [applicationnamefield setStringValue:[NSString stringWithUTF8String:naGetStringUTF8Pointer(applicationname)]];

  // Set the version
  NSString* versionstring = [[NSBundle mainBundle] objectForInfoDictionaryKey:MAND_BUNDLE_VERSION_SHORT_KEY];
  NSString* buildstring = [[NSBundle mainBundle] objectForInfoDictionaryKey:MAND_BUNDLE_VERSION_KEY];
  NAString* versionbuildstring = mandGetBundleString(MAND_TRANSLATION_COLLECTION, MAND_VERSION_BUILD_KEY);
  [version setStringValue:[NSString stringWithFormat:[NSString stringWithUTF8String:naGetStringUTF8Pointer(versionbuildstring)], versionstring, buildstring]];
  naDelete(versionbuildstring);

  NAString* descriptionstring = mandGetBundleString(NA_NULL, MAND_DESCRIPTION_KEY);
  [aboutdescription setStringValue:[NSString stringWithUTF8String:naGetStringUTF8Pointer(descriptionstring)]];
  naDelete(descriptionstring);

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


@end





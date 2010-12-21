//
//  GeMatAppDelegate.h
//  GeMat
//
//  Created by Eli Segal on 22/12/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GeMatAppDelegate : NSObject <UIApplicationDelegate> {
	
	IBOutlet UILabel *lblPhraseValue;
	IBOutlet UITextField *txtPhrase;
	
	UIWindow *window;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;

- (IBAction)showPhraseValue:(UITextField *)textField;
@end


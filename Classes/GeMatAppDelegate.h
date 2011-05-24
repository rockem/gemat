//
//  GeMatAppDelegate.h
//  GeMat
//
//  Created by Eli Segal on 22/12/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class GematViewController;

@interface GeMatAppDelegate : NSObject <UIApplicationDelegate> {
	
	GematViewController *gematViewController;
    UINavigationController *navController;
	UIWindow *window;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@end


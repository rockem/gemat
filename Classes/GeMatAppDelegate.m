//
//  GeMatAppDelegate.m
//  GeMat
//
//  Created by Eli Segal on 22/12/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "GeMatAppDelegate.h"
#import "GematViewController.h"

@interface GeMatAppDelegate() 
- (void)archivePhrases;
- (NSString *)pathInDocumentDirectory:(NSString *)fileName;
- (NSString *)phrasesArrayPath;
- (GematViewController *)createGematViewController;
- (NSMutableArray *)createPhrasesArray;
@end

@implementation GeMatAppDelegate
@synthesize window;

#pragma mark -
#pragma mark Application lifecycle

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
	gematViewController = [[GematViewController alloc] init];
	gematViewController = [self createGematViewController];
	UINavigationController *navigationBar = [[UINavigationController alloc] initWithRootViewController:gematViewController];
	
	window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen]  bounds]];
	[window setAutoresizesSubviews:YES];
	[window addSubview:[navigationBar view]];
	[self.window makeKeyAndVisible];
    
	return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
   [self archivePhrases];
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    /*
     Called as part of  transition from the background to the inactive state: here you can undo many of the changes made on entering the background.
     */
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}


- (void)applicationWillTerminate:(UIApplication *)application {
    [self archivePhrases];
}

- (void)archivePhrases {
	NSMutableArray *phrasesArray = [gematViewController phrases];
	[NSKeyedArchiver archiveRootObject:phrasesArray toFile:[self phrasesArrayPath]];
}


#pragma mark -
#pragma mark Memory management

- (void)applicationDidReceiveMemoryWarning:(UIApplication *)application {
    /*
     Free up as much memory as possible by purging cached data objects that can be recreated (or reloaded from disk) later.
     */
}

- (void)dealloc {
	[window release];
	[super dealloc];
}

- (GematViewController *)createGematViewController {
	GematViewController *viewController = [[GematViewController alloc] init];
	[viewController setPhrases:[self createPhrasesArray]];
	return viewController;
}

- (NSMutableArray *)createPhrasesArray {
	NSMutableArray *possessionArray = [NSKeyedUnarchiver unarchiveObjectWithFile:[self phrasesArrayPath]];
	if (!possessionArray) {
		possessionArray = [NSMutableArray array];
	}
	return possessionArray;
}

- (NSString *)phrasesArrayPath {	
	return [self pathInDocumentDirectory:@"Phrases.data"]; 
}

- (NSString *)pathInDocumentDirectory:(NSString *)fileName {	
	// Get list of document directories in sandbox 
	NSArray *documentDirectories =
		NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
	// Get one and only document directory from that list 
	NSString *documentDirectory = [documentDirectories objectAtIndex:0];
	// Append passed in file name to that directory, return it }
	return [documentDirectory stringByAppendingPathComponent:fileName];
}

@end

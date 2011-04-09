//
//  ParallelPhrasesViewController.h
//  GeMat
//
//  Created by Eli Segal on 3/3/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GematricCalc.h"

@interface ParallelPhrasesViewController : UITableViewController {
	GematricCalc *gematricCalc;
	
	NSMutableArray *matchingParallelPhrases;
	NSArray *allParallelPhrases;
	NSString *currentPhrase;
}

- (void)setPhraseAndMethod:(NSString*)newPhrase calcMethod:(enum eCalculationMethod)method;
@end

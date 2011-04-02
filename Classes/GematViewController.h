//
//  GematViewController.h
//  GeMat
//
//  Created by Eli Segal on 9/2/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class GematricCalc;
@class ParallelPhrasesViewController;

@interface GematViewController : UIViewController <UITableViewDelegate, UITableViewDataSource> {

	IBOutlet UILabel *lblPhraseValue;
	IBOutlet UISearchBar *txtPhrase;
	IBOutlet UISegmentedControl *scMethodSelector;
	IBOutlet UITableView *tblPhrases;
		
	GematricCalc *gematricCalc;
	NSMutableArray *phrases;
	ParallelPhrasesViewController *parallelPhrasesViewController;
}
@property(nonatomic, retain) NSMutableArray *phrases;
- (IBAction)setCalculationMethod:(UISegmentedControl *)methodSelector;

@end

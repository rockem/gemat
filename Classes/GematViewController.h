//
//  GematViewController.h
//  GeMat
//
//  Created by Eli Segal on 9/2/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class GematricCalc;

@interface GematViewController : UIViewController <UITableViewDelegate, UITableViewDataSource> {

	IBOutlet UILabel *lblPhraseValue;
	IBOutlet UISearchBar *txtPhrase;
	IBOutlet UISegmentedControl *scMethodSelector;
	IBOutlet UITableView *tblPhrases;
		
	GematricCalc *gematricCalc;
	NSMutableArray *savedPhrases;
}
@property(nonatomic, retain) NSMutableArray *savedPhrases;
- (IBAction)setCalculationMethod:(UISegmentedControl *)methodSelector;

@end

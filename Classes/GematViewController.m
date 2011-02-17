//
//  GematViewController.m
//  GeMat
//
//  Created by Eli Segal on 9/2/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "GematViewController.h"
#import "GematricCalc.h"


@interface GematViewController() 
- (void)updateSavedPhrasesValue;
@end

@implementation GematViewController
@synthesize savedPhrases;

/*- (id)init {
	return self;
}*/

// The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
/*- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    //self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    //if (self) {
        // Custom initialization.
    // }
    return [self init];
}*/


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	gematricCalc = [[GematricCalc alloc] init];
	self.savedPhrases = [[NSMutableArray alloc] init];
	[scMethodSelector setSelectedSegmentIndex:[scMethodSelector numberOfSegments] - 1];
	
	[super viewDidLoad];
	[[self view] setAutoresizesSubviews:YES];
	[[self view] setAutoresizingMask:UIViewAutoresizingFlexibleHeight];
}


/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations.
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
	[savedPhrases release];
	[gematricCalc release];
	[super dealloc];
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section {
	return [self.savedPhrases count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView
		 cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	
	static NSString *SimpleTableIdentifier = @"SimpleTableIdentifier";
	UITableViewCell *cell = [tableView
							 dequeueReusableCellWithIdentifier:SimpleTableIdentifier];
	if (cell == nil) {
		cell = [[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault
									  reuseIdentifier:SimpleTableIdentifier] autorelease];
		cell.textLabel.textAlignment = UITextAlignmentRight;
	}
	
	NSUInteger row = [indexPath row];
	NSString *currentPhrase = [savedPhrases objectAtIndex:row];
	int gematricValue = [gematricCalc getValueOf:currentPhrase];
	cell.textLabel.text = [NSString stringWithFormat:@"%@ = %i", currentPhrase, gematricValue];
	return cell;
	
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
	NSLog(@"Phrase entered:%@", [searchBar text]);
	[[self savedPhrases] insertObject:[[searchBar text] copy] atIndex:0];
	[self updateSavedPhrasesValue];
	[searchBar setText:@""];
	[searchBar resignFirstResponder];
	
}

- (void)updateSavedPhrasesValue {
	[tblPhrases performSelectorOnMainThread:@selector(reloadData) withObject:nil waitUntilDone:NO];
}

- (IBAction)setCalculationMethod:(UISegmentedControl *)methodSelector {
	NSInteger index = [methodSelector selectedSegmentIndex];
	NSLog(@"method %i was selected", index);
	[gematricCalc setCalculationMethod:index];
	[self updateSavedPhrasesValue];
}



@end

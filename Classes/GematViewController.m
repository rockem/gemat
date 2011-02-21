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
- (void)initNavigationBar;
- (void)updateSavedPhrasesValue;
- (void)enterEditingMode;
- (void)leaveEditingMode;
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
	[self initNavigationBar];
	
	[super viewDidLoad];
	[[self view] setAutoresizesSubviews:YES];
	[[self view] setAutoresizingMask:UIViewAutoresizingFlexibleHeight];
}

- (void)initNavigationBar {
	[[self navigationItem] setRightBarButtonItem:[self editButtonItem]];
	[[self navigationItem] setTitle:@"Gemat"];
}

- (void)setEditing:(BOOL)editing animated:(BOOL)animate {
	[super setEditing:editing animated:animate];
	if(editing) {
		[self enterEditingMode];
	} else {
		[self leaveEditingMode];
	}
}

- (void)enterEditingMode {
	[tblPhrases setEditing:YES animated:YES];
}

- (void)leaveEditingMode {
	[tblPhrases setEditing:NO animated:YES];
	[self updateSavedPhrasesValue];
}

- (void)tableView:(UITableView *)tableView 
commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
	if(editingStyle == UITableViewCellEditingStyleDelete) {
		[self.savedPhrases removeObjectAtIndex:[indexPath row]]; 
		[tblPhrases deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
	}
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

- (UITableViewCellEditingStyle)tableView:(UITableView *)aTableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
	if (self.editing == NO || !indexPath) return UITableViewCellEditingStyleNone;
	// Determine the editing style based on whether the cell is a placeholder for adding content or already
	// existing content. Existing content can be deleted.
	if (self.editing) {
		return UITableViewCellEditingStyleDelete;
	} else {
		return UITableViewCellEditingStyleNone;
	}
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

//
//  GematViewController.m
//  GeMat
//
//  Created by Eli Segal on 9/2/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "GematViewController.h"
#import "GematricCalc.h"
#import "ParallelPhrasesViewController.h"


@interface GematViewController()
- (void)initNavigationBar;
- (void)updatephrasesValue;
- (void)enterEditingMode;
- (void)leaveEditingMode;
- (UITableViewCell *)createPhraseCell: (UITableView *) tableView;
- (NSString*)getCellTextForIndex:(NSIndexPath *) indexPath;
- (void)updatePhrasesWith:(NSString*)newPhrase;
@end

@implementation GematViewController
@synthesize phrases;

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
	[self updatephrasesValue];
}

- (void)tableView:(UITableView *)tableView 
commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
	if(editingStyle == UITableViewCellEditingStyleDelete) {
		[self.phrases removeObjectAtIndex:[indexPath row]]; 
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
    [lblPhraseValue release];
    lblPhraseValue = nil;
    [txtPhrase release];
    txtPhrase = nil;
    [scMethodSelector release];
    scMethodSelector = nil;
    [tblPhrases release];
    tblPhrases = nil;
}

- (void)dealloc {
    NSLog(@"%@",[NSThread callStackSymbols]);
    [lblPhraseValue release];
    [txtPhrase release];
	[gematricCalc release];
    gematricCalc = nil;
    [parallelPhrasesViewController release];
    parallelPhrasesViewController = nil;
    [phrases release];
    phrases = nil;
	[super dealloc];
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section {
	return [self.phrases count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView
		 cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	
	UITableViewCell *cell = [self createPhraseCell: tableView];
	[[cell textLabel] setText:[self getCellTextForIndex:indexPath]];
	return cell;
}

- (UITableViewCell *)createPhraseCell: (UITableView *) tableView  {
	static NSString *SimpleTableIdentifier = @"SimpleTableIdentifier";
	UITableViewCell *cell = [tableView
							 dequeueReusableCellWithIdentifier:SimpleTableIdentifier];
	if (cell == nil) {
		cell = [[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault
									  reuseIdentifier:SimpleTableIdentifier] autorelease];
		cell.textLabel.textAlignment = UITextAlignmentRight;
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
	}
	return cell;
}

- (NSString*)getCellTextForIndex:(NSIndexPath *) indexPath {
    
	NSUInteger row = [indexPath row];
	NSString *currentPhrase = [phrases objectAtIndex:row];
    int gematricValue = [gematricCalc getValueOf:currentPhrase];
	return [NSString stringWithFormat:@"%@ = %i", currentPhrase, gematricValue];
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

- (void)tableView:(UITableView *)aTableView
	didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

	if (!parallelPhrasesViewController) { 
		parallelPhrasesViewController = [[ParallelPhrasesViewController alloc] init];
	}
	[parallelPhrasesViewController setPhraseAndMethod:[phrases objectAtIndex:[indexPath row]] calcMethod:[gematricCalc calculationMethod]];

	[[self navigationController] pushViewController:parallelPhrasesViewController animated:YES];
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
	NSLog(@"Phrase entered:%@", [searchBar text]);
	[self updatePhrasesWith:[searchBar text]];
	[self updatephrasesValue];
	[searchBar setText:@""];
	[searchBar resignFirstResponder];
}

- (void)updatePhrasesWith:(NSString*)newPhrase {
	[[self phrases] removeObject:newPhrase];
	[[self phrases] insertObject:[[newPhrase copy] autorelease] atIndex:0];
}

- (void)updatephrasesValue {
	[tblPhrases performSelectorOnMainThread:@selector(reloadData) withObject:nil waitUntilDone:NO];
}

- (IBAction)setCalculationMethod:(UISegmentedControl *)methodSelector {
	NSInteger index = [methodSelector selectedSegmentIndex];
	NSLog(@"method %i was selected", index);
	[gematricCalc setCalculationMethod:index];
	[self updatephrasesValue];
}



@end

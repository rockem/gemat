//
//  ParallelPhrasesViewController.m
//  GeMat
//
//  Created by Eli Segal on 3/3/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "ParallelPhrasesViewController.h"

@interface ParallelPhrasesViewController()
- (void)updateParallelPhrases;
- (NSArray*)createParallelPhrasesArray;
- (NSArray*)getAllPhrasesFrom:(NSString*)filePath;
- (UITableViewCell *)createPhraseCell: (UITableView *) tableView;
- (NSString*)getCellTextForIndex:(NSIndexPath *) indexPath;
@end

@implementation ParallelPhrasesViewController

#pragma mark -
#pragma mark Initialization

/*
- (id)initWithStyle:(UITableViewStyle)style {
    // Override initWithStyle: if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization.
    }
    return self;
}
*/

- (id)init {
	gematricCalc = [[GematricCalc alloc] init];	
	matchingParallelPhrases = [[NSMutableArray alloc] init];
	allParallelPhrases = [self createParallelPhrasesArray] ;
	return self;
}
#pragma mark -
#pragma mark View lifecycle


/*- (void)viewDidLoad {
	[super viewDidLoad];
	gematricCalc = [[GematricCalc alloc] init];	
	matchingParallelPhrases = [NSMutableArray array];
	allParallelPhrases = [self createParallelPhrasesArray];
}*/

- (NSArray*)createParallelPhrasesArray {
	NSString *filePath = [[NSBundle mainBundle] pathForResource:@"phrases" ofType:@"txt"];  
	return [self getAllPhrasesFrom:filePath];
}

- (NSArray*)getAllPhrasesFrom:(NSString*)filePath
{
	NSArray* phrasesArr = [[NSArray alloc] init];
	if(filePath) {
		NSString *myText = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil];
		if(myText) {
			[phrasesArr release];
			phrasesArr = [myText componentsSeparatedByString:@"\r\n"];
		}
	}
	[phrasesArr retain];
	return phrasesArr;
}
 
- (void)viewWillAppear:(BOOL)animated {
	[super viewWillAppear:animated];
	[[self navigationItem] setTitle:currentPhrase];
}

/*
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}
*/
/*
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
}
*/
/*
- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
}
*/
/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations.
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/


#pragma mark -
#pragma mark Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return [matchingParallelPhrases count];
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
	}
	return cell;
}

- (NSString*)getCellTextForIndex:(NSIndexPath *) indexPath {
	NSUInteger row = [indexPath row];
	return [matchingParallelPhrases objectAtIndex:row];
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/


/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source.
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }   
}
*/


/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/


/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark -
#pragma mark Table view delegate

/*
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Navigation logic may go here. Create and push another view controller.
    /*
    <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
    [self.navigationController pushViewController:detailViewController animated:YES];
    [detailViewController release];
    
}*/


#pragma mark -
#pragma mark Memory management

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Relinquish ownership any cached data, images, etc. that aren't in use.
}

- (void)viewDidUnload {
    // Relinquish ownership of anything that can be recreated in viewDidLoad or on demand.
    // For example: self.myOutlet = nil;
}

- (void)dealloc {
	[gematricCalc release];
	[allParallelPhrases release];
	[matchingParallelPhrases release];
	[currentPhrase release];
	[super dealloc];
}

- (void)setPhraseAndMethod:(NSString*)newPhrase calcMethod:(enum eCalculationMethod)method {
	currentPhrase = [newPhrase copy];
	NSLog(@"new phrase %s", currentPhrase);
	[gematricCalc setCalculationMethod:method];
	[self updateParallelPhrases];
	[[self tableView] reloadData];
	//[tblPhrases performSelectorOnMainThread:@selector(reloadData) withObject:nil waitUntilDone:NO];
}

- (void)updateParallelPhrases {
	[matchingParallelPhrases removeAllObjects];
	int selectedPhraseValue = [gematricCalc getValueOf:currentPhrase];
	for (id phrase in allParallelPhrases) {
		if([gematricCalc getValueOf:phrase] == selectedPhraseValue) {
			[matchingParallelPhrases addObject:phrase];
		}
	}
}	

	
@end


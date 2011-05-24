//
//  SmallMethodGematricCalc.m
//  GeMat
//
//  Created by Eli Segal on 16/4/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "SmallMethodGematricCalc.h"

@interface  SmallMethodGematricCalc()
- (int)sumOfNumberDigits:(int)number;
@end


@implementation SmallMethodGematricCalc
@synthesize phraseCalc;

- (id)initWithAnotherCalc:(GematricPhraseCalc*)phraseCalculator {
	[super init];
	[self setPhraseCalc:phraseCalculator];
	
	return self;
}

- (int)getValueOf:(NSString *)phrase {
	int phraseValue = [[self phraseCalc] getValueOf:phrase];
	while(phraseValue > 9) {
		phraseValue = [self sumOfNumberDigits:phraseValue];
	}
	return phraseValue;
}

- (int)sumOfNumberDigits:(int)number {
	int sum = 0;
	while(number > 0) {
		sum += number % 10;
		number = number / 10;
	}
	return sum;
}

- (void) dealloc {
	[super dealloc];
}



@end

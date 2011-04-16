//
//  GematricCalc.m
//  GeMat
//
//  Created by Eli Segal on 23/12/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "GematricCalc.h"
#import "RegularNumberGematricPhraseCalc.h"
#import "BigNumberGematricCalc.h"
#import "SmallMethodGematricCalc.h"
#import "MacroUtils.h"

@interface GematricCalc() 
- (NSDictionary*)createCalcTypeToPhraseCalcMap;
@end


@implementation GematricCalc
@synthesize calculationMethod;

- (id)init {
	[super init];
	calcTypeToPhraseCalc = [self createCalcTypeToPhraseCalcMap];
	return self;
}

- (NSDictionary*)createCalcTypeToPhraseCalcMap {
	NSMutableDictionary *phraseCalcs = [[NSMutableDictionary alloc] init];
	
	[phraseCalcs setObject:[[RegularNumberGematricPhraseCalc alloc] init] forKey:INTOBJ(Regular)];
	[phraseCalcs setObject:[[BigNumberGematricCalc alloc] init] forKey:INTOBJ(Big)];
	GematricPhraseCalc *regularPhraseCalc = [[RegularNumberGematricPhraseCalc alloc] init];
	[phraseCalcs setObject:[[SmallMethodGematricCalc alloc] initWithAnotherCalc:regularPhraseCalc] forKey:INTOBJ(Small)];
	
	return phraseCalcs;
}

- (id)initWithCalculationMethod:(enum eCalculationMethod)method {
	[self init];
	[self setCalculationMethod:method];
	return self;
}

- (void) dealloc {
	[calcTypeToPhraseCalc release];
	[super dealloc];
}

- (int)getValueOf:(NSString *)phrase {
	GematricPhraseCalc* calc = [calcTypeToPhraseCalc objectForKey:INTOBJ(calculationMethod)];
	return [calc getValueOf:phrase];
}

@end

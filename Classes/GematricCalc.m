//
//  GematricCalc.m
//  GeMat
//
//  Created by Eli Segal on 23/12/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "GematricCalc.h"
#import "RegularNumberGematricPhraseCalc.h"
#import "SmallMethodGematricCalc.h"
#import "MacroUtils.h"

@interface GematricCalc() 
- (void)createCalcTypeToPhraseCalcMap;
@end


@implementation GematricCalc
@synthesize calculationMethod;

- (id)init {
	[super init];
	[self createCalcTypeToPhraseCalcMap];
	return self;
}

- (void)createCalcTypeToPhraseCalcMap {
	calcTypeToPhraseCalc = [[NSMutableDictionary alloc] init];
    
    GematricPhraseCalc *regularCalc = [[RegularNumberGematricPhraseCalc alloc] init];
	[calcTypeToPhraseCalc setObject:regularCalc forKey:INTOBJ(Big)];
    
    GematricPhraseCalc *smallMethodCalc = [[SmallMethodGematricCalc alloc] initWithAnotherCalc:regularCalc];
	[calcTypeToPhraseCalc setObject:smallMethodCalc forKey:INTOBJ(Small)];
    [regularCalc release];
    [smallMethodCalc release];
}

- (id)initWithCalculationMethod:(enum eCalculationMethod)method {
	[self init];
	[self setCalculationMethod:method];
	return self;
}

- (void) dealloc {
    [calcTypeToPhraseCalc release];
    calcTypeToPhraseCalc = nil;
	[super dealloc];
}

- (int)getValueOf:(NSString *)phrase {
	GematricPhraseCalc* calc = [calcTypeToPhraseCalc objectForKey:INTOBJ(calculationMethod)];
	return [calc getValueOf:phrase];
}

@end

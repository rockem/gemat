//
//  GimatricCalcTestCase.m
//  GeMat
//
//  Created by Eli Segal on 23/12/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <SenTestingKit/SenTestingKit.h>
#import <UIKit/UIKit.h>
#import "GematricCalc.h"

@interface GematricCalcTests : SenTestCase {
	GematricCalc *gematricCalc;
}

@end


@implementation GematricCalcTests

- (void) setUp {
	gematricCalc = [[GematricCalc new] retain];
	STAssertNotNil(gematricCalc, @"Cannot create GematricCalc instance");
}

- (void) tearDown {
	[gematricCalc release];
}


- (void) testShouldRetrieveValueOfAWordDVASH {
	int result = [gematricCalc getValueOf:@"דבש"];
	STAssertTrue(result == 306, @"Wrong value");
}

- (void) testShouldRetrieveValueOfAWordSHALOM {
	int result = [gematricCalc getValueOf:@"שלום"];
	STAssertTrue(result == 376, @"Wrong value");
}


@end

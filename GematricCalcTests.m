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
	gematricCalc = [[GematricCalc alloc] initWithCalculationMethod:Big];
	STAssertNotNil(gematricCalc, @"Cannot create GematricCalc instance");
}

- (void) tearDown {
	[gematricCalc release];
}

- (void) testShouldRetrieveValueOfAWordDVASH {
	int result = [gematricCalc getValueOf:@"דבש"];
	STAssertEquals(306, result, @"");
}

- (void) testShouldRetrieveValueOfAWordSHALOM {
	int result = [gematricCalc getValueOf:@"שלום"];
	STAssertEquals(376, result, @"");
}

- (void) testShouldRetrieveValueOfASentense {
	int result = [gematricCalc getValueOf:@"שבת שלום"];
	STAssertEquals(1078, result, @"");
}

/*- (void) testShouldRetrieveValueInBigMethod {
	[gematricCalc setCalculationMethod:Big];
	STAssertEquals(936, [gematricCalc getValueOf:@"שלום"], @"Should be 936");
}*/

- (void)testShouldRetrieveCalculationMethod {
	STAssertEquals(Big, [gematricCalc calculationMethod], @"");
}

- (void)testShouldRetrieveValueUsingSmallMethod {
	[gematricCalc setCalculationMethod:Small];
	STAssertEquals(7, [gematricCalc getValueOf:@"שלום"], @"Should be 7");
}

@end

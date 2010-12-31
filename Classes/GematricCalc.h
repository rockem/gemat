//
//  GematricCalc.h
//  GeMat
//
//  Created by Eli Segal on 23/12/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface GematricCalc : NSObject {
	enum eCalculationMethod {Regular = 2, Big = 1, Small = 0} calculationMethod;
	
	NSMutableDictionary *gematricDictionary;

}
@property (nonatomic) enum eCalculationMethod calulationMethod;

- (id)initWithCalculationMethod:(enum eCalculationMethod)method;
- (int)getValueOf:(NSString *)phrase;
- (void)setCalculationMethod:(enum eCalculationMethod)method;

@end

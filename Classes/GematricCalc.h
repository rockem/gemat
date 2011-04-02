//
//  GematricCalc.h
//  GeMat
//
//  Created by Eli Segal on 23/12/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface GematricCalc : NSObject {
	enum eCalculationMethod {Regular = 1, Big = 0} calculationMethod;
	
	NSMutableDictionary *gematricDictionary;

}
@property (nonatomic) enum eCalculationMethod calculationMethod;

- (id)initWithCalculationMethod:(enum eCalculationMethod)method;
- (int)getValueOf:(NSString *)phrase;

@end

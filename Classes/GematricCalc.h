//
//  GematricCalc.h
//  GeMat
//
//  Created by Eli Segal on 23/12/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface GematricCalc : NSObject {
	NSMutableDictionary *gematricDictionary;
}

- (int)getValueOf:(NSString *)phrase;

@end

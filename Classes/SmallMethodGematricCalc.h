//
//  SmallMethodGematricCalc.h
//  GeMat
//
//  Created by Eli Segal on 16/4/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GematricPhraseCalc.h"

@interface SmallMethodGematricCalc : GematricPhraseCalc {

	GematricPhraseCalc* phraseCalc;
}
@property (nonatomic, retain) GematricPhraseCalc* phraseCalc;

- (id)initWithAnotherCalc:(GematricPhraseCalc*)phraseCalculator;

@end

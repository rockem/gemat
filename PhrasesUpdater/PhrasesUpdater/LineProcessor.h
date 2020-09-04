//
//  LineProcessor.h
//  PhrasesUpdater
//
//  Created by Eli Segal on 10/12/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol LineProcessor <NSObject>

- (NSString*)process:(NSString*)line;

@end

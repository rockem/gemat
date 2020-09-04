//
//  GematricLineProcessor.h
//  PhrasesUpdater
//
//  Created by Eli Segal on 19/12/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LineProcessor.h"

@interface GematricLineProcessor : NSObject <LineProcessor> {
    
}

- (NSString*)process:(NSString*)line;


@end

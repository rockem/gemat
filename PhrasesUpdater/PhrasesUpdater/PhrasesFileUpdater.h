//
//  PhrasesFileUpdater.h
//  PhrasesUpdater
//
//  Created by Eli Segal on 29/11/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PhrasesFileUpdater : NSObject {

    NSString* filePath;
}

- (id)initWithFilePath:(NSString*)filePath;
- (void)updateValuesIn;
@end

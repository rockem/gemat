//
//  FileProcessor.h
//  PhrasesUpdater
//
//  Created by Eli Segal on 8/12/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LineProcessor.h"

@interface FileProcessor : NSObject {
    
    NSString *m_filePath;
}


- (id)initWithFilePath:(NSString*)filePath;
- (void)processWith:(id<LineProcessor>)processor;
@end





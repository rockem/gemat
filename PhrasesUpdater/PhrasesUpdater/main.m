//
//  main.m
//  PhrasesUpdater
//
//  Created by Eli Segal on 18/6/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PhrasesFileUpdater.h"

int main (int argc, const char * argv[])
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    
    NSString *filePath = @"phrases.txt";
    PhrasesFileUpdater *vi = [[[PhrasesFileUpdater alloc] initWithFilePath:filePath] autorelease];
    [vi updateValuesIn];
    NSLog(@"Processing %@", filePath);
    
    [pool drain]; 

    return 0;
}


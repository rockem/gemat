//
//  FileProcessor.m
//  PhrasesUpdater
//
//  Created by Eli Segal on 8/12/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "FileProcessor.h"

@interface FileProcessor() 
- (NSArray*)getPhrasesFromFile;
- (void)truncateFile;
@end

@implementation FileProcessor


- (id)initWithFilePath:(NSString*)filePath {
    m_filePath = [filePath copy];    
    
    return self;
}

- (void)processWith:(id<LineProcessor>)processor {
    NSArray* fileLines = [self getPhrasesFromFile];
    NSMutableArray* processedLines = [[NSMutableArray alloc] init];
    for(id line in fileLines) {
        NSString* pLine = [processor process:line];
        [processedLines addObject:pLine];
    }
    [self truncateFile];
    [[processedLines componentsJoinedByString:@"\n"] writeToFile:m_filePath atomically:YES encoding:NSStringEncodingConversionAllowLossy error:nil];
}

- (NSArray*)getPhrasesFromFile {
    NSString* fileContents = [NSString stringWithContentsOfFile:m_filePath encoding:NSUTF8StringEncoding error:nil];
    return [fileContents componentsSeparatedByCharactersInSet:[NSCharacterSet newlineCharacterSet]];
}

- (void)truncateFile {
    NSFileHandle *file = [NSFileHandle fileHandleForUpdatingAtPath: m_filePath];
    
    if (file == nil)
        NSLog(@"Failed to open file");
    
    [file truncateFileAtOffset: 0];
    
    [file closeFile];
}

@end

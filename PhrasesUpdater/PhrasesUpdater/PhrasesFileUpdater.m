//
//  PhrasesFileUpdater.m
//  PhrasesUpdater
//
//  Created by Eli Segal on 29/11/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "PhrasesFileUpdater.h"

@interface PhrasesFileUpdater() 
- (NSArray*)getPhrasesFromFile;
- (NSArray*)createLinesWithUpdatedValuesFrom:(NSArray*)phrases;
- (void)doBackupOfOldFile;
- (void)writePhrasesToFile:(NSArray*)lines;
@end

@implementation PhrasesFileUpdater


- (id)initWithFilePath:(NSString*)filePath {
    [super init];
    
    return self;
}

- (void)updateValuesIn {
    NSArray* phrases = [self getPhrasesFromFile];
    NSArray* phrasesWithUpdatedValues = [self createLinesWithUpdatedValuesFrom:phrases];
    [self doBackupOfOldFile];
    [self writePhrasesToFile:phrasesWithUpdatedValues];
}

- (NSArray*)getPhrasesFromFile {
    NSString* fileContents = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil];
    NSArray* allLinedStrings = 
    [fileContents componentsSeparatedByCharactersInSet:
     [NSCharacterSet newlineCharacterSet]];

    

}

- (NSArray*)createLinesWithUpdatedValuesFrom:(NSArray*)phrases {
    
}

- (void)doBackupOfOldFile {
    
}

- (void)writePhrasesToFile:(NSArray*)lines {
    
}

@end

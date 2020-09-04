#import <SenTestingKit/SenTestingKit.h>
#import <OCMock/OCMock.h>
#import "FileProcessor.h"
#import "LineProcessor.h"

@interface FileProcessorTest : SenTestCase {
    
    id m_lineProcessorMock;
    NSArray* m_fileLines;
    NSArray* m_processedLines;
    FileProcessor* fileProcessor;
}
@end


@implementation FileProcessorTest

static NSString * const k_FileName = @"file.txt";

- (void)setUp
{
    m_lineProcessorMock = [OCMockObject mockForProtocol: @protocol(LineProcessor)];
    m_processedLines = [NSArray arrayWithObjects:@"P_Line1", @"PP_Line2", @"PPPP_Line3", nil];
    m_fileLines = [NSArray arrayWithObjects:@"Line1", @"Line2", @"Line3", nil];
    [[m_fileLines componentsJoinedByString:@"\n"] writeToFile:k_FileName atomically:YES encoding:NSStringEncodingConversionAllowLossy error:nil];
    for(int i = 0; i < [m_fileLines count]; ++i) {
        [[[m_lineProcessorMock stub] andReturn:[m_processedLines objectAtIndex:i]] process:[m_fileLines objectAtIndex:i]];
    }
    fileProcessor = [[FileProcessor alloc] initWithFilePath:k_FileName];
}

- (void)tearDown
{
    NSFileManager *fileMgr = [NSFileManager defaultManager];
    [fileMgr removeItemAtPath:k_FileName error:nil];
}

- (void)testShouldChangedFileLinesWithLinesFromProcessor {
    [fileProcessor processWith:m_lineProcessorMock];
    NSString* fileContents = [NSString stringWithContentsOfFile:k_FileName encoding:NSUTF8StringEncoding error:nil];
    NSArray* allLinedStrings = [fileContents componentsSeparatedByCharactersInSet:[NSCharacterSet newlineCharacterSet]];
    
    for(int i = 0; i < [m_fileLines count]; ++i) {
        STAssertEqualObjects([m_processedLines objectAtIndex:i], [allLinedStrings objectAtIndex:i], @"Processed line and file line should the same");
    }
    
}

@end

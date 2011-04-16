//
//  BigNumberGematricCalc.m
//  GeMat
//
//  Created by Eli Segal on 16/4/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "BigNumberGematricCalc.h"
#import "MacroUtils.h"

@interface BigNumberGematricCalc()
- (NSDictionary*) createGematricDictionaryForBigNumber;
@end

@implementation BigNumberGematricCalc

- (id)init {
	[super init];
	gematricDictionary = [self createGematricDictionaryForBigNumber];
	return self;
}

- (NSDictionary*) createGematricDictionaryForBigNumber {
	NSMutableDictionary *dictionary  = [[NSMutableDictionary alloc] init];
	[dictionary setObject: INTOBJ(1) forKey: @"א"]; 
	[dictionary setObject: INTOBJ(2) forKey: @"ב"]; 
	[dictionary setObject: INTOBJ(3) forKey: @"ג"]; 
	[dictionary setObject: INTOBJ(4) forKey: @"ד"]; 
	[dictionary setObject: INTOBJ(5) forKey: @"ה"]; 
	[dictionary setObject: INTOBJ(6) forKey: @"ו"]; 
	[dictionary setObject: INTOBJ(7) forKey: @"ז"]; 
	[dictionary setObject: INTOBJ(8) forKey: @"ח"]; 
	[dictionary setObject: INTOBJ(9) forKey: @"ט"]; 
	[dictionary setObject: INTOBJ(10) forKey: @"י"]; 
	[dictionary setObject: INTOBJ(20) forKey: @"כ"]; 
	[dictionary setObject: INTOBJ(30) forKey: @"ל"]; 
	[dictionary setObject: INTOBJ(40) forKey: @"מ"]; 
	[dictionary setObject: INTOBJ(50) forKey: @"נ"]; 
	[dictionary setObject: INTOBJ(60) forKey: @"ס"]; 
	[dictionary setObject: INTOBJ(70) forKey: @"ע"]; 
	[dictionary setObject: INTOBJ(80) forKey: @"פ"]; 
	[dictionary setObject: INTOBJ(90) forKey: @"צ"]; 
	[dictionary setObject: INTOBJ(100) forKey: @"ק"]; 
	[dictionary setObject: INTOBJ(200) forKey: @"ר"]; 
	[dictionary setObject: INTOBJ(300) forKey: @"ש"]; 
	[dictionary setObject: INTOBJ(400) forKey: @"ת"]; 
	[dictionary setObject: INTOBJ(500) forKey: @"ך"]; 
	[dictionary setObject: INTOBJ(600) forKey: @"ם"]; 
	[dictionary setObject: INTOBJ(700) forKey: @"ן"]; 
	[dictionary setObject: INTOBJ(800) forKey: @"ף"]; 
	[dictionary setObject: INTOBJ(900) forKey: @"ץ"]; 
	return dictionary;
}

- (int)getValueOf:(NSString *)phrase {
	int result = 0;
	int i, size = [phrase length];
	for (i = 0; i < size; i = i + 1) {
		unichar c = [phrase characterAtIndex: i];
		result = result + [[gematricDictionary objectForKey: UNISTR(c)] intValue];
	}
	return result;
}

- (void) dealloc {
	[gematricDictionary release];
	[super dealloc];
}

@end

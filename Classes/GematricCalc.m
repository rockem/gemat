//
//  GematricCalc.m
//  GeMat
//
//  Created by Eli Segal on 23/12/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "GematricCalc.h"

#define INTOBJ(v) [NSNumber numberWithInteger: v]
#define UNISTR(v) [NSString stringWithFormat: @"%C", v]

@interface GematricCalc()
	- (void) initGematricDictionary;
@end

@implementation GematricCalc

- (id) init {
	[super init];
	[self initGematricDictionary];
	return self;
}

- (void) initGematricDictionary {
	gematricDictionary = [[NSMutableDictionary dictionary] retain];
	[gematricDictionary setObject: INTOBJ(1) forKey: @"א"]; 
	[gematricDictionary setObject: INTOBJ(2) forKey: @"ב"]; 
	[gematricDictionary setObject: INTOBJ(3) forKey: @"ג"]; 
	[gematricDictionary setObject: INTOBJ(4) forKey: @"ד"]; 
	[gematricDictionary setObject: INTOBJ(5) forKey: @"ה"]; 
	[gematricDictionary setObject: INTOBJ(6) forKey: @"ו"]; 
	[gematricDictionary setObject: INTOBJ(7) forKey: @"ז"]; 
	[gematricDictionary setObject: INTOBJ(8) forKey: @"ח"]; 
	[gematricDictionary setObject: INTOBJ(9) forKey: @"ט"]; 
	[gematricDictionary setObject: INTOBJ(10) forKey: @"י"]; 
	[gematricDictionary setObject: INTOBJ(20) forKey: @"כ"]; 
	[gematricDictionary setObject: INTOBJ(30) forKey: @"ל"]; 
	[gematricDictionary setObject: INTOBJ(40) forKey: @"מ"]; 
	[gematricDictionary setObject: INTOBJ(50) forKey: @"נ"]; 
	[gematricDictionary setObject: INTOBJ(60) forKey: @"ס"]; 
	[gematricDictionary setObject: INTOBJ(70) forKey: @"ע"]; 
	[gematricDictionary setObject: INTOBJ(80) forKey: @"פ"]; 
	[gematricDictionary setObject: INTOBJ(90) forKey: @"צ"]; 
	[gematricDictionary setObject: INTOBJ(100) forKey: @"ק"]; 
	[gematricDictionary setObject: INTOBJ(200) forKey: @"ר"]; 
	[gematricDictionary setObject: INTOBJ(300) forKey: @"ש"]; 
	[gematricDictionary setObject: INTOBJ(400) forKey: @"ת"]; 
	[gematricDictionary setObject: INTOBJ(20) forKey: @"ך"]; 
	[gematricDictionary setObject: INTOBJ(40) forKey: @"ם"]; 
	[gematricDictionary setObject: INTOBJ(50) forKey: @"ן"]; 
	[gematricDictionary setObject: INTOBJ(80) forKey: @"ף"]; 
	[gematricDictionary setObject: INTOBJ(90) forKey: @"ץ"]; 
}

- (void) dealloc {
	[gematricDictionary release];
	[super dealloc];
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

@end

//
//  Symbol.m
//  iNigma
//
//  Created by Francisco Padilla on 3/17/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Symbol.h"

@implementation Symbol

@synthesize character;
@synthesize index;
@synthesize enabled;

static NSString *alphabet;

+(NSString*) alphabet
{
	if (alphabet == nil) {
		alphabet = @"ATCG";
		[alphabet autorelease];
	}
	return alphabet;                   
}

-(id) initWithCharacter:(unichar)aCharacter
{
	[ super init];
	self.character = aCharacter;
	self.index = 0;
	enabled = TRUE;
	return self;
}

+(Symbol*) simbolWithCharacter:(unichar) aCharacter
{
	return [[[Symbol alloc] initWithCharacter: aCharacter] autorelease];
}

+(NSMutableArray*)symbolArrayFromString:(NSString*) string
{
	NSMutableArray* symbolArray = [[NSMutableArray alloc] initWithCapacity:[string length]];
	
	[symbolArray autorelease];
	if ( string != nil ){
		for (int i=0; i < [string length]; i++) {
			[symbolArray addObject:[[Symbol alloc] initWithCharacter:[string characterAtIndex:i] ] ];
		}
	}
	
	return symbolArray;
}

// DEPRECATED:
-(NSString*) frameName
{
	NSString *str = [NSString stringWithFormat:@"%C%@.png", character, (enabled ? @"" : @"-disabled") ];
	return str;
}

-(NSString*) selectedFrameName
{
	return [NSString stringWithFormat:@"%C-selected.png", character ];
}

+(Symbol*)randomSymbol
{
	NSString *alpha = [self alphabet];
		//NSString alpha2 = [ alpha stringByAppendingFormat:
	int i = ([alpha length] -1 )*myRandom() ;
	unichar newCharacter = [alpha characterAtIndex:i	];
	Symbol *symbol =  [[Symbol alloc ] initWithCharacter: newCharacter];
	[ symbol autorelease];
	return symbol;
}

Symbol *empty;

+(Symbol*)emptySymbol
{
	if (empty == nil) {
		empty =  [[Symbol alloc ] initWithCharacter: '_'];
		[ empty retain];
	}

	return empty;
}
@end

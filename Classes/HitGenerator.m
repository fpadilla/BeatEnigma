//
//  HitGenerator.m
//  iNigmajokerHitSliveHitStatustatus
//
//  Created by Francisco Padilla on 5/2/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "HitGenerator.h"

//typedef enum {
#define	GENERATED  0
#define	SCHEDULED  1
#define	GENERATING 2
//} SpecialHitStatus;

@implementation HitGenerator

@synthesize hitString, jokerHitCount, jokerInterval, liveHitCount, liveInterval, minHits, maxTries, trioStairRatio,
	timeRewards, timeUpIndex, randomAlphabet, generationIndex, generatedHits, jokerIndex, liveIndex;

static NSString *randomAlphabet;
static NSString *randSymbString;

static int trioHits;
static int stairHits;

-(id) initWithTracks:(NSArray*) tracksArray rows:(int)r
{
	self = [super init];
	tracks = tracksArray;
	rows = r;

	maxTries = 10;
	minHits = 1;
	trioStairRatio = 80;
	liveInterval = 15;
	jokerInterval = 15;
	
	randomAlphabet  = @"ATCG";
	randSymbString = @"RRJJMM";
	return self;
}

-(void) generateHits:(int) quantity
{
	int start = generationIndex;
	while ( generationIndex <=  start + quantity ) {
		[self generateHits ];			
	}
}

-(void) reset
{
	tries = 0;
	hits = 0;
	generatedHits = 0;
	
	trioHits = 0;
	stairHits = 0;
	liveIndex = 0;
	jokerIndex = 0;
    trioStairRatio = 80;
}

-(void) generateHitsInBackground
{
    Track *firstTrack = [tracks objectAtIndex:2];
    if ( firstTrack.index > generationIndex - rows - 2  && 
        firstTrack.index < [firstTrack.symbols count] ) {
     [self generateHits];
    }
}

-(void) generateHits // generate runtime hits 
{	
	// generate live, time or symbols, if joke or time just increment index persist
	if ( liveHitStatus == GENERATED && liveHitCount ) {
		liveIndex = timeUpIndex - ( arc4random() % liveInterval ) - 1 ;
		liveHitStatus = SCHEDULED;
		liveHitCount--;
		// NSLog(@" ******** Live Index: %i", liveIndex);
	}
	if ( jokerHitStatus == GENERATED && jokerHitCount ) {
		jokerIndex = ( arc4random() % (timeUpIndex - jokerInterval - 4) ) + 4 ;
		if (jokerIndex < generationIndex) {
			jokerIndex = generationIndex + 1;
		}
		jokerHitStatus = SCHEDULED;
		jokerHitCount--;
		// NSLog(@" ******** Joker Index: %i", jokerIndex);
	}	

	if ( jokerHitStatus == GENERATING || liveHitStatus == GENERATING ) { // Special Hit has not been generated
		// do nothing try again
	} else if ( generationIndex == liveIndex && liveHitStatus == SCHEDULED ){ // priority for lives or joke
		liveHitStatus = GENERATING;
		typeHit = 3;
		self.hitString = @"RRR";
	} else if ( generationIndex == jokerIndex && jokerHitStatus == SCHEDULED ){
		jokerHitStatus = GENERATING;
		typeHit = 3;
		self.hitString = @"JJJ";
	} 
	
	if( jokerHitStatus != GENERATING && liveHitStatus != GENERATING ){
		typeHit = arc4random() % 101 > trioStairRatio ? 4 : 3; // 3 trio 4 for stair
		self.hitString = HitGenerator.randomAlphabet; // @"ATCG";
		if ( typeHit == 3 ) {
			Symbol *symb = [HitGenerator randomHit];
			self.hitString = [NSString stringWithFormat:@"%C%C%C", symb.character, symb.character, symb.character];
		}	
	}

	// keep trying or move forward
	if ( tries >= maxTries || hits >= minHits ) {
		generationIndex += 1;
		tries = 0;
		hits = 0;
	}	
	
	isHit = YES;
	tries += 1; 
	
	int x = ( [tracks count] - typeHit ) ;
	x = arc4random() % (x+1);
	int y = ( arc4random() % (rows - 1) ) + 1;
	int pos[4];
	
	// generate hit
	for( int i = 0 ; i < typeHit ; i++ ) {
		Track *track = [tracks objectAtIndex: x+i ];
		
		// calculate y position in array 
		int l;
		if (track.speed > 0) {
			l = rows - y + generationIndex;
		} else {
			l = y - 1 + generationIndex; 
		}
		
		// validate hit
		NSObject *currObject = [track.symbols objectAtIndex:l];
		if ( currObject == nil ){
			isHit = NO;
			// NSLog(@"  - nil in track symbols");
			break;
		}
		
		if ( currObject != [Symbol emptySymbol] ){
			isHit = NO;
			//// NSLog(@"-   generationIndex %i Hit of %i - trie: %i - at x: %i, y: %i failed at track %i array index %i", generationIndex, typeHit, tries, x, y, x+i, l);
			break;
		}
		
		pos[i] = l;
	}
	
	if ( isHit ) {
		hits += 1; 
		generatedHits++;
		
		if ( typeHit == 3 ){
			trioHits++;
		} else {
			stairHits++;
		}

		if ( jokerHitStatus == GENERATING || liveHitStatus == GENERATING ) {
			// NSLog(@"+ generationIndex %i Hit of %@ allocated at track %i position %i", generationIndex, hitString, x, y );
		}
		
		if ( jokerHitStatus == GENERATING ) {
			jokerHitStatus = GENERATED;
		} 		

		if ( liveHitStatus == GENERATING ) {
            timeUpIndex = timeUpIndex + liveInterval;
			liveHitStatus = GENERATED;
		} 
		
		for (int i = 0; i < typeHit; i++) {
			Track *track = [tracks objectAtIndex:i+x];
			[track.symbols replaceObjectAtIndex:pos[i] 
									 withObject:[[Symbol alloc] initWithCharacter:[hitString characterAtIndex:i] ] 
			 ];
			//NSLog(@"		track: %i, speed:%i, array index: %i character: %C", i+x, (int)(track.speed/abs(track.speed)), pos[i], [hitString characterAtIndex:i] );
		}
	}// if hit
}

-(void) initSymbolArrays:(int) capacity
{	
	// allocate space for track symbols
	for( Track *t in tracks ){
		t.symbols = [[NSMutableArray alloc] initWithCapacity:capacity];
		for (int i = 0 ; i < capacity ; i++) {
			[t.symbols addObject: [Symbol emptySymbol] ];
		}
	}
}

+(Symbol*) randomSymbol
{
	NSString *alpha = [NSString stringWithFormat:@"%@%@%@%@", [HitGenerator randomAlphabet], [HitGenerator randomAlphabet], [HitGenerator randomAlphabet], randSymbString];
	int i = ([alpha length] - 1 )* myRandom() ;
	unichar newCharacter = [alpha characterAtIndex:i];
    Symbol *symbol =  [[Symbol alloc ] initWithCharacter: newCharacter];
	[ symbol autorelease];
	return symbol;
}

+(Symbol*) randomHit
{
	int i = ([[HitGenerator randomAlphabet] length] - 1 )* myRandom() ;
	unichar newCharacter = [[HitGenerator randomAlphabet] characterAtIndex:i	];

	Symbol *symbol =  [[Symbol alloc ] initWithCharacter: newCharacter];
	[symbol autorelease];
	return symbol;
}

+(void) setRandomAlphabet:(NSString*) newAlphabet
{
	if (randomAlphabet != nil) {
		[randomAlphabet release];
	}
	
	randomAlphabet = newAlphabet;
	[randomAlphabet retain];
}

+(NSString*) randomAlphabet
{
	return randomAlphabet;
}

-(void) dealloc
{
    [hitString release];
    [super dealloc];
}

+(NSString*) randSymbString
{
    return randSymbString;
}

+(void) setRandSymbString:(NSString*) string
{
    randSymbString = string;
}
@end

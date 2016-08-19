//
//  HitGenerator.h
//  iNigma
//
//  Created by Francisco Padilla on 5/2/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Track.h"

@interface HitGenerator : NSObject {
	
	// parameters 
	int jokerInterval;
	int jokerHitCount;
	int timeUpIndex;
	
	int liveInterval;
	int liveHitCount;
	int maxTries;	// maximun number of tries
	int minHits;	// maximum number of hits in screen 
	int rows;
	int trioStairRatio;
	NSArray *timeRewards;
	int generationIndex;		// current index for generate hits
	int generatedHits;

	int jokerIndex; // index where joker trio hit will be generated
	int liveIndex; // index where live trio hit will be generated
	
@private
	NSString *hitString;
	BOOL isHit;
	int jokerHitStatus; // status of joker and live generation hits
	int liveHitStatus;
	int typeHit;
	int timeRewardIndex;
	NSArray *tracks;
	int hits;		// number of Hits in screen
	int tries;		// cuurent number of tries
	
}

@property(retain) NSString *hitString;
@property(assign) int jokerInterval;
@property(assign) int liveInterval;
@property(assign) int maxTries;
@property(assign) int trioStairRatio;
@property(assign) int minHits;
@property(assign) int jokerHitCount;
@property(assign) int liveHitCount;
@property(assign) int timeUpIndex;
@property(readwrite) NSArray *timeRewards;
@property(readwrite) NSString *randomAlphabet;
@property(assign) int generationIndex;
@property(assign) int generatedHits;

@property(assign, readonly) int jokerIndex; 
@property(assign, readonly) int liveIndex; 


-(id) initWithTracks:(NSArray*) tracks rows:(int)r;
-(void) initSymbolArrays:(int) capacity;
-(void) generateHits;
-(void) generateHits:(int) quantity;
-(void) generateHitsInBackground;

-(void) reset;

+(Symbol*)randomSymbol;
+(void) setRandomAlphabet:(NSString*) newAlphabet;

+(NSString*) randomAlphabet;

+(void) setRandSymbString:(NSString*) string;
+(NSString*) randSymbString;

@end

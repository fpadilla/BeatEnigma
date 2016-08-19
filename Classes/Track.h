//
//  Track.h
//  iNigma
//
//  Created by Francisco Padilla on 3/17/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "cocos2d.h"
#import "SimpleAudioEngine.h"
#import "Symbol.h"
#import "SymbolSprite.h"

#define ROWS 6 
#define COLS 6

@class TracksLayer;

#pragma mark Track

typedef enum {
	RUNING = 0,
	STOPPED = 1,
	PAUSED = 2,
	FREE = 3
} TrackStatus;

@interface Track : NSObject 
{
	TrackStatus status;
	CGPoint position;
	NSMutableArray* sprites;
	NSMutableArray* symbols;
	float speed;
	float pausedTime;
	SymbolSprite *selectedSprite;
	CCLayer *layer;
	int rows;
	float accelerometerSensibility;
	float disacceleration;
	float maxSpeed;
	float trackWidth;
	int index;
    BOOL isPerfectLevel;
	
@private
	// for animations
	float yOffset;
	float pausedTimeInterval;
	float acumSpeed;
	float runDistance;
	
	// symbols management
}

@property(assign) TrackStatus status;
@property(assign) float speed;
@property(assign) float pausedTime;
@property(assign) float disacceleration;
@property(assign) float maxSpeed;
@property(assign) BOOL isPerfectLevel;

@property(retain) NSMutableArray* sprites;
@property(retain) NSMutableArray* symbols;
@property(assign) CGPoint position;
@property(assign) int rows;
@property(assign) float accelerometerSensibility;
@property(assign) float trackWidth;
@property(readwrite) SymbolSprite *selectedSprite;
@property(assign) int index;

+(float) random2spaceRatio;
+(void) setRandom2spaceRatio:(float) newRatio;

-(id) initWithLayer:(TracksLayer*) layer position:(CGPoint) trackPosition;
-(void) update:(ccTime) dt;
/*+(void) updateSpriteFrame:(CCSprite *)sprite;
-(void) updateSpriteFrame:(CCSprite *)sprite;*/
-(Symbol*) nextSymbol;
-(void) burn;

+(NSArray*)symbols;
-(NSString*)newSymbol;

@end

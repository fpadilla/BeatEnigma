//
//  TracksLayer.h
//  iNigma
//
//  Created by Francisco Padilla on 3/8/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Track.h"

#define SND_MATCH 0 
#define SND_NO_MATCH 1 
#define SND_AUTOBAHN_LOOP 2 

#define CGROUP_ALL 0

#define KGameLayer 1

#define lowSpeed 63.75f
#define middleSpeed 127.5f
#define hightSpeed 255.0f
#define sign(x) ( x >= 0 ? 1 : -1 )

@interface TracksLayer : CCLayer 
{
	TrackStatus status;
	NSMutableArray* tracks;
	CGPoint position;
	CGSize spriteSize;
	int symbolIndex;
	float minSpeed;
	float pausedTimeInterval; 
	float pausedTime;
	BOOL isRunning;
    float timeFactor;
    int mineCount;
	
@private
	NSArray *newSpeeds;
    NSMutableArray *currSpeeds; //save speed for slow motion
    float currPausedTimeInterval; // slow motion
	CCAction *slowMotionAction;
    float newSpeed;
    BOOL resetIndex;
	
	BOOL paused;
	float tracksMarginLeft;
	float tracksMarginTop;
	float trackWidth;
	int rows;
	
    BOOL endSymbols;
}

@property(retain) NSMutableArray* tracks;
@property(readwrite,assign) float minSpeed;
@property(readwrite,assign) TrackStatus status;
@property(readwrite,assign) float pausedTime; 
@property(assign) float trackWidth;
@property(assign) float timeFactor;
@property(assign) int symbolIndex;
@property(readonly) int mineCount;
@property(assign) BOOL isRunning;


+(id) scene;
+(CGPoint) locationFromTouch:(UITouch*)touch;
-(id) init;

-(void) update:(ccTime) dt;
-(void) animateTracks:(ccTime) dt;
-(void) setTracksIndex:(int) Index;
-(void) stop;
-(void) run;
-(void) reset;

-(void) setOpacity:(int) newOpacity;
-(void) waves:(float)time;

-(void) setSpeeds:(NSArray*) speeds;
-(void) setSpeed:(float) speed;
-(float) minSpeed;

-(SymbolSprite*) getSymbolSprite4location:(CGPoint) location;
-(void) jokerRow:(SymbolSprite*) sprite;
-(void) jokerColumn:(SymbolSprite*)sprite;
-(void) endSpecialSymbols;

-(BOOL) isPerfectLevel;
-(void) resetIsPerfectLevel;

-(int) countMines;
-(void) jokerMines;


@end

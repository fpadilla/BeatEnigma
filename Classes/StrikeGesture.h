//
//  StrikeGesture.h
//  iNigma
//
//  Created by Francisco Padilla on 4/15/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "TracksLayer.h"
#import "CCBlade.h"

@class GameMechanics;

@interface StrikeGesture : NSObject <CCTargetedTouchDelegate> {
	NSMutableArray *tracks;
	
	// strike gesture 
	CGPoint firstTouchLocation;
	double firstTouchTime;
	CGPoint lastTouchLocation;
	CGPoint currTouchLocation;
	double lastTouchTime;
	NSMutableArray *selectedSymbols;
	BOOL getureInProgress;
	float maxIdleTime; // maximun time for holding touch
	
	GameMechanics *gameMechanics;
	// CCMotionStreak *streak;
	BOOL enabled;
    CCBlade *blade;
    
//#ifdef  DEBUG
    NSMutableString *debugString;
//#endif
    
}

@property NSMutableArray *tracks;
@property (readwrite) GameMechanics *gameMechanics;
@property (readwrite) BOOL enabled;

-(id) init;

+(CGPoint) locationFromTouch:(UITouch*)touch;
-(CCSprite*) selectSpriteAtLocation:(CGPoint) location;
-(void) burnSelectedSymbols;

-(BOOL) ccTouchBegan:(UITouch*)touch withEvent:(UIEvent *)event;
-(void) ccTouchMoved:(UITouch*)touch withEvent:(UIEvent *)event;
-(void) ccTouchEnded:(UITouch*)touch withEvent:(UIEvent *)event;
-(BOOL) trackTouch:(UITouch*)touch;

@end

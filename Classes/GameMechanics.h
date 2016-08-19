//
//  GameMechanics.h
//  iNigma
//
//  Created by Francisco Padilla on 4/15/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Machine.h"
#import "TracksLayer.h"
#import "ButtonLayer.h"

#import "StrikeGesture.h"
#import "SimpleAudioEngine.h"
#import "HitGenerator.h"
#import "DoubleScore.h"
#import "SlowMotion.h"
#import "RewardEngine.h"
#import "ChartboostManager.h"

#define JokerTime 10.0f
#define TIME_SLOW_FACTOR 0.17
#define SLOW_TIME 7
#define FREEZE_TIME 5

//#define TestLevel
//#define GameTesting
//#define AutoLevelUp

@class GameTest;

typedef enum {
	PLAYING = 0,
	PAUSE = 1,
	TRACKDISABLED = 2,
	ASSETRUNNING = 3
} GameStatus;

typedef enum {
	CLASSIC = 0,
	BLITZ = 1,
	TIMELESS = 2
} GameModes;

@interface GameMechanics : NSObject 
{
	float trackWidth;
	Machine	*machine;
	TracksLayer *tracksLayer;
    ButtonLayer *buttonLayer;
	StrikeGesture *strikeGesture;
	HitGenerator *generator;
	float machineSensitivity;
    	
	int hits;
    int totalScore;
    int turns; // Timeless Mode
    int earnedTurns;
    int earnedCoins;
	int minHits;
	int timeOut; // timeOut for complete level 
	int mode; // mode survaival
    
	NSString *levelName;
	int levelIndex;
	RewardRule *turnRule; // Timeless mode
@private
	GameStatus status;
	GameTest *gameTest;
	CCScene *scene;
	BOOL isRunning;
	int phase;

	float difficulty;
	int rows;

//	CGPoint averageSpritePos;
	float yVar;
    
    NSString *phaseMsg; // message to show up at the end of phase
	float minPerformance;
	
	NSTimeInterval elapsedTime;
    int extraTime;
	int multiplier; // general multiplier for all hits
    
	float alarmTime;
    float liveHitValue;
    	
	NSString *currentSndEffect;	
	NSString *particleSystemFile;
    
    NSArray *phaseProperties;
    
    NSMutableArray *powerUps;
    DoubleScore *doubleScore;
    SlowMotion *slowMotion;
}

@property(assign) float trackWidth;
@property(assign) int levelIndex;
@property(readwrite) NSString *levelName;
@property(readwrite) TracksLayer *tracksLayer;
@property(readwrite) ButtonLayer *buttonLayer;
@property(readwrite) Machine *machine;
@property(readonly) GameStatus status;
@property(readonly) HitGenerator *generator;
@property(readonly) BOOL isRunning;
@property(assign) int phase;
@property(readonly) int mode;
@property(readonly) int extraTime;
@property(readonly) int earnedCoins;
@property(assign) int turns;
@property(assign, readonly) int earnedTurns;

@property(readonly) RewardRule *turnRule;

+(id) loadResources;
+(id) sharedGame;
+(ccColor4B) color4type:(char) character;

-(id) initWithParameters:(NSDictionary *)parameters;
-(BOOL) validateSelectedSymbols;
-(BOOL) validateSymbolSprites:(NSMutableArray*) symbols withSubHits:(BOOL) subHits;
-(CGPoint) avgPosition4Sprites:(NSArray*) sprites;
-(void) accountStair:(NSArray*)sprites;
-(void) accountTrio:(NSArray *) sprites trioCharacter:(unichar)trioCharacter;

-(void) addPoints:(int) points;
-(void) addTurns:(int) newTurns;
-(void) updateTime:(ccTime) dt;
-(void) updateJokerTimer:(ccTime) dt;
-(void) rewardSprites:(NSArray*) sprites;
-(void) placeSpecialSymbol:(char) type atSprites:(NSArray*) sprites;
-(void) placeSpecialSymbol:(char) type;

-(void) placeSpecialSymbol:(char) type;
-(void) increaseElapsedTime:(float)time;
-(void) increaseMultiplier:(CGPoint) location;

-(void) rewardTimeSymbol:(CGPoint) position;

-(void) stopTimeLess;
-(void) stop;
//-(void) checkGameOver;
-(void) run;
-(void) runEffect:(unichar)typeEffect atPosition:(CGPoint) position withVar:(float) posVariance;
-(void) changePauseTracks:(float) apause;

-(void) stopPlayingFor:(float) time;
-(void) resumeTemporaryStop;



-(void) explodeAllScreenSymbols;
-(void) startNextPhase:(NSNumber *)addhits;
-(void) explodeSymbol:(CCSprite*) sprite;

-(void) TestUpdateGameParameters;

@end

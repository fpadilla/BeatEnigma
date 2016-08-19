//
//  FrontLayer.h
//  iNigma
//
//  Created by Francisco Padilla on 4/15/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "SimpleAudioEngine.h"
#import "Asset.h"

@interface FrontLayer : CCLayer
{	
	// game panel
	CCLabelBMFont *scoreLabel ;
	CCLabelBMFont *timeLabel ;
	CCLabelBMFont *pointsLabel;
	@private
	BOOL alarmOn;
	CCLabelBMFont *phaseLabel ;
	CCLabelBMFont *debugLabel ;
	
	CCSprite *openedTop;
	CCSprite *openedBottom;
	CCSprite *openedLeft;
	CCSprite *openedRight;	
	
	NSMutableArray *assets;
	int assetIndex;
    NSNumberFormatter *numberFormatter;
}

@property(readonly) CCSprite *openedTop;
@property(readonly) CCSprite *openedBottom;
@property(readonly) CCSprite *openedLeft;
@property(readonly) CCSprite *openedRight;

@property(readonly) CCLabelBMFont *debugLabel ;
@property(readonly) int assetIndex;

-(id) initWithParameters:(NSDictionary *)parameters;


-(void) showPointLabel:(NSString*)labelString atLocation:(CGPoint) location color:(ccColor3B) color;

/*-(void) showLabel:(NSString*)labelString atLocation:(CGPoint) location;
-(void) showPointLabel:(int)points atLocation:(CGPoint) location;*/

-(void) showBigScore:(NSString*) phaseName delay:(float) delay;
-(void) updateBigScore:(NSString*)phaseName;

-(void) updateScoreLabel:(int) points multiplier:(int) multiplier;
-(void) updateScoreLabel:(int) points level:(int) level;

-(void) showPhaseLabel:(NSString*)phaseName delay:(float) delay;

-(void) updateTimeLabel:(NSTimeInterval) elapsedTime;
-(void) updateTurnLabel:(int) turns;

-(void) setOxidization:(float) value;
-(void) fall:(CCSprite *) sprite;
-(void) updateAssets:(float) damagePercent;
-(void) updateBlitzMachine:(int) totalScore
;
-(void) setPhase:(int) newPhase;

-(void) showParticules:(NSString*)filename;
-(void) showParticules:(NSString*)filename atLocation:(CGPoint)location variance:(CGPoint)var;
-(void) showParticulesAt:(CGPoint)location variance:(CGPoint)var color:(ccColor4B) color;

-(void) turnAlarmOn;
-(void) turnAlarmOff;

-(BOOL) isAllAssetsDone;
-(Asset*) currentAsset;
-(Asset*) lastAsset;
@end

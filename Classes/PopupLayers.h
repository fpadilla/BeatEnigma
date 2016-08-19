//
//  PauseLayer.h
//  iNigma
//
//  Created by Francisco Padilla on 3/29/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "GameFlow.h"

@interface PopupLayers : CCColorLayer  {
@private
	CCMenuItemImage * resume;
	CCMenuItemImage * restart;
	CCMenuItemImage * mainMenu;
	CCMenuItemToggle * music;
	CCMenuItemToggle * sound;
	CCMenuItemImage * nextLevel;
    
	CCLabelBMFont *title;
	CCLabelBMFont *totalScore;
    CCLabelBMFont *highScore;
    CCLabelBMFont *extraTime;
    CCLabelBMFont *machineDamage;
    CCLabelBMFont *earnedCoins;
    
    CCMenuItemSprite *tweet;
    CCMenuItemSprite *postFb;
    CCMenuItemSprite *store;
    
    int score;
    BOOL isHighScore;
    NSNumberFormatter *numberFormatter;
    NSString *category;
}

@property(readonly) CCMenuItemImage * resume;
@property(readonly) CCMenuItemImage * restart;
@property(readonly) CCMenuItemImage * mainMenu;
@property(readonly) CCMenuItemToggle * music;
@property(readonly) CCMenuItemToggle * sound;
@property(readonly) CCMenuItemImage * nextLevel;
@property(readonly) CCLabelBMFont *title;
@property(readonly) CCLabelBMFont *totalScore;
@property(readonly) CCLabelBMFont *highScore;
@property(readonly) CCLabelBMFont *extraTime;
@property(readonly) CCLabelBMFont *machineDamage;
@property(readonly) CCLabelBMFont *earnedCoins;
@property(readonly) CCMenuItemSprite *store;

@property(readwrite) BOOL isHighScore;
@property(readwrite) int score;

- (void) dealloc;

@property(readonly) CCMenuItemSprite *tweet;
@property(readonly) CCMenuItemSprite *postFb;
@property(readonly) NSNumberFormatter *numberFormatter;
@property NSString *category;

+(id) pauseGameLayer;
+(id) levelSuccessLayer:(float) delay score:(int)score;
+(id) levelFailedLayer;
-(void) setupButtons;
-(void) newHighScoreEffect;

@end

//
//  GameFlow.h
//  iNigma
//
//  Created by Francisco Padilla on 4/15/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GameMechanics.h"
#import "ChartboostManager.h"

@interface GameFlow : NSObject
{	
@private
	GameMechanics *currentLevel;
	BOOL pausedGame;
    NSMutableDictionary *achievements;
}

+(id) sharedGameFlow;
-(id) init;

-(void) goMainMenu;
-(void) playLevel:(int)level;
-(int)  nextLevel;
-(void) playNextLevel;

-(void) pause;
-(void) stop;
-(void) reload;

-(void) savePreference:(NSString *)name value:(id) value;
-(id) getPreference:(NSString *) name;
-(void) restoreVolumePreferences;

-(void) restoreVolumePreferences;
-(void) toggleSound;
-(void) toggleMusic;

-(BOOL) setHighScore:(int) newScore forCategory:(NSString*)category;
-(int) highScoreForCategory:(NSString*) category;

-(void) showGameCenterLeaderBoard;
-(void) checkAchievement;

- (BOOL) reportAchievementIdentifier: (NSString*) identifier percentComplete: (float) percent;
-(void) saveAchievements;

-(void) showStore;

@end

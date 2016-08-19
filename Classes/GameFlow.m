//
//  GameFlow.m
//  iNigma
//
//  Created by Francisco Padilla on 4/15/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "GameFlow.h"
#import "PopupLayers.h"
#import "MainMenuLayer.h"
#import "UserTracking.h"
#import "AdManager.h"
#import "GameCenter.h"
#import "FBClient.h"

#define maxLevels 4

@implementation GameFlow

static GameFlow *sharedGameFlow;

+(id) sharedGameFlow
{	
	if (sharedGameFlow == nil) {
		sharedGameFlow = [[ GameFlow alloc ] init ];
        [sharedGameFlow restoreVolumePreferences ];
	}
	[sharedGameFlow retain];
	return	sharedGameFlow;
}

-(id) init
{
    if (self = [super init]) {
        NSUserDefaults *usrDef = [NSUserDefaults standardUserDefaults];
        if ([usrDef objectForKey:@"achievements"] != nil ) {
            achievements = [usrDef objectForKey:@"achievements"];
        } else {
            achievements = [[NSMutableDictionary alloc] init];
        }
        [achievements retain];
    }
    return self;
}

-(void) dealloc
{
	if ( currentLevel != nil){
        [currentLevel stop];
		[currentLevel release];
	}
	[super dealloc];
}

-(void) showUpdateMessage
{
    NSUserDefaults *usrDef = [NSUserDefaults standardUserDefaults];
    /* if ( [self highScore] > 0 &&
        [usrDef objectForKey:@"showUpdateMesg2.0"] == nil ) {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Thanks for keep playing" message:@"This is the 2.0 update, please review the help for important game mechanic changes, enjoy it!" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles: nil];
        [alertView show];
        [usrDef setBool:YES forKey:@"showUpdateMesg2.0"];
    }
    [usrDef setBool:NO forKey:@"showUpdateMesg2.0"]; */
}

-(void) goMainMenu
{

#ifdef LITE_VERSION    
    [[AdManager sharedAdMgr] disable];
#endif
	
    [UserTracking sharedUserTracking];
	if ( [[CCDirector sharedDirector] runningScene] ) {
        int r = [currentLevel retainCount];
        if (currentLevel != nil) {
            [currentLevel stop];
            [currentLevel release];
            currentLevel = nil;
        }
        // must go after stop game for music background doesn´t be stopped
		[[CCDirector sharedDirector] replaceScene: [MainMenuLayer scene]];

	} else {
		[[CCDirector sharedDirector] runWithScene: [MainMenuLayer scene]];
	}
	[self showUpdateMessage];
}

-(void) playLevel:(int)level
{
	[[FBClient sharedFBClient] gameStart];

#ifdef LITE_VERSION
    //[[AdManager sharedAdMgr] enable];
    [[Chartboost sharedChartboost] cacheInterstitial];
#endif
    
	NSMutableDictionary *parameters = [NSMutableDictionary dictionaryWithContentsOfFile: 
								   [[NSBundle mainBundle] pathForResource:@"Level3" ofType:@"plist"] ];
	pausedGame = NO;
    if (currentLevel!= nil) { // restart case
        [currentLevel stop];
        [currentLevel release];
        currentLevel = nil;
    } else {

        // show ad if it not restart

    }
    
    [parameters setValue:[NSNumber numberWithInt:level] forKey:@"mode"];
	currentLevel = [[[[GameMechanics alloc] initWithParameters:parameters] autorelease] retain];
	currentLevel.levelName = [NSString stringWithFormat:@"%i", level];
	currentLevel.levelIndex = level;
	
	// save last level played 
	NSUserDefaults *usrDef = [NSUserDefaults standardUserDefaults];
	[usrDef setInteger:[NSNumber numberWithInt:level] forKey:@"lastLevel"];
    
}

- (NSString *)path4File:(NSString*) fileName 
{ 
	NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES); 
	NSString *documentsDirectory = [paths objectAtIndex:0];
	return [documentsDirectory stringByAppendingPathComponent:fileName];
}

-(void) pause
{
	if ( !pausedGame && currentLevel != nil && currentLevel.isRunning){
		pausedGame = YES;
		[currentLevel pause];
		
		[PopupLayers pauseGameLayer];
		// [[UserTracking sharedUserTracking] Log:PAUSE];
	}
}

- (void) resume
{	
	if ( pausedGame && currentLevel != nil ){
		pausedGame = NO;
		[currentLevel resume];
		// [[UserTracking sharedUserTracking] Log:RESUME_PLAY];
	}	
}

- (void) restart
{
	[sharedGameFlow playLevel:currentLevel.mode];
}

-(void) playNextLevel{
	
	if ( [self nextLevel:currentLevel.levelIndex ] > 0) {
		[self playLevel: [self nextLevel: (++currentLevel.levelIndex) ] ];
	}
}

-(int) nextLevel:(int) currLevel
{
	if ( currLevel < maxLevels ) {
		return ++currLevel;
	}
	return -1;
}

-(int) nextLevel
{
	int next = [ self nextLevel: currentLevel.levelIndex ];
	return next;
}

-(void) restoreVolumePreferences
{
	NSUserDefaults *usrDef = [NSUserDefaults standardUserDefaults];
	if ([usrDef objectForKey:@"music"] != nil &&  ![usrDef boolForKey:@"music"] ) {
		[[SimpleAudioEngine sharedEngine] setBackgroundMusicVolume: 0];
	} else {
        [[SimpleAudioEngine sharedEngine] setBackgroundMusicVolume: 1.0];

    }
	
	if ([usrDef objectForKey:@"sound"] != nil && ![usrDef boolForKey:@"sound"] ) {
		[[SimpleAudioEngine sharedEngine] setEffectsVolume:0 ];
	}
}

-(void)toggleMusic
{
	NSUserDefaults *usrDef = [NSUserDefaults standardUserDefaults];
	
	if( [[SimpleAudioEngine sharedEngine] backgroundMusicVolume ] > 0 ) {
		[usrDef setBool:NO forKey:@"music"];
		[[SimpleAudioEngine sharedEngine] setBackgroundMusicVolume: 0];
	} else {
		[usrDef setBool:YES forKey:@"music"];
		[[SimpleAudioEngine sharedEngine] setBackgroundMusicVolume: 1];
        [usrDef synchronize];
	}
}

-(void)toggleSound
{
	NSUserDefaults *usrDef = [NSUserDefaults standardUserDefaults];
	
	if( [[SimpleAudioEngine sharedEngine] effectsVolume] > 0 ) {
		[usrDef setBool:NO forKey:@"sound"];
		[[SimpleAudioEngine sharedEngine] setEffectsVolume:0 ];
	} else {
		[usrDef setBool:YES forKey:@"sound"];
		[[SimpleAudioEngine sharedEngine] setEffectsVolume:1 ];
	}
    [usrDef synchronize];
}

-(BOOL) setHighScore:(int) newScore forCategory:(NSString*)category
{
    int currentScore = [ self highScoreForCategory:category];
    
    [[GameCenter sharedGameCenter] reportScore:newScore forCategory:category];
    [[FBClient sharedFBClient] reportScore:newScore];
    if ( currentScore < newScore ){
        [[NSUserDefaults standardUserDefaults] setInteger:newScore forKey:category];
        return YES;
    }
    return NO;
}

-(int) highScoreForCategory:(NSString*) category
{
	NSUserDefaults *usrDef = [NSUserDefaults standardUserDefaults];
    if ( [usrDef objectForKey:category] != nil) {
        return [usrDef integerForKey:category];
    }
    return 0;
}

- (BOOL) reportAchievementIdentifier: (NSString*) identifier percentComplete: (float) percent
{
    NSNumber *currAchievement = [achievements objectForKey:identifier];
    float currPercent = [currAchievement floatValue];
    if ( currPercent < percent ) { // local achievement cache.
        NSLog(@"Reporting achievement %@ percentComplete %f", identifier, percent);
        [achievements setValue:[NSNumber numberWithFloat:percent] 
                        forKey:identifier];
    }
    
    return 
        [[GameCenter sharedGameCenter] reportAchievementIdentifier:identifier percentComplete:percent] &&
        [[FBClient sharedFBClient] reportAchievementIdentifier:identifier percentComplete:percent]  ;
}

-(void) saveAchievements
{
    NSUserDefaults *usrDef = [NSUserDefaults standardUserDefaults];
    [usrDef setObject:achievements forKey:@"achievements"];
    [usrDef synchronize];    
    
    [[GameCenter sharedGameCenter] saveAchievementsCache];
    [[GameCenter sharedGameCenter] archiveUnreportedObjects];
    [[FBClient sharedFBClient] saveAchievementsCache];
}

-(void) showStore
{
    [[[[UIApplication sharedApplication] delegate] viewController] showStore];
}
 
@end

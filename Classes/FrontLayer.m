//
//  FrontLayer.m
//  iNigma
//
//  Created by Francisco Padilla on 4/15/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "FrontLayer.h"
#import "Fan.h"
#import "Asset.h"
#import "Animation.h"

@implementation FrontLayer

@synthesize openedTop, openedBottom, openedLeft, openedRight, debugLabel, assetIndex;


-(id) initWithParameters:(NSDictionary *)parameters
{
	self = [super init];
	NSString *devOrientation = @"landscape";
	BOOL isPortraitOrientation = NO;
	
	if ( [[parameters objectForKey:@"portraitOrientation"] intValue] == 1 ) { // Default orientation is landscape
		isPortraitOrientation = YES;
		devOrientation = @"portrait";
	}	
	
	CCSpriteFrameCache* frameCache = [CCSpriteFrameCache sharedSpriteFrameCache]; 
	CGSize screenSize = [[CCDirector sharedDirector] winSize ];

	/*************** opened machine ****************/
	
	openedTop = [CCSprite spriteWithSpriteFrame:[frameCache spriteFrameByName:@"frame-top-opened.png"] ];
	openedTop.position = CGPointMake(screenSize.width/2, screenSize.height - openedTop.contentSize.height/2);
	//openedTop.color = ccc3(128,128,128);
	[ self addChild:openedTop z:-1];
	
	openedBottom = [CCSprite spriteWithSpriteFrame:[frameCache spriteFrameByName:@"frame-bottom-opened.png"] ];
	openedBottom.position = CGPointMake(screenSize.width/2, openedBottom.contentSize.height/2);
	[ self addChild:openedBottom z:-1 ];
	
	openedLeft = [CCSprite spriteWithSpriteFrame:[frameCache spriteFrameByName:@"frame-left-opened.png"] ];
	openedLeft.position = CGPointMake(openedLeft.contentSize.width/2, 
									  screenSize.height - openedTop.contentSize.height - openedLeft.contentSize.height/2);
	[ self addChild:openedLeft z:-1 ];
	
	openedRight = [CCSprite spriteWithSpriteFrame:[frameCache spriteFrameByName:@"frame-right-opened.png"] ];
	openedRight.position = CGPointMake(screenSize.width - openedRight.contentSize.width/2, 
									   openedBottom.contentSize.height + openedRight.contentSize.height/2);
	[ self addChild:openedRight z:-1 ];
	
	// ********* led panel and labels *****************
	CCSprite *ledPanel = [CCSprite spriteWithSpriteFrame:[frameCache spriteFrameByName:@"ledPanel.png"] ];
	ledPanel.position = CGPointMake(234,295);
	[ self addChild:ledPanel z:29];
	
	
	scoreLabel = [CCLabelBMFont labelWithString:@"0" fntFile:@"Panel Font.fnt"];
	scoreLabel.position = CGPointMake( (isPortraitOrientation?185:325), screenSize.height-(isPortraitOrientation?52:32) );
	scoreLabel.anchorPoint = ccp(1,0);
	//scoreLabel.scale = 1.5;
	scoreLabel.color = ccBLACK;
	[ self addChild:scoreLabel  z:30];
	
	timeLabel = [CCLabelBMFont labelWithString:@"." fntFile:@"Panel Font.fnt"];
	timeLabel.position = CGPointMake( (isPortraitOrientation?61:143), screenSize.height-(isPortraitOrientation?52:32) );
	timeLabel.anchorPoint = ccp(0,0);
	timeLabel.color = ccBLACK;
	[ self addChild:timeLabel z:30];
	
	pointsLabel = [CCLabelBMFont labelWithString:@"." fntFile:@"Points Font.fnt"];
	pointsLabel.anchorPoint = ccp(0.5,0.5);
	//pointsLabel.color = ccRED;
	pointsLabel.visible = NO;
	[ self addChild:pointsLabel z:30 ];
	
	phaseLabel = [CCLabelBMFont labelWithString:@"0" fntFile:@"Phase Font.fnt"];
	phaseLabel.position = CGPointMake(screenSize.width/2, screenSize.height/2 + 50);
	phaseLabel.visible = NO;
	[ self addChild:phaseLabel z:30 ];

	debugLabel = [CCLabelBMFont labelWithString:@"0" fntFile:@"Phase Font.fnt"];
	debugLabel.position = CGPointMake(screenSize.width/2, 30);
	debugLabel.visible = NO;
    //debugLabel.color = ccBLACK;
	[ self addChild:debugLabel z:50 ];
		
	[self setupAssets];
	assetIndex = 0;
    
    // score formatting
    numberFormatter = [[[NSNumberFormatter alloc] init] retain];
    [numberFormatter setNumberStyle:NSNumberFormatterDecimalStyle];
    
	return self;
}

-(void) updateTimeLabel:(NSTimeInterval) elapsedTime
{
	timeLabel.string = [NSString stringWithFormat:@":%02d", (int)elapsedTime];
}

-(void) updateTurnLabel:(int) turns
{
	timeLabel.string = [NSString stringWithFormat:@"%i", turns];
    // NSLog(@"turn label is %@ from %i", timeLabel.string, turns);
}

-(void) updateScoreLabel:(int) points multiplier:(int) multiplier
{

    NSString *formattedScore = [numberFormatter stringFromNumber:
                                    [NSNumber numberWithInt: points] ];
	scoreLabel.string = [NSString stringWithFormat:@"%ix  %@", multiplier, formattedScore];
}

-(void) updateScoreLabel:(int) points level:(int) level
{
	scoreLabel.string = [NSString stringWithFormat:@"L:%i  C:%i", level, points];
}

-(void) showPointLabel:(NSString*)labelString atLocation:(CGPoint) location color:(ccColor3B) color 
{
    CCLabelBMFont *label = [CCLabelBMFont labelWithString:@"." fntFile:@"Points Font.fnt"];
    
    label.anchorPoint = ccp(0.5,0.5);
    label.color = color;
    label.visible = YES;
    label.scale = 0.85;
	[ self addChild:label z:30 ];
    
	label.position = location;
	label.string = labelString;
	label.visible = YES;
	[label runAction:[CCSequence actions:
                            [CCDelayTime actionWithDuration:0.7],
                            [CCFadeOut actionWithDuration:0.6],
                            [Remove action],
                            nil] ];
	[label runAction:[CCMoveBy actionWithDuration:2 position:CGPointMake(0, 85)] ];    
}

-(void) showBigScore:(NSString*)phaseName delay:(float) delay
{	
	pointsLabel.visible = NO;
	
	phaseLabel.visible = YES;
	phaseLabel.scale = 1.0;
	phaseLabel.string = phaseName;
	phaseLabel.opacity = 255;
	[phaseLabel runAction:[CCSequence actions:
						   [CCScaleTo actionWithDuration:2 scale:2.4],
						   [CCDelayTime actionWithDuration:fabs(delay)],
						   [CCFadeOut actionWithDuration:2],
							nil] ]; 
}

-(void) showPhaseLabel:(NSString*)phaseName delay:(float) delay
{	
	pointsLabel.visible = NO;

	phaseLabel.visible = YES;
	phaseLabel.scale = 0.4;
    phaseLabel.color = ccWHITE;
	phaseLabel.string = phaseName;
	phaseLabel.opacity = 255;
	[phaseLabel runAction:[CCSequence actions:
						   [CCScaleTo actionWithDuration:0.05 scale:1.2],
						   [CCDelayTime actionWithDuration:fabs(delay)],
						   [CCFadeOut actionWithDuration:0.2],
                           
                           nil] ]; 
}

-(void) updateBigScore:(NSString*)phaseName
{
	phaseLabel.string = phaseName;
}

-(void) showParticulesAt:(CGPoint)location variance:(CGPoint)var
{
	[self showParticules:@"explosion.plist" atLocation:location variance:var ];
}

-(void) showParticules:(NSString*)filename atLocation:(CGPoint)location variance:(CGPoint)var 
{
	CCParticleSystemPoint *hitParticles = [CCParticleSystemPoint particleWithFile:filename];
	hitParticles.position = location;
	hitParticles.posVar = var;
	hitParticles.autoRemoveOnFinish = YES;
	
	[self addChild: hitParticles];
}

-(void) showParticules:(NSString*)filename atLocation:(CGPoint)location variance:(CGPoint)var color:(ccColor4B)color
{
	CCParticleSystemPoint *hitParticles = [CCParticleSystemPoint particleWithFile:filename];
	hitParticles.position = location;
	hitParticles.posVar = var;
	hitParticles.startColor = ccc4FFromccc4B(color);
	hitParticles.autoRemoveOnFinish = YES;
	
	[self addChild: hitParticles];
}

-(void) showParticules:(NSString*)filename
{
	CCParticleSystemPoint *hitParticles = [CCParticleSystemPoint particleWithFile:filename];
	hitParticles.autoRemoveOnFinish = YES;
	[self addChild: hitParticles];
}

-(void) updateAssets:(float) damagePercent
{
	Asset *currAsset;
	if( assetIndex < [assets count] ){
		currAsset = [assets objectAtIndex:assetIndex];
		[currAsset updateStatus:damagePercent];
		
		if ( damagePercent >= 1) {
			assetIndex += 1;
		}
	}// 
}

-(void) updateBlitzMachine:(int) totalScore
{
  	Asset *currAsset;
    int MAX_SCORE = 123456;
//    int newIndex = (int) ( totalScore*17/MAX_SCORE );
    int newIndex = (int) pow(totalScore/1000, 1/1.98);

    // fire effects
	while( assetIndex < newIndex  && ![self isAllAssetsDone] 
          && newIndex<=17){
		currAsset = [assets objectAtIndex:assetIndex];
		[currAsset updateStatus:1];	
        [currAsset fireEffects];
		assetIndex ++;
	}
    
    
    if( assetIndex < [assets count] && ![self isAllAssetsDone]) {
        // update current asset status
        
        /*int pointsPerLevel = MAX_SCORE/17;
        float damagePercent = (float)(totalScore % pointsPerLevel)/pointsPerLevel;*/
        
        float damagePercent = (powf(assetIndex+1,1.98)*1000 - totalScore) /
        (powf(assetIndex+1,1.98)*1000 - powf(assetIndex,1.98)*1000);
        
        currAsset = [assets objectAtIndex:assetIndex];
        [currAsset updateStatus:damagePercent];	
    }
}

-(BOOL) isAllAssetsDone{
    //NSLog(@"assetIndex: %i count: %i", assetIndex, [assets count]);
    return assetIndex == ([assets count] - 1);
}

-(void) setupAssets
{
	assets = [[NSMutableArray alloc] initWithCapacity:25];
	Asset *asset;
	CCParticleSystemPoint *particleSys1;
	CCParticleSystemPoint *particleSys2;
	
	asset = [Asset assetWithSpriteName:@"leftLid"];
	asset.position = ccp(16,320-167);
	asset.begin = 5;
	asset.end = 10;
	particleSys1 = [CCParticleSystemPoint particleWithFile:@"panel-explosion.plist"];
	particleSys1.position = ccp(16,53);
	particleSys2 = [CCParticleSystemPoint particleWithFile:@"panel-explosion.plist"];
	particleSys2.position = ccp(16,253);	
	asset.action = [CCSequence actions:
					
					[ShowParticleSystem actionWithParticleSys:particleSys1 updatePosition:NO]
					,[PlayEffect actionWithFile:@"chispas-short.caf"]
					
					,[CCDelayTime actionWithDuration:0.8]
					,[ShowParticleSystem actionWithParticleSys:particleSys2 updatePosition:NO]
					,[PlayEffect actionWithFile:@"chispas-short.caf"]
					
					,[CCDelayTime actionWithDuration:0.9]
					,[AccelerateMotion actionWithDuration:1.0 initialSpeed:ccp(0,0) acceleration:ccp(0,-700) rotationSpeed:-30]
					,nil];
	[assets addObject:asset ];
	[self addChild:asset z:10];
	
	// Battery 1
	asset = [Asset assetWithSpriteName:@"Battery"];
	asset.position = ccp(18,320-190-25);
	asset.begin = 21;
	asset.end = 26;
	asset.sndEffect = @"explosion.caf";
	particleSys1 = [CCParticleSystemPoint particleWithFile:@"battery-explosion.plist"];
	particleSys1.position = asset.position;
	asset.particleSystem = particleSys1;
	asset.action = [AccelerateMotion actionWithDuration:2.0 initialSpeed:ccp(100,350) acceleration:ccp(0,-500) rotationSpeed:360*3];
	[assets addObject:asset ];
	[self addChild:asset];
	
	asset = [Asset assetWithSpriteName:@"bottomLid"];
	asset.position = ccp(240,320-299);
	asset.begin = 15;
	asset.end = 20;
	particleSys1 = [CCParticleSystemPoint particleWithFile:@"panel-explosion.plist"];
	particleSys1.position = ccp(70,21);
	particleSys2 = [CCParticleSystemPoint particleWithFile:@"panel-explosion.plist"];
	particleSys2.position = ccp(440,21);	
	asset.action = [CCSequence actions:
					
					[ShowParticleSystem actionWithParticleSys:particleSys1 updatePosition:NO]
					,[PlayEffect actionWithFile:@"chispas-short.caf"]
					
					,[CCDelayTime actionWithDuration:0.99]
					,[ShowParticleSystem actionWithParticleSys:particleSys2 updatePosition:NO]
					,[PlayEffect actionWithFile:@"chispas-short.caf"]
					
					,[CCDelayTime actionWithDuration:0.9]
					,[AccelerateMotion actionWithDuration:1.0 initialSpeed:ccp(0,0) acceleration:ccp(0,-700) rotationSpeed:-30]
					,nil];	
	[assets addObject:asset ];
	[self addChild:asset z:10];
	
	// Battery 2
	asset = [Asset assetWithSpriteName:@"Battery"];
	asset.position = ccp(18,320-140-25);
	asset.begin = 26;
	asset.end = 31;	
	asset.sndEffect = @"Space vehicle launch.caf";
	asset.action = [CCSpawn actions: 
					[AccelerateMotion actionWithDuration:1.6 initialSpeed:ccp(300,250) acceleration:ccp(0,-500) rotationSpeed:360]
					,[ShowParticleSystem actionWithParticleSys:[CCParticleSystemPoint particleWithFile:@"fire.plist"]
												updatePosition:YES]
					,nil];
	[assets addObject:asset ];
	[self addChild:asset];
    	
	asset = [Asset assetWithSpriteName:@"rightLid"];
	asset.position = ccp(462,320-165);
	asset.begin = 10;
	asset.end = 15;
	particleSys1 = [CCParticleSystemPoint particleWithFile:@"panel-explosion.plist"];
	particleSys1.position = ccp(462,53);
	particleSys2 = [CCParticleSystemPoint particleWithFile:@"panel-explosion.plist"];
	particleSys2.position = ccp(462,253);	
	asset.action = [CCSequence actions:
					
					[ShowParticleSystem actionWithParticleSys:particleSys1 updatePosition:NO]
					,[PlayEffect actionWithFile:@"chispas-short.caf"]
					
					,[CCDelayTime actionWithDuration:0.8]
					,[ShowParticleSystem actionWithParticleSys:particleSys2 updatePosition:NO]
					,[PlayEffect actionWithFile:@"chispas-short.caf"]
					
					,[CCDelayTime actionWithDuration:0.9]
					,[AccelerateMotion actionWithDuration:1.0 initialSpeed:ccp(0,0) acceleration:ccp(0,-700) rotationSpeed:-30]
					,nil];	
	[assets addObject:asset ];
	[self addChild:asset z:10];

	
	Fan *fan = [Fan fanWithSpriteName:@"redFan"];
	fan.position = ccp(130,39);
	fan.begin = 37;
	fan.end = 47;
	fan.sndEffect = @"fan-stop.caf";
	fan.particleSystem = [CCParticleSystemPoint particleWithFile:@"fan-smoke.plist"];
    fan.action = [CCDelayTime actionWithDuration:4];
	[ self addChild:fan ];
	[assets addObject:fan ];
	
    
    asset = [Asset assetWithSpriteName:@"topLid"];
	asset.position = ccp(242,290);
	asset.begin = 1;
	asset.end = 5;
	particleSys1 = [CCParticleSystemPoint particleWithFile:@"panel-explosion.plist"];
	particleSys1.position = ccp(90,290);
	particleSys2 = [CCParticleSystemPoint particleWithFile:@"panel-explosion.plist"];
	particleSys2.position = ccp(420,290);
	asset.action = [CCSequence actions:
                    
                    [ShowParticleSystem actionWithParticleSys:particleSys1 updatePosition:NO]
					,[PlayEffect actionWithFile:@"chispas-short.caf"]
					
					,[CCDelayTime actionWithDuration:0.8]
					,[ShowParticleSystem actionWithParticleSys:particleSys2 updatePosition:NO]
					,[PlayEffect actionWithFile:@"chispas-short.caf"]
					
					,[CCDelayTime actionWithDuration:0.9]
					,[AccelerateMotion actionWithDuration:1.5 initialSpeed:ccp(0,0) acceleration:ccp(0,-500) rotationSpeed:30]
                    ,nil];
	[assets addObject:asset ];
	[self addChild:asset z:11];

		
	// Battery 3
	asset = [Asset assetWithSpriteName:@"Battery"];
	asset.begin = 31;
	asset.end = 37;	
	asset.position = ccp(18,320-90-25);
	asset.sndEffect = @"Space vehicle launch.caf";
	asset.action = [CCSequence actions: 
						[AccelerateMotion actionWithDuration:0.8 initialSpeed:ccp(200,200) acceleration:ccp(0,-500) rotationSpeed:360*2]
						,[PlayEffect actionWithFile:@"explosion.caf"]
						,[CCSpawn actions:[ShowParticleSystem 
												actionWithParticleSys:[CCParticleSystemPoint particleWithFile:@"explosion2.plist"]
												updatePosition:NO]
											,[AccelerateMotion actionWithDuration:1.6 initialSpeed:ccp(200,250) acceleration:ccp(0,-500) rotationSpeed:-360*4]
											,nil]
					,nil];
	[assets addObject:asset ];
	[self addChild:asset];

	//************** Fans ****************
	
	Fan *fan2 = [Fan fanWithSpriteName:@"blueFan"];
	fan2.begin = 47;
	fan2.end = 57;
	fan2.sndEffect = @"fan-stop.caf";
	fan2.particleSystem = [CCParticleSystemPoint particleWithFile:@"fan-smoke.plist"];
	fan2.position = ccp(346,39);
    fan2.action = [CCDelayTime actionWithDuration:4];
	[ self addChild:fan2 ];
	[assets addObject:fan2 ];
	
	// ****************  RGHT SIDE  **************** 
	
	asset = [Asset assetWithSpriteName:@"metal1"];
	asset.position = ccp(455.5,107);
	asset.sndEffect = @"explosion.caf";
	asset.particleSystem = [CCParticleSystemPoint particleWithFile:@"explosion-burst.plist"];
	//asset.action = [AccelerateMotion actionWithDuration:1.6 initialSpeed:ccp(0,0) acceleration:ccp(0,-500) rotationSpeed:-360*2];
	[assets addObject:asset ];
	[self addChild:asset];	

	asset = [Asset assetWithSpriteName:@"cables"];
	asset.position = ccp(463.5,119.5);
	asset.sndEffect = @"chispas-short.caf";
	asset.particleSystem = [CCParticleSystemPoint particleWithFile:@"cables-fire.plist"];
	asset.action = [CCDelayTime actionWithDuration:1.5];
	[assets addObject:asset ];
	[self addChild:asset];
	
	asset = [Asset assetWithSpriteName:@"metal2"];
	asset.position = ccp(458.5,172);
	asset.sndEffect = @"chispas-short.caf";
	asset.particleSystem = [CCParticleSystemPoint particleWithFile:@"fan-smoke.plist"];
	//asset.action = [AccelerateMotion actionWithDuration:1.6 initialSpeed:ccp(0,0) acceleration:ccp(0,-500) rotationSpeed:-360*2];
	[assets addObject:asset ];
	[self addChild:asset];
	
	asset = [Asset assetWithSpriteName:@"metal3"];
	asset.position = ccp(471,198.5);
	asset.sndEffect = @"explosion.caf";
	asset.particleSystem = [CCParticleSystemPoint particleWithFile:@"bigSlowExplosion.plist"];
	asset.action = [AccelerateMotion actionWithDuration:1.6 initialSpeed:ccp(-200,0) acceleration:ccp(0,-500) rotationSpeed:-90];
	[assets addObject:asset ];
	[self addChild:asset];

	asset = [Asset assetWithSpriteName:@"lava-hole"];
	asset.position = ccp(463.5,226.5);
	asset.sndEffect = @"chispas-short.caf";
	asset.particleSystem = [CCParticleSystemPoint particleWithFile:@"lava.plist"];
	//asset.action = [AccelerateMotion actionWithDuration:1.6 initialSpeed:ccp(0,0) acceleration:ccp(0,-500) rotationSpeed:-360*2];
	[assets addObject:asset ];
	[self addChild:asset];
	
	// **************** Chips **************
	
	asset = [Asset assetWithSpriteName:@"chip"];
	asset.begin = 58;
	asset.end = 68;	
	asset.position = ccp(131,287);
	asset.sndEffect = @"chispas-short.caf";
	asset.particleSystem = [CCParticleSystemPoint particleWithFile:@"fireworks.plist"];
//	asset.particleSystem.startColor = ccc4FFromccc3B( ccRED );
	asset.action = [AccelerateMotion actionWithDuration:1.6 initialSpeed:ccp(0,0) acceleration:ccp(0,-500) rotationSpeed:-360*2];
	[assets addObject:asset ];
	[self addChild:asset];
	
	asset = [Asset assetWithSpriteName:@"small-chip"];
	asset.begin = 69;
	asset.end = 79;	
	asset.position = ccp(88,286);
	asset.sndEffect = @"chispas-short.caf";
	asset.particleSystem = [CCParticleSystemPoint particleWithFile:@"fireworks.plist"];
	asset.particleSystem.startColor = ccc4FFromccc3B( ccYELLOW );
	asset.action = [AccelerateMotion actionWithDuration:1.6 initialSpeed:ccp(0,0) acceleration:ccp(0,-500) rotationSpeed:-360*3];
	[assets addObject:asset ];
	[self addChild:asset];
	
	asset = [Asset assetWithSpriteName:@"small-chip"];
	asset.begin = 80;
	asset.end = 89;	
	asset.position = ccp(378,286);
	asset.sndEffect = @"chispas-short.caf";
	asset.particleSystem = [CCParticleSystemPoint particleWithFile:@"fireworks.plist"];
	asset.particleSystem.startColor = ccc4FFromccc3B( ccYELLOW );
	asset.action = [AccelerateMotion actionWithDuration:1.6 initialSpeed:ccp(0,0) acceleration:ccp(0,-500) rotationSpeed:-360*4];
	[assets addObject:asset ];
	[self addChild:asset];

	asset = [Asset assetWithSpriteName:@"broken-screen"];
    asset.visible = NO;
    asset.sprite.opacity = 0;
	asset.position = ccp(240,160);
    asset.action = [CCSequence actions:
                    [CCShow action], 
                    [PlayEffect actionWithFile:@"breaking-ice.caf"],
                    [CCFadeTo actionWithDuration:0.1 opacity:50],
                    [CCDelayTime actionWithDuration:0.8],
                    [CCFadeTo actionWithDuration:0.1 opacity:150],
                    [CCDelayTime actionWithDuration:0.9],
                    [CCFadeTo actionWithDuration:0.1 opacity:255],
                    nil];
	[assets addObject:asset ];
	[self addChild:asset];

}

-(void) setPhase:(int) newPhase
{
    while (--newPhase) {
        Asset *asset = [assets objectAtIndex:0];
        [assets removeObject:asset];
        [self removeChild:asset cleanup:YES];
    }
}

-(Asset*) currentAsset
{
    if (assetIndex < [assets count] ) {
        return [assets objectAtIndex:assetIndex];
    } else {
        return nil;
    }
}

-(Asset*) lastAsset
{
        return [assets objectAtIndex:([assets count]-1)];
}


#pragma mark Alarm Management

-(void) turnAlarmOn
{
	if (!alarmOn && ![self isAllAssetsDone]){
		alarmOn = YES;
		[timeLabel runAction:[CCBlink actionWithDuration:8.0f blinks:9.0] ];
		[self runAction: [CCRepeatForever actionWithAction:
						  [CCSequence actions:
						   [CCCallFunc actionWithTarget:self selector:@selector(playAlarmSound)]
						   ,[CCDelayTime actionWithDuration:1.5f]
						   ,nil ] ] ];
	}
}

-(void) turnAlarmOff
{
	if (alarmOn) {
		[timeLabel stopAllActions];
		timeLabel.opacity = 255;
		timeLabel.visible = YES;
		[self stopAllActions];
		alarmOn = NO;
	}
}

-(void) playAlarmSound
{
	[[SimpleAudioEngine sharedEngine] playEffect:@"emergency.caf"  pitch:1.0f pan:0.0f gain:0.79f];
}
						   
@end

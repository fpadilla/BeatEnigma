//
//  GameMechanics.m
//  iNigma
//
//  Created by Francisco Padilla on 4/15/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "GameMechanics.h"
#import "PopupLayers.h"
#import "Animation.h"
#import "UserTracking.h"
#import "GameCenter.h"
#import "AdManager.h"
#import "SymbolSprite.h"
#import "DoubleScore.h"
#import "Laser.h"

#import "Appirater.h"

@implementation GameMechanics

@synthesize trackWidth, tracksLayer, buttonLayer, machine, levelName, levelIndex, generator, isRunning, phase, mode, extraTime, turnRule, earnedTurns, earnedCoins;

static BOOL isTimeEnabled;

static GameMechanics *sharedGame;

-(id) initWithParameters:(NSDictionary *)parameters
{
	NSAssert(sharedGame == nil , @"Two GameMechanic Instance");
	
	self = [self init];
	
	timeOut = [[parameters objectForKey:@"timeOut"] intValue];
	rows = [[parameters objectForKey:@"rows"] intValue];
#if TARGET_IPHONE_SIMULATOR
	multiplier = 100;
#else
	multiplier = 1;
#endif
    totalScore = 0;
	particleSystemFile = @"basic.plist";
	phase = 0;
	isTimeEnabled = YES;
	status = RUNING;
	difficulty = 1.1f;
	turns = 0;
	NSAssert(rows != 0, @"rows paramerter not specified in configuration file");
	
	machineSensitivity = [[parameters objectForKey:@"machineSensitivity"] floatValue];
	
	elapsedTime = 0;
	if (timeOut) {
		elapsedTime = timeOut;
	}
		
	if ( [parameters objectForKey:@"symbolGeneration"] != nil ) {
		CCSpriteFrameCache* frameCache = [CCSpriteFrameCache sharedSpriteFrameCache]; 
		[frameCache addSpriteFramesWithFile:[parameters objectForKey:@"symbolGeneration"]];
		
	}
	
	if ([[parameters objectForKey:@"portraitOrientation"] intValue] == 1 ) { // Default orientation is landscape
		[[CCDirector sharedDirector] setDeviceOrientation:kCCDeviceOrientationPortrait ];
	} else {
        ccDeviceOrientation interfaceOrientation = [[CCDirector sharedDirector] deviceOrientation];
        if( interfaceOrientation == UIInterfaceOrientationPortrait || interfaceOrientation == UIInterfaceOrientationPortraitUpsideDown ) {
		}
	}
	
	machine = [[Machine alloc] initWithParameters:parameters] ;
	tracksLayer = [[[TracksLayer alloc] initWithParameters:parameters ] autorelease];
	
	// create scene and add layers
	scene = [CCScene node]; 
	[scene addChild:machine.backLayer];
	[scene addChild:tracksLayer z:0 tag:KGameLayer ];
	[scene addChild:machine.frontLayer ];
    buttonLayer = [[ButtonLayer alloc] initButtonLayer];
    [scene addChild:buttonLayer];

    // power ups
    doubleScore = [[DoubleScore alloc] initWithGame:self] ;
    slowMotion = [[SlowMotion alloc] initWithGame:self] ;
                  
	// Strike gesture 
	strikeGesture = [[StrikeGesture alloc] init];
	strikeGesture.enabled = YES;
	strikeGesture.tracks = tracksLayer.tracks;
	strikeGesture.gameMechanics = self;
	[[CCTouchDispatcher sharedDispatcher] addTargetedDelegate:strikeGesture priority:0 swallowsTouches:YES ];
	
	[[CCDirector sharedDirector] replaceScene:scene ];
	
    // testing
    //mode = BLITZ;
    mode = [[parameters objectForKey:@"mode"] intValue];
    
	isRunning = YES;
    if (mode == BLITZ) {
        [[CCScheduler sharedScheduler] scheduleSelector:@selector(updateTime:) forTarget:self interval:1/30 paused:!isRunning ];
        [[CCScheduler sharedScheduler] scheduleSelector:@selector(checkGameOver) forTarget:self interval:1 paused:!isRunning ];
    }
    
	// load level parameters
	NSString *fullpath = [[NSBundle mainBundle] pathForResource:@"PhaseParameters.plist" ofType:nil ];
    phaseProperties = [NSArray arrayWithContentsOfFile:fullpath] ;
    [phaseProperties retain];

    generator = [[HitGenerator alloc] initWithTracks:tracksLayer.tracks rows:rows];
    if ( mode != BLITZ ) {
     //   [self updatePhaseParameters ];
    }
    HitGenerator.randSymbString = @"_RJ";
	
    machine.damagePercent = 0;
    HitGenerator.randomAlphabet = @"DEFB";
    [generator initSymbolArrays:180];
    [generator reset];
    generator.generationIndex = 0;
    generator.timeUpIndex = 20;
    generator.minHits = 2;
    [generator generateHits:90];
    Track.random2spaceRatio = 1;
    
    
    currentSndEffect = @"enchant.caf";
    alarmTime = 3;
    generator.trioStairRatio = 50;
    
    switch (mode) {
        case CLASSIC:
            [machine.frontLayer updateScoreLabel:minHits level:phase];
            break;
            
        case TIMELESS:
            HitGenerator.randSymbString = @"JM";
            timeOut = 0;
            elapsedTime = 0;
            [self addTurns:15];
            [machine.frontLayer showPhaseLabel:@"15 Turns" delay:1.2];
            [machine.frontLayer updateScoreLabel:totalScore multiplier:multiplier];
            [[CCScheduler sharedScheduler] scheduleSelector:@selector(generateHitsInBackground) forTarget:generator interval:1 paused:!isRunning ];
            [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(stopTimeLess) name:@"TRACK_PAUSE" object:nil];
            [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(endGameLogic) name:@"END_TRACK_PAUSE" object:nil];
            [self changePauseTracks:0.5];

            break;
            
        case BLITZ:
            [machine.frontLayer updateScoreLabel:totalScore multiplier:multiplier];
            [machine.frontLayer showPhaseLabel:@"60 seconds" delay:1];
            hits = 0;
            // jokerTime = 4;
            
            [tracksLayer setSpeeds:[NSArray arrayWithObjects:
                                    [NSNumber numberWithFloat:-hightSpeed], [NSNumber numberWithFloat:middleSpeed], [NSNumber numberWithFloat:-middleSpeed/2],
                                    [NSNumber numberWithFloat:+middleSpeed/2], [NSNumber numberWithFloat:-middleSpeed],[NSNumber numberWithFloat:hightSpeed],[NSNumber numberWithFloat:-hightSpeed],
                                    nil ] ];
            [self changePauseTracks:1.5];
            Track.random2spaceRatio = 1;

            
            currentSndEffect = @"enchant.caf";
            alarmTime = 3;
            elapsedTime = 60;
            generator.trioStairRatio = 50;
            
    }
    
	for (Track *track in tracksLayer.tracks) {
		[ track setupSprites ];
	}

    if (mode==TIMELESS) {
        [[SimpleAudioEngine sharedEngine] playBackgroundMusic:@"codebreaker.mp3" loop:YES];
    } else {
        [[SimpleAudioEngine sharedEngine] playBackgroundMusic:@"The Higher Mountain.mp3" loop:NO];
    }
    
    if ([SimpleAudioEngine sharedEngine].backgroundMusicVolume > 0){
        [[SimpleAudioEngine sharedEngine] setBackgroundMusicVolume:0.5];
    }
    
	[[UserTracking sharedUserTracking] Log:START_PLAY];	
    
#ifdef GameTesting
	gameTest = [[GameTest alloc] initWithGame:self];
#endif
    RuleBlock block = ^(id engine) {
        [self placeSpecialSymbol:'Q'];
    };
    SpeedRule *rule = [SpeedRule ruleWithRatio:(mode==BLITZ?16:20) block:block];

    [[RewardEngine sharedInstance] addRule:rule];
    [block release];

    block = ^(id engine) {
        [self placeSpecialSymbol:'M'];
    };    
    rule = [SpeedRule ruleWithRatio:22 block:block];
    [[RewardEngine sharedInstance] addRule:rule];
    [block release];
    
    // Timeless turns
    if (mode==TIMELESS) {
        block = ^(id engine){
            [self addTurns:1];
            self.turnRule.ratio = (self.machine.frontLayer.assetIndex + 1) * 37;
            NSLog(@"Turn Ratio: %i", self.turnRule.ratio);
        };
        turnRule = [RewardRule ruleWithRatio:37 vratio:0 block:block];
        [[RewardEngine sharedInstance] addRule:turnRule];
        [block release];
    }
    
    powerUps = [[NSMutableArray arrayWithCapacity:10] retain];
    
	sharedGame = self;

	return self;
}

+(id) sharedGame
{
	return sharedGame;
}

-(void) dealloc
{
    [[CCTouchDispatcher sharedDispatcher] removeDelegate:strikeGesture];
	[strikeGesture release];
    //NSLog(@"strikeGesture count %i", [StrikeGesture retainCount]);
	[machine release];
    [phaseProperties release];
    
    [doubleScore release];
    [slowMotion release];
    [generator release];
	//[scene release]; cannot release, cocos2d does

	sharedGame = nil;
	[super dealloc];
    NSLog(@"GameMechanics Dealloc:");
}

-(void) stopTimeLess
{
    [tracksLayer stop];
    strikeGesture.enabled = YES;
}

-(void) stop
{
    [self pause];
    [[CCScheduler sharedScheduler] unscheduleAllSelectorsForTarget:self];
    [[RewardEngine sharedInstance] removeAllRules];
    int count = [self retainCount];
    [Laser removeAll]; // Just in case for Timeless mode
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    [[NSNotificationCenter defaultCenter] removeObserver:tracksLayer];
    //NSLog(@"Stop GameMechanics %i retian count:", count);
}

-(void) pause
{
#ifndef LITE_VERSION
	[tracksLayer stop];
#endif
    buttonLayer.visible = NO;
	[[CCScheduler sharedScheduler] pauseTarget:self];
	[[CCScheduler sharedScheduler] pauseTarget:machine];
	[[SimpleAudioEngine sharedEngine] pauseBackgroundMusic];
	strikeGesture.enabled = NO;
	[machine.frontLayer turnAlarmOff];
	isRunning = NO;
}

-(void) resume
{
#ifndef LITE_VERSION
	[tracksLayer run];
#endif
    buttonLayer.visible = YES;
	[[CCScheduler sharedScheduler] resumeTarget:self];
	[[CCScheduler sharedScheduler] resumeTarget:machine];
	[[SimpleAudioEngine sharedEngine] resumeBackgroundMusic];
	strikeGesture.enabled = YES;
	isRunning = YES;
}

+(id) loadResources
{
	// Sprites
	CCSpriteFrameCache* frameCache = [CCSpriteFrameCache sharedSpriteFrameCache]; 
	[frameCache addSpriteFramesWithFile:@"GameScene.plist"];
	
	// Sound
	[[SimpleAudioEngine sharedEngine] preloadEffect:@"enchant.caf"];
	[[SimpleAudioEngine sharedEngine] preloadEffect:@"Space vehicle launch.caf"];
	[[SimpleAudioEngine sharedEngine] preloadEffect:@"Photon gun shot.caf"];
	[[SimpleAudioEngine sharedEngine] preloadEffect:@"chispas-short.caf"];
	[[SimpleAudioEngine sharedEngine] preloadEffect:@"chispas.caf"];
	[[SimpleAudioEngine sharedEngine] preloadEffect:@"Fusion shots.caf"];
	[[SimpleAudioEngine sharedEngine] preloadEffect:@"fan-stop.caf"];
	[[SimpleAudioEngine sharedEngine] preloadEffect:@"breaking-ice.caf"];

	[[SimpleAudioEngine sharedEngine] preloadEffect:@"disenchant.caf"];
    [[SimpleAudioEngine sharedEngine] preloadEffect:@"explosion.caf"];
    [[SimpleAudioEngine sharedEngine] preloadEffect:@"end_explosion.caf"];
	[[SimpleAudioEngine sharedEngine] preloadEffect:@"emergency.caf"];
	[[SimpleAudioEngine sharedEngine] preloadBackgroundMusic:@"The Higher Mountain.mp3"];
    [[SimpleAudioEngine sharedEngine] preloadBackgroundMusic:@"codebreaker.mp3"];
//	[[SimpleAudioEngine sharedEngine] preloadBackgroundMusic:@"Autobahn-Loophead.mp3"];	
}

-(int) turns
{
    return turns;
}

-(void) setTurns:(int) newTurn
{
    turns = newTurn;
    [machine.frontLayer updateTurnLabel:turns];
    [machine.backLayer updateProgressMeter:turns/15.0];
}

-(void) addTurns:(int) newTurns
{
    earnedTurns += newTurns;
    self.turns = turns + newTurns; // why self.turns += newTurns doesn't work?
}

#pragma mark Game Symbol Validation Logic

-(BOOL) validateSymbolSprites:(NSMutableArray*) spriteSymbols withSubHits:(BOOL) subHits
{
	unichar trioCharacter = 0;
	int trioCount = 0;
	int totalSprites = 0; // number of contiguous sprites
	BOOL startedSegment = NO;
    int subHitsCount = 0;
	NSMutableDictionary *stairDict  = [[NSMutableDictionary alloc] initWithCapacity:4 ];	
    NSMutableArray *trioSprites = [NSMutableArray arrayWithCapacity:3];
    NSMutableArray *stairSprites = [NSMutableArray arrayWithCapacity:4];
        
    for (SymbolSprite *sprite in spriteSymbols) {
		
        if ( (sprite.symbol.character == '_' || !sprite.symbol.enabled) &&
            startedSegment && !subHits) {
			break;
		} 
 
        startedSegment = YES;
        totalSprites++;
        Symbol *currentSymbol = sprite.symbol;
        
        // Look for trios             
        // start evaluating for joker  and matches if any           
        if ( [self isJokerCharacter:currentSymbol.character] || trioCharacter == currentSymbol.character ) {

        } else if ( ! trioCharacter ) { // if there is not character defined then assing it
            trioCharacter = currentSymbol.character;
        }  else {           //if not restart with current character
            if (subHits && [trioSprites count] >=3) {
                //NSLog(@"trio subHit of %i", [trioSprites count]);
                [self accountTrio:trioSprites trioCharacter:trioCharacter];
                subHitsCount++;
            }
            trioCharacter = currentSymbol.character; 
            [trioSprites removeAllObjects];
        }
        [trioSprites addObject:sprite];
        
        // Look for stair
        NSString *keyString = [NSString stringWithFormat:@"%C", currentSymbol.character];
        if ( ! [stairDict objectForKey:keyString] ) {
                [stairSprites addObject:sprite];
                [stairDict setObject:[NSNumber numberWithInt:1] forKey:keyString ];
        } else { // There is a duplicated symbol of current symbols
            // check for stair subhit
            if (subHits && [stairSprites count] >= 4) {
                [self  accountStair:stairSprites];
                subHitsCount++;
            }

            // Search for duplicated symbol index
            int duplicatedIndex = 0;
            for (SymbolSprite *sprite in stairSprites) {
                duplicatedIndex++;
                if (sprite.symbol.character == currentSymbol.character) {
                    break;
                }
                [stairDict removeObjectForKey:[NSString stringWithFormat:@"%C", sprite.symbol.character]];
            }
            // remove until first duplicate
            //NSLog(@"Deleting from 0 to %i because %C ", duplicatedIndex, trioCharacter);
            [stairSprites removeObjectsInRange:NSMakeRange(0, duplicatedIndex)];
            [stairDict setObject:[NSNumber numberWithInt:1] forKey:keyString ];
        }

	} // for tracks

    if (subHits) {
        if ( [stairSprites count] >= 4) {
            [self  accountStair:stairSprites];
            subHitsCount++;
        }
        
        if ( [trioSprites count] >=3 ) {
            [self accountTrio:trioSprites trioCharacter:trioCharacter];
            subHitsCount++;
        }
        
        return subHitsCount > 0;
    } else {

        BOOL stairMatch = ([stairSprites count]>=4) && [stairSprites count]==totalSprites;
        BOOL trioMatch  = ([trioSprites  count]>=3) && [trioSprites  count]==totalSprites;

        if (trioMatch) {
            [self accountTrio:trioSprites trioCharacter:trioCharacter];
        } 
        if (stairMatch){
            [self accountStair:stairSprites];
        }
        
        BOOL result = stairMatch || trioMatch;            
        return result;
    }    
}

-(void) rewardSprites:(NSArray*) sprites
{
    for (SymbolSprite *sprite in sprites) {
        
        if (!sprite.symbol.enabled) {
           continue; // next sprite
        }
        sprite.symbol.enabled = NO;
        sprite.symbol.index++;
        CGPoint labelPosition = ccp(sprite.position.x, sprite.position.y - 20);
        switch (sprite.symbol.character) {
            case 'Q': [self increaseMultiplier:sprite.position];
                [[SimpleAudioEngine sharedEngine] playEffect:@"explosion.caf" pitch:1.0595 pan:0 gain:0.5];
                break;
            case 'R': [self rewardTimeSymbol:sprite.position];
                break;
            case 'P': [tracksLayer jokerRow:sprite];
                [machine.frontLayer showParticules:@"specialSymbol.plist" atLocation:ccp(240, sprite.position.y) 
                                          variance:ccp(200,2)];
                [[SimpleAudioEngine sharedEngine] playEffect:@"explosion.caf" pitch:1.0 pan:0 gain:0.45];
                [[RewardEngine sharedInstance] addInput:7];
                [self addPoints:7*25*multiplier];
                [machine.frontLayer showPointLabel:[NSString stringWithFormat:@"%i", 7*25*multiplier] atLocation:labelPosition color:ccWHITE];
                
                break;
            case 'O': [tracksLayer jokerColumn:sprite];
                [machine.frontLayer showParticules:@"specialSymbol.plist" atLocation:ccp(sprite.position.x, 160) 
                                          variance:ccp(20,100)];
                [[SimpleAudioEngine sharedEngine] playEffect:@"explosion.caf" pitch:1.0 pan:0 gain:0.45];
                [[RewardEngine sharedInstance] addInput:4];
                [self addPoints:4*25*multiplier];
                [machine.frontLayer showPointLabel:[NSString stringWithFormat:@"%i", 4*25*multiplier] atLocation:labelPosition color:ccWHITE];
                break;
            default:
                // re-enable ordinary symbols
                [sprite disableByTime:tracksLayer.pausedTime*2.0/3];
                break;
                
        }// switch
        [sprite updateSpriteFrame];
        
        [[RewardEngine sharedInstance] calculateSpeed];
        float newTrackPause = 0.5;
        if (mode == BLITZ) {
             newTrackPause =  1.5 - [[RewardEngine sharedInstance] speed] / 18;
            [self changePauseTracks:newTrackPause];
        }
    }
}

-(void) rewardTimeSymbol:(CGPoint) position
{
    position = ccp(position.x, position.y - 20);
    if (mode==BLITZ) {
        [self increaseElapsedTime:2];
        [machine.frontLayer showPointLabel:[NSString stringWithFormat:@"%is", 2] atLocation:position color:ccWHITE];
    }else{
        [self addTurns:1];
        [machine.frontLayer showPointLabel:[NSString stringWithFormat:@"%i turn", 1]
                                atLocation:ccp(position.x, position.y - 20)
                                     color:ccWHITE];
    }
}

-(void) increaseElapsedTime:(float)time
{
    if (elapsedTime > 0) {
        elapsedTime += time; 
        extraTime += time;
    }
}

-(void) increaseMultiplier:(CGPoint) location
{
    multiplier++;
    
    //NSLog(@"New Multiplier %i", multiplier);
    [machine.frontLayer showPointLabel:[NSString stringWithFormat:@"%ix", multiplier] atLocation:location color:ccWHITE];
    [machine.frontLayer showParticules:@"multiplier.plist" atLocation:location variance:ccp(0,0)];
}

-(BOOL) isJokerCharacter:(char) character
{
    if ( character == 'J' || character == 'O' || character  == 'P' || character == 'Q' || character == 'R' ) {
        return TRUE;
    }
    return FALSE;
        
}

-(void) accountStair:(NSArray*)sprites
{
    //NSLog(@"stair of %i", [sprites count]);
    [[RewardEngine sharedInstance] addInput:[sprites count]];

    CGPoint position = [self avgPosition4Sprites:sprites];
    int totalSprites = [sprites count];
    [self addHits: (totalSprites - 3) ];
    
	int totalPoints = 50 * multiplier * (doubleScore.actived?2:1)*(totalSprites-3);
    /*NSString *labelString = [NSString stringWithFormat:@"+%i",totalPoints];
    switch (totalSprites) {
        case 5:
            labelString = [NSString stringWithFormat:@"Oh no! +%i",totalPoints];
            break;
        case 6:
            labelString = [NSString stringWithFormat:@"Lucky! +%i",totalPoints];
            break;
        default:
            break;
    }
	[machine.frontLayer showPointLabel:labelString atLocation:position color:ccYELLOW];	*/
	[self addPoints:totalPoints ];

	[ self runEffect:'*' atPosition:position withVar: 51*totalSprites ];
    [self rewardSprites:sprites];
    
    [self placeSpecialSymbol:'R' atSprites:sprites]; // Turn or 2 seconds

	
}


-(void) accountTrio:(NSArray *) sprites trioCharacter:(unichar)trioCharacter
{
    //NSLog(@"trio of %i", [sprites count]);
    int totalSprites = [sprites count];

    [[RewardEngine sharedInstance] addInput:[sprites count]];
    
    [self addHits: (totalSprites - 2 ) ];
    CGPoint position = [self avgPosition4Sprites:sprites];

	[ self runEffect:trioCharacter atPosition:position withVar:51.5*(totalSprites -1) ];
	
    ccColor4B color = [GameMechanics color4type:trioCharacter];
    
	if (trioCharacter =='R' && mode != TIMELESS) {
		elapsedTime += liveHitValue;
		if (generator != nil) {
			generator.timeUpIndex += liveHitValue/2.4;
		}
		[machine.frontLayer showPointLabel:[NSString stringWithFormat:@"%is", liveHitValue] atLocation:position color:ccc3(color.r, color.g, color.b) ];
	} else {
		int totalPoints = 25 * multiplier * (doubleScore.actived?2:1) * (totalSprites-2);
        NSString *labelString = [NSString stringWithFormat:@"%i",totalPoints];
        [machine.frontLayer showPointLabel:labelString atLocation:position color:ccc3(color.r, color.g, color.b)];
		[self addPoints:totalPoints ];
        [self rewardSprites:sprites];
                
        switch (totalSprites) {
            case 4:
                labelString = [NSString stringWithFormat:@"Argh! +%i",totalPoints];
                //[doubleScore startEffect];
                [self placeSpecialSymbol:'O' atSprites:sprites];
                break;
            case 5:
                labelString = [NSString stringWithFormat:@"Ouch! +%i",totalPoints];
                [self placeSpecialSymbol:'P' atSprites:sprites];                
                //[slowMotion startEffect];
                break;
            case 6:
                labelString = [NSString stringWithFormat:@"Damn! +%i",totalPoints];
                [self placeSpecialSymbol:'P' atSprites:sprites];                
                //[self explodeAllScreenSymbols];
                break;
            default:
                break;
        }
        
	}
}

-(void) runEffect:(unichar)typeEffect atPosition:(CGPoint) position withVar:(float) posVariance
{
	switch (typeEffect) {
		case 'B': 
		case 'D':
		case 'E':
		case 'F':
		case 'X':
		case 'Y':
		case 'Z':			
		case 'W':
		case 'V':			
			particleSystemFile = @"suck.plist";
			break; // phase 3
		case 'R':
			particleSystemFile = @"basic.plist";
			break;
		case '*':
			particleSystemFile = @"joker.plist";
			break;
		default:
			break;
	}
	
	CCParticleSystemPoint *hitParticles = [CCParticleSystemPoint particleWithFile:particleSystemFile];

    // if variance < 51 ( explode all symbols) 
	if ( posVariance < 51 ) {
		hitParticles.totalParticles = hitParticles.totalParticles / 3;
		hitParticles.duration = hitParticles.duration / 3;
	} else if (doubleScore.actived) {
		hitParticles.speed = 8 * hitParticles.speed;
	}

    ccColor4B color = [GameMechanics color4type:typeEffect];
	hitParticles.startColor = ccc4FFromccc4B( color );
	hitParticles.position = position;
	hitParticles.posVar = CGPointMake(posVariance, 0 );	
	hitParticles.autoRemoveOnFinish = YES;
	[machine.frontLayer addChild: hitParticles];

}

-(void) playHitSound
{
    float pitch =  powf(1.0595, (int) ([[RewardEngine sharedInstance] speed]/6) );
    //NSLog(@"pitch %f", pitch);
	[[SimpleAudioEngine sharedEngine] playEffect:currentSndEffect pitch:pitch pan:0 gain:0.7];
}

ccColor4B startColor;
+(ccColor4B) color4type:(char) character
{
	switch (character) {
            // blue
		case 'B':   startColor = ccc4(0x00, 0xEF, 0xEF, 255);   break;
            // red
        case 'X':
		case 'D':	startColor = ccc4(0xFF, 0x91, 0x94, 255);   break;
            // green 
        case 'W':
        case 'V':
        case 'Y':
		case 'E':	startColor = ccc4(0x30, 0xF7, 0x01, 255);	break;
            // yellow
        case 'Z':
		case 'F':	startColor = ccc4(0xF7, 0xF4, 0x80, 255);	break;
            
            // white
		case 'R':	startColor = ccc4(0xFF, 0xFF, 0xFF, 255);	break;
		default:	startColor = ccc4(0x28, 0xA2, 0xA4, 128);	break;
	}
    return startColor;
}

-(CGPoint) avgPosition4Sprites:(NSArray*) sprites
{
	// calculate average position for point label
	CGPoint averagePosition = CGPointZero;
	int count = 0;
	for (CCSprite *sprite in sprites ){
		if ( sprite!= nil){
			averagePosition = CGPointMake(averagePosition.x + sprite.position.x, 
										   averagePosition.y + sprite.position.y);
			count += 1;
		}
	}
	
	return CGPointMake(averagePosition.x / count, averagePosition.y / count );
}

-(void) placeSpecialSymbol:(char) type
{
    int trackIndex = arc4random()  % [tracksLayer.tracks count];
    Track *track = [tracksLayer.tracks objectAtIndex:trackIndex];
    int currentIndex = track.index;
    if ( currentIndex + 2 < [track.symbols count] ){
        Symbol *symbol = [track.symbols objectAtIndex:currentIndex+2 ];
        symbol.character = type;
        //NSLog(@"%C symbol placed --->>> track %i", type, trackIndex);
        
    }
}

-(void) placeSpecialSymbol:(char) type atSprites:(NSArray*) sprites
{
    int index = arc4random()  % [sprites count];
    SymbolSprite *sprite = [sprites objectAtIndex:index];
    sprite.symbol.character = type;
    sprite.symbol.enabled = YES;
    sprite.symbol.index = 0;
    [sprite updateSpriteFrame];
    //NSLog(@"%C symbol placed --->>> ", type);
}

#pragma mark Game and Phase Parameters

-(void) checkGameOver //:(ccTime) dt
{
	if (timeOut > 0 && elapsedTime <= alarmTime && alarmTime>0 && isTimeEnabled) {
		[machine.frontLayer turnAlarmOn];
	} else if( timeOut > 0 ){
		[machine.frontLayer turnAlarmOff];
	}
		
	if ( elapsedTime <= 0 && timeOut > 0  && machine.damagePercent < 1 && isTimeEnabled) {
        
        strikeGesture.enabled = NO;
        [[CCScheduler sharedScheduler] unscheduleSelector:@selector(updateTime:) forTarget:self];
        [[CCScheduler sharedScheduler] unscheduleSelector:@selector(checkGameOver) forTarget:self];

        [machine.frontLayer updateTimeLabel:0];
        [tracksLayer stop];
        // display time up label if machine is not broken include effect
        [machine.frontLayer showPhaseLabel:@"Conection Lost" delay:1.7];
        phase = machine.frontLayer.assetIndex;
        [machine.backLayer showEmoticonStatus: phase/18.0];

        // end special symbols
        [scene runAction:[CCSequence actions:
                                       [CCDelayTime actionWithDuration:1.7],
                                       [CCCallFunc actionWithTarget:tracksLayer selector:@selector(endSpecialSymbols)],
                                       [CCCallFunc actionWithTarget:tracksLayer selector:@selector(run)],
                                       nil] ];
        
        // wait for lasers and show dialog layer
        [[CCScheduler sharedScheduler] scheduleSelector:@selector(endGameLogic) forTarget:self interval:2.3 paused:NO];
                
	}
}

-(void) endGameLogic
{
    if (mode == BLITZ) {
        if ( [Laser count] > 0 ) // wait for laser to finish
        {
            return;
        }
        buttonLayer.visible = NO;
        [[CCScheduler sharedScheduler] unscheduleSelector:@selector(endGameLogic) forTarget:self];
    } else if (mode == TIMELESS){
        
        [[RewardEngine sharedInstance] reset];
        if (turns<=3 && turns>0) {
            [[SimpleAudioEngine sharedEngine] playEffect:@"emergency.caf"  pitch:1.0f pan:0.0f gain:1.25-1/4*turns ];
        }
        
        if (turns>0) {
            return;
        }
        buttonLayer.visible = NO;

        // display time up label if machine is not broken include effect
        [machine.frontLayer showPhaseLabel:@"Conection Lost" delay:1.7];
        phase = machine.frontLayer.assetIndex;
        [machine.backLayer showEmoticonStatus: phase/18.0];
    }

    [self pause];
    
#ifdef AutoLevelUp
    machine.damagePercent = 1.0f;
    [self stopPlayingFor:0];
    return;
#endif
    
    if (phase >= 4) {
        [Appirater userDidSignificantEvent:YES];
    }
    
    earnedCoins = phase*2;
    
    if (mode==BLITZ)
        earnedCoins += extraTime/2;
    else
        earnedCoins += earnedTurns;
    
    [[UserTracking sharedUserTracking] addCoins:earnedCoins withSubject:@"GAME_PLAYED"];
    
    if ( [machine.frontLayer isAllAssetsDone] ) {
        [[machine.frontLayer currentAsset] fireEffects];
        phase++;
        [self endGame];
    } else {
#ifdef LITE_VERSION
        [[AdManager sharedAdMgr] disable];
        [scene runAction:[CCSequence actions:
                          [CCDelayTime actionWithDuration:2.5],
                          [CCCallFunc actionWithTarget:self
                                              selector:@selector(showInterstitial)], nil]];
#endif
        [PopupLayers levelTimeUp:totalScore bonus:0];        
    }
    if (mode==BLITZ) {
        [[GameFlow sharedGameFlow] reportAchievementIdentifier:@"grp.4000" percentComplete: phase/18.0];
    } else {
        //[[GameFlow sharedGameFlow] reportAchievementIdentifier:@"6000" percentComplete: phase/18.0];
    }

    [[UserTracking sharedUserTracking] Log:END_PLAY points:totalScore phase:phase time:elapsedTime];
    [[GameCenter sharedGameCenter] performSelectorInBackground:@selector(sendUnreportedObjects) withObject:nil];

}

-(void) showInterstitial
{
#ifdef LITE_VERSION
    if ( [[Chartboost sharedChartboost] hasCachedInterstitial] ) {
        [[Chartboost sharedChartboost] showInterstitial];
    }
#endif
}

-(void) updateTime:(ccTime) dt
{
	
#ifdef GameTesting
	[gameTest update:dt];
#endif
	
	if ( isTimeEnabled ) {
		if ( timeOut ) {
			elapsedTime -= slowMotion.actived ? dt*TIME_SLOW_FACTOR : dt;
		} else {
			elapsedTime += slowMotion.actived ? dt*TIME_SLOW_FACTOR : dt;
		}
	}
	
	[machine.frontLayer updateTimeLabel:elapsedTime];
    [machine.backLayer updateProgressMeter:elapsedTime/60.0];
	int currentStep = tracksLayer.symbolIndex;
	
	[ self udpateDebugLabel ];
}

-(void) turnPowerUpsOff
{
    [tracksLayer run];
    isTimeEnabled = true;

    // slow motion 
    [slowMotion stopEffect];
    [doubleScore stopEffect];
}

-(void) updatePhaseParameters
{
	hits = 0;
	machine.damagePercent = 0;
	[generator reset];
	generator.generationIndex = 0;
	[generator initSymbolArrays:80];	
	[tracksLayer reset];
	tracksLayer.symbolIndex = -1;
	generator.timeUpIndex = 20;
	currentSndEffect = @"enchant.caf";
	alarmTime = 6;
	    
	int totalHits = 20;
	int extraHits = 0; // if not zero then generate extraHits and trio of time character.
	if (phase == 0) {
		phase = 1;
        //[machine.frontLayer setPhase:phase];
	} else {
        tracksLayer.symbolIndex = -5 ;
    }
	multiplier = phase;

    // update parameter from configuration file
    NSDictionary *parameters = [phaseProperties objectAtIndex: phase-1];
    totalHits = [[parameters objectForKey:@"totalHits"] integerValue];
    extraHits = [[parameters objectForKey:@"extraHits"] integerValue];
    minPerformance = [[parameters objectForKey:@"minPerformance"] floatValue];
    Track.random2spaceRatio = [[parameters objectForKey:@"random2spaceRatio"] floatValue];
    HitGenerator.randomAlphabet = [parameters objectForKey:@"randomAlphabet"] ;
    generator.minHits = [[parameters objectForKey:@"minHits"] integerValue];;
    generator.liveHitCount = [[parameters objectForKey:@"timeHits"] integerValue];
    generator.jokerHitCount = [[parameters objectForKey:@"jokerHits"] integerValue];
    generator.jokerInterval = [[parameters objectForKey:@"jokerInterval"] integerValue];
    phaseMsg = [[parameters objectForKey:@"phaseMessage"] retain];
    [self changePauseTracks:[[parameters objectForKey:@"trackPause"] floatValue]];
    if ( [[parameters objectForKey:@"speeds"] isKindOfClass:[NSArray class]] ) {
        [tracksLayer setSpeeds:[parameters objectForKey:@"speeds"] ];        
    } else {
        [tracksLayer setSpeed:[[parameters objectForKey:@"speeds"] floatValue]];
    }

    // calculate moveTime time for classic mode
    float moveTime = 51/tracksLayer.minSpeed + tracksLayer.pausedTime ;
    
    switch (mode) {
        case CLASSIC:
            elapsedTime = ceilf( (totalHits + (phase!=1?4:0) + 1) * moveTime + 1); // include adjustement for interphase transition
            minHits = minPerformance * totalHits * difficulty;
            if ( extraHits && mode == CLASSIC ) {
                generator.timeUpIndex = totalHits;
                if (generator.liveHitCount == 0) {
                    generator.liveHitCount = 1;
                }
                generator.liveInterval = extraHits;
                liveHitValue = extraHits * moveTime;
                alarmTime = liveHitValue/2;
                if ( alarmTime < 5 ) {
                    alarmTime = 5;
                }
            }
            break;
            
        case TIMELESS:
            elapsedTime = 0;
            minHits = totalHits * minPerformance;
            break;
    }
    
    slowMotion.defaultDuration = 4;
    doubleScore.defaultDuration = 4; //ceilf(generator.jokerInterval * moveTime);
    [generator generateHits: totalHits + extraHits*generator.liveHitCount  + rows ];
    		
#ifdef TestLevel
	elapsedTime += liveHitValue;
#endif
	
}

-(void) udpateDebugLabel
{
	machine.frontLayer.debugLabel.string = [NSString stringWithFormat:@"%i  %i.%i   %i.%i.%i  %i", 
											tracksLayer.symbolIndex, generator.liveIndex, generator.jokerIndex, 
											hits, (int)(minPerformance*generator.timeUpIndex), generator.timeUpIndex, phase];
}

-(void) changePauseTracks:(float) apause
{
	for (Track *track in tracksLayer.tracks) {
		track.pausedTime = apause;
	}
    
	tracksLayer.pausedTime = apause;
}

-(void) addHits:(int)newHits
{
    hits += newHits;
    [self playHitSound];
}

-(void) addPoints:(int) points
{
	totalScore += points;
    [self updateMachineStatus];
}

-(void) updateMachineStatus
{
    //if (mode == BLITZ) {
        [machine.frontLayer updateScoreLabel:totalScore multiplier:multiplier];
        [machine.frontLayer updateBlitzMachine:totalScore];
        return;
    //}
    /*machine.damagePercent = hits/(float)minHits;
    
    if (machine.damagePercent >= 1) { // start transition pause & fire assets effects 
        machine.damagePercent = 1;
        [self stopPlayingFor:0];
    } else {
        [machine.frontLayer updateAssets:machine.damagePercent];
        if (mode != BLITZ) {
            [machine.frontLayer updateScoreLabel:minHits-hits level:phase];
        }else {
            [machine.frontLayer updateScoreLabel:totalScore multiplier:multiplier];
        }
    }*/
    
}

#pragma mark End Game & Phase Transition

-(void) stopPlayingFor:(float)time
{
   	[machine.frontLayer updateScoreLabel:0 level:phase];
    
    [self turnPowerUpsOff];
    
#ifdef LITE_VERSION    
    //[[AdManager sharedAdMgr]  start];
    if (phase == 8) {
        [[machine.frontLayer lastAsset] fireEffects]; // fire screen broken effect
        [[UserTracking sharedUserTracking] Log:END_PLAY points:totalScore phase:phase time:elapsedTime];
        [machine.frontLayer turnAlarmOff];        

        [self endGame];
        return;
    }
#endif
    float rippleTime = 1.0;

    Asset *currentAsset = [machine.frontLayer currentAsset];
    float time4assetAction = [currentAsset.action duration];
    
    if (machine.frontLayer.isAllAssetsDone ) {
        [currentAsset fireEffects];
        [[UserTracking sharedUserTracking] Log:END_PLAY points:totalScore phase:phase time:elapsedTime];
        [self endGame];
        return;
    }

    // update for next asset
    [machine.frontLayer updateAssets:machine.damagePercent];
    
    // FIRE ASSETS EFFECTS    
    [currentAsset runAction:[CCSequence actions:
                             [CCDelayTime actionWithDuration:rippleTime]
                             ,[CCCallFunc actionWithTarget:currentAsset selector:@selector(fireEffects)]
                             ,nil] ];

    // INTER PHASE PAUSE
	isTimeEnabled = NO;
	[[CCScheduler sharedScheduler] pauseTarget:self];
	strikeGesture.enabled = NO;
	[tracksLayer stop];
	[tracksLayer setOpacity: 80];
    
	CCRipple3D *ripple = [CCRipple3D actionWithPosition:ccp(240,160) radius:300 waves:1 amplitude:50 grid:ccg(50,40) duration:rippleTime];
	[tracksLayer runAction:[CCSequence actions: 
					 ripple
					 ,[CCStopGrid action] 
					 //,[CCDelayTime actionWithDuration:time4assetAction]
					 ,[CCCallFunc actionWithTarget:self selector:@selector(resumeFromStopPlaying)]
					 ,nil ] ];

	[machine.backLayer showEmoticon:phase];
    [machine.frontLayer showPhaseLabel:phaseMsg delay:rippleTime];
    
	phase ++;
	[self updatePhaseParameters];
        
    // Alarm Stuff
    [machine.frontLayer turnAlarmOff];        
}

-(void) resumeFromStopPlaying
{
	[tracksLayer run];
	strikeGesture.enabled = YES;
	[tracksLayer setOpacity: 255];
	isTimeEnabled = YES;
	[machine.backLayer hideEmoticon];
	[[CCScheduler sharedScheduler] resumeTarget:self];
	[machine.frontLayer updateScoreLabel:minHits level:phase];
}

-(void) endGame {
    [self pause];
    //tracksLayer.visible = NO;
    //[[GameFlow sharedGameFlow] reportAchievementIdentifier:@"grp.4000" percentComplete:100.0];
    
    if (mode==BLITZ) {
        [[GameCenter sharedGameCenter] reportScore:totalScore forCategory:@"grp.HallOfFameBlitz"];
    } else {
        [[GameCenter sharedGameCenter] reportScore:totalScore forCategory:@"HallOfFameTimeless"];        
    }
    
    [machine.backLayer runAction:[CCSequence actions:
                                  [CCDelayTime actionWithDuration:5],
                                  [CCHide action], 
                                  nil] ];

    
    [machine.backLayer.emoticon runAction:[CCSequence actions: 
                                           [CCDelayTime actionWithDuration:0.5],
                                           [CCShow action],
                                           [CCFadeTo actionWithDuration:0 opacity:100],
                                           [CCFadeIn actionWithDuration:3], 
                                           nil] ]; 
    
    // end explosion
    //[machine.frontLayer.openedTop runAction:[CCTintBy actionWithDuration: 5 red:200 green:200 blue:200]];
    [machine.frontLayer runAction: [CCSequence actions:
                                    [CCDelayTime actionWithDuration:3] // pause before explosion broken sceen
                                    ,[PlayEffect actionWithFile:@"end_explosion.caf"]
                                    ,[ShowParticleSystem actionWithParticleSys:[CCParticleSystemPoint particleWithFile:@"end-explosion.plist"] updatePosition:NO]
                                    ,[CCExploteTiles actionWithSeed:3 grid:ccg(48*2.5,32*2.5) duration:5.5]
                                    , nil
                                    ] ];
    //[tracksLayer runAction:[CCFadeOut actionWithDuration:3.0]];
    [tracksLayer runAction:[CCSequence actions: 
                            [CCDelayTime actionWithDuration:5],
                            [CCHide action], 
                            nil] ];
#ifdef LITE_VERSION
    [scene runAction:[CCSequence actions:
                      [CCDelayTime actionWithDuration:8.0],
                      [CCCallFunc actionWithTarget:[Chartboost sharedChartboost]
                                          selector:@selector(showInterstitial)], nil] ];
#endif
    [PopupLayers levelSuccessLayer:8.5f score:totalScore];
    
    [[GameCenter sharedGameCenter] performSelectorInBackground:@selector(sendUnreportedObjects) withObject:nil];
    return;
}

#pragma mark Explote All Symbol efect

-(void) explodeAllScreenSymbols
{
	[tracksLayer stop];
	strikeGesture.enabled = NO;
	isTimeEnabled = NO;
	
	// collect noy empty sprites
	NSMutableArray *sprites4explote = [[NSMutableArray alloc] initWithCapacity:36];
	for (Track *track in tracksLayer.tracks ) {
		for (SymbolSprite *sprite in track.sprites) {
			if ( sprite.symbol != [Symbol emptySymbol] && ((Symbol*)sprite.symbol).enabled == YES ) {
				[sprites4explote addObject: sprite];
			}
		}
	}
	
	// schedule effects for sprites for all efects 
	float maxTime = 0;
	int estimatedDelay = [sprites4explote count] * 100/3;
	for (CCSprite *sprite in sprites4explote) {
		float delay = (arc4random() % estimatedDelay )/100.0;
		if (delay > maxTime) {
			maxTime = delay;
		}
		
		[sprite runAction:[CCSequence actions:
						   [CCDelayTime actionWithDuration:delay],
						   [CCCallFuncO actionWithTarget:self selector:@selector(explodeSymbol:) object:sprite],
						   nil ]];
	}
	
	// show transition labels
    int numHits = [sprites4explote count] / 3; 
	[machine.frontLayer showBigScore:[NSString stringWithFormat:@"+ %i Hits",numHits] delay:maxTime];

	// start next phase
	[tracksLayer runAction: [CCSequence actions:
						   [CCDelayTime actionWithDuration: maxTime + 1],
                             [CCCallFuncO actionWithTarget:self selector:@selector(startNextPhase:) object:[NSNumber numberWithInt:numHits] ],
						   nil ]];
}

-(void) startNextPhase:(NSNumber *)addhits
{
	strikeGesture.enabled = YES;
	isTimeEnabled = YES;
	[tracksLayer run];
    [self addHits: [addhits intValue] ];
    [self updateMachineStatus];    
}

-(void) explodeSymbol:(SymbolSprite *) sprite
{
    sprite.symbol.enabled = NO;
     
	[self runEffect:[sprite.symbol character]  atPosition:sprite.position withVar:20 ];
	[[SimpleAudioEngine sharedEngine] playEffect:currentSndEffect];
	[self addPoints:45];
	[machine.frontLayer  updateBigScore:[NSString stringWithFormat:@"%i",totalScore] ];
	[sprite runAction: [CCSequence actions:
						[CCFadeOut actionWithDuration:3],
						nil	] ];
}

@end

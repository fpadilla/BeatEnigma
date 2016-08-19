//
//  PauseLayer.m
//  iNigma
//
//  Created by Francisco Padilla on 3/29/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "PopupLayers.h"
#import "SimpleAudioEngine.h"
#import "FBClient.h"
#import "Twitter.h"


@implementation PopupLayers

@synthesize resume, restart, mainMenu, music, sound, nextLevel, title, totalScore, highScore, isHighScore, tweet, postFb, score, extraTime, machineDamage, numberFormatter, category, earnedCoins, store;

+(id) pauseGameLayer
{
	ccColor4B c = {0,0,50, 200};
	PopupLayers *layer = [self layerWithColor:c];
	if ( layer ) {
		[layer setupButtons];
		CGSize layerSize = layer.contentSize;
		
		layer.title.string = @"Paused Game";
		
        layer.tweet.visible = NO;
        layer.postFb.visible = NO;
        
		[layer.resume setPosition:ccp(layerSize.width/2, layerSize.height/2.5 + layer.resume.contentSize.height/2 )];

        int height = layerSize.height/2.5 - 1.2*layer.resume.contentSize.height/2 ;
		
		[layer.mainMenu setPosition:ccp(layerSize.width/2 - 140, height)];

		[layer.restart setPosition:ccp(layerSize.width/2 - 70,height)];
		
		[layer.store setPosition:ccp(layerSize.width/2, height)];
		
		[layer.music setPosition:ccp(layerSize.width/2 + 70, height)];
		
		[layer.sound setPosition:ccp(layerSize.width/2 + 150, height)];

        
		CCMenu * menu = [CCMenu menuWithItems:layer.resume, layer.restart, layer.mainMenu, layer.store, 
                         layer.music, layer.sound, nil];
		[menu setPosition:ccp(0,0) ]; // layerSize.width/2 ,layerSize.height/2 )];
		[layer addChild:menu];
	}
	
	CCScene * currentScene = [[CCDirector sharedDirector] runningScene];
	[currentScene addChild:layer z:10];
	
	return layer;
}

+(id) levelSuccessLayer:(float) delay score:(int)score
{
	if ( [[GameFlow sharedGameFlow] nextLevel] < 0 ) {
		// show Final Game !
	}
	
	ccColor4B c = {0,0,0, 200};
	PopupLayers *layer = [self layerWithColor:c];
	if ( layer ) {
		[layer setupButtons];
		CGSize layerSize = layer.contentSize;
        layer.score = score;

        NSString *formattedInt = [layer.numberFormatter stringFromNumber:[NSNumber numberWithInt:score]];
        
        layer.title.string = @"You Beat Enigma!";
        layer.title.position = ccp(layer.title.position.x, layer.title.position.y+3);
        layer.position = ccp(layer.position.x, layer.position.y+7);
		layer.totalScore.string = [NSString stringWithFormat:@"Score: %@", formattedInt];
		layer.totalScore.visible = YES;
        layer.extraTime.visible = YES;
        layer.machineDamage.visible = YES;
        layer.earnedCoins.visible = YES;
        layer.highScore.visible = YES;
        layer.isHighScore = [[GameFlow sharedGameFlow] setHighScore:score forCategory:layer.category];

        int height = layerSize.height/2 - 2*layer.restart.contentSize.height/2 ;

        if ( layer.isHighScore ) { // show  High Score Animation;
            [layer.highScore runAction:[CCSequence actions:
                                         [CCDelayTime actionWithDuration:delay + 2.6]
                                         ,[CCCallFunc actionWithTarget:layer selector:@selector(newHighScoreEffect)]
                                         ,nil] ]; 
        }

        height -= 24;
        CCLabelBMFont *hallFameLabel = [CCLabelBMFont labelWithString:@"You're in the Hall of Fame Leaderboard!" fntFile:@"Points Font.fnt"];
        hallFameLabel.position = ccp(layerSize.width/2, height + 47) ;
        hallFameLabel.visible = YES;
        hallFameLabel.color = ccc3(0xCC, 0x66, 0);
        hallFameLabel.scale = 0.6;
        [ layer addChild:hallFameLabel ];
            
		[layer.restart setPosition:ccp(layerSize.width/2 - 140, height) ];
		
		[layer.mainMenu setPosition:ccp(layerSize.width/2 - 70, height) ];
        
        layer.store.position = ccp(layerSize.width/2, height);
        
        [layer.postFb setPosition:ccp(layerSize.width/2  + 70, height) ];
		
		[layer.tweet setPosition:ccp(layerSize.width/2  + 150, height) ];
		
		CCMenu * menu = [CCMenu menuWithItems: layer.restart, layer.mainMenu, layer.store, layer.tweet, layer.postFb, nil];
		[menu setPosition:ccp(0,0) ];
		[layer setVisible:NO];
		[layer addChild:menu];
		[layer runAction:[CCSequence actions: 
						 [CCDelayTime actionWithDuration:delay]
						 ,[CCCallFunc actionWithTarget:layer selector:@selector(showUpLevelSucess)]
						 , nil
						 ] ];
	}
	
	CCScene * currentScene = [[CCDirector sharedDirector] runningScene];
	[currentScene addChild:layer z:100];
	
	return layer;	
}

- (void) dealloc
{
	[super dealloc];
}

-(void) showUp
{
	[self setVisible:YES];
}

-(void) showUpLevelSucess
{
    [self setVisible:YES];
}

+(id) levelFailedLayer
{
	ccColor4B c = {0,0,0, 200};
	PopupLayers *layer = [self layerWithColor:c];
	if ( layer ) {
		[layer setupButtons];
		CGSize layerSize = layer.contentSize;
		
		layer.title.string = @"Failed Level";
		
		[layer.restart setPosition:ccp(layerSize.width/2 + 1*layer.restart.contentSize.height ,
								 layerSize.height/2 - 1*layer.restart.contentSize.height )];
		
		[layer.mainMenu setPosition:ccp(layerSize.width/2 - 1*layer.mainMenu.contentSize.height,
								  layerSize.height/2 - 1*layer.mainMenu.contentSize.height )];

		
		CCMenu * menu = [CCMenu menuWithItems:layer.restart, layer.mainMenu, layer.tweet, layer.postFb, nil];
		[menu setPosition:ccp(0,0) ]; 
		[layer addChild:menu];
	}
	
	CCScene * currentScene = [[CCDirector sharedDirector] runningScene];
	[currentScene addChild:layer z:10];
	
	return layer;	
}

+(id) levelTimeUp:(int)total bonus:(int) bonus
{
	ccColor4B c = {0,0,0, 200};
	PopupLayers *layer = [self layerWithColor:c];
	if ( layer ) {
		[layer setupButtons];
		CGSize layerSize = layer.contentSize;
		
        GameMechanics *game = [GameMechanics sharedGame];
		if (game.mode == BLITZ ) {
            layer.title.string = @"Time Up!";
        } else {
            layer.title.string = @"Game Over!";
        }
        
        NSString *formattedTotal = [layer.numberFormatter stringFromNumber:[NSNumber numberWithInt:total]];

		layer.totalScore.string = [NSString stringWithFormat:@"Score: %@", formattedTotal];
		layer.totalScore.visible = YES;
        
        layer.highScore.visible = YES;
        layer.score = total;
        
        layer.extraTime.visible = YES;
        layer.machineDamage.visible = YES;
        layer.earnedCoins.visible = YES;
        
        layer.isHighScore = [[GameFlow sharedGameFlow] setHighScore:total forCategory:layer.category];
        
        if ( layer.isHighScore ) { // show  High Score Animation;
            [layer.highScore runAction:[CCSequence actions:
                                          [CCDelayTime actionWithDuration:3.6]
                                         ,[CCCallFunc actionWithTarget:layer selector:@selector(newHighScoreEffect)]
                                         ,nil] ]; 
        } else {
            [layer runAction:[CCSequence actions:
                               [CCDelayTime actionWithDuration:3.6],
                               [PlayEffect actionWithFile:@"Ending Machine Laught.caf"], nil]];
             
        }
        
        int height = layerSize.height/2 - 2.1*layer.restart.contentSize.height/2 ;
      
		[layer.restart setPosition:ccp(layerSize.width/2 - 140, height) ];
		
		[layer.mainMenu setPosition:ccp(layerSize.width/2 - 70, height) ];
        
        [layer.store setPosition:ccp(layerSize.width/2, height)];

        [layer.postFb setPosition:ccp(layerSize.width/2  + 70, height) ];
		
		[layer.tweet setPosition:ccp(layerSize.width/2  + 150, height) ];
		
		CCMenu * menu = [CCMenu menuWithItems:layer.restart, layer.mainMenu, layer.store, layer.tweet, layer.postFb, nil];
		[menu setPosition:ccp(0,0) ]; // layerSize.width/2 ,layerSize.height/2 )];
		[layer addChild:menu];
        
        [layer setVisible:NO];
		[layer runAction:[CCSequence actions: 
                          [CCDelayTime actionWithDuration:3.0f]
                          ,[CCCallFunc actionWithTarget:layer selector:@selector(showUp)]
                          , nil
                          ] ];
	}
	
	CCScene * currentScene = [[CCDirector sharedDirector] runningScene];
	[currentScene addChild:layer z:10];
	
	return layer;	
}

-(void) newHighScoreEffect
{    

    NSString *formattedScore = [numberFormatter stringFromNumber:[NSNumber numberWithInt:score]];
    
    self.highScore.color = ccc3(0xCC, 0x66, 0);
    self.highScore.string = [NSString stringWithFormat:@"New High Score: %@", formattedScore ];
    CCParticleSystemPoint *particles = [CCParticleSystemPoint particleWithFile:@"blend high score.plist"];
    particles.position = self.highScore.position;
    [self.highScore runAction:[CCSequence actions:
                                 [ShowParticleSystem actionWithParticleSys:particles updatePosition:NO]
                                 ,[PlayEffect actionWithFile:@"Fusion shots.caf"]
                                 ,[CCFadeIn actionWithDuration:1.5]
                                 , nil] ]; 

}

- (void) setupButtons
{		
	self.isTouchEnabled = YES;
	CGSize layerSize = CGSizeMake(390,205);
	self.contentSize = layerSize;
	
	CGSize screenSize = [[CCDirector sharedDirector] winSize ];
	self.position = ccp( (screenSize.width-layerSize.width)/2, (screenSize.height-layerSize.height)/2 - 5);
		
	CCSpriteFrameCache* frameCache = [CCSpriteFrameCache sharedSpriteFrameCache]; 
    //[frameCache addSpriteFramesWithFile:@"main menu scene.plist"];
	
	title = [CCLabelBMFont labelWithString:@"." fntFile:@"Points Font.fnt"];
	title.position = ccp(layerSize.width/2, 184) ;
    title.color = ccGREEN;
	[ self addChild:title ];
	
	totalScore = [CCLabelBMFont labelWithString:@"." fntFile:@"Points Font.fnt"];
	totalScore.position = ccp(layerSize.width/2, 160) ;
	totalScore.visible = NO;
    totalScore.scale = 0.7;
	[ self addChild:totalScore ];

    GameMechanics *game = [GameMechanics sharedGame];
    if (game.mode==BLITZ) {
        category = @"grp.BLITZ";
    }else{
        category = @"grp.TIMELESS";;
    }
    numberFormatter = [[[NSNumberFormatter alloc] init] retain];
    [numberFormatter setNumberStyle:NSNumberFormatterDecimalStyle];
    NSString *formattedHighScore = [numberFormatter stringFromNumber:[NSNumber numberWithInt:
                                      [[GameFlow sharedGameFlow] highScoreForCategory:category] ]];
	highScore = [CCLabelBMFont labelWithString:@"." fntFile:@"Points Font.fnt"];
	highScore.position = ccp(layerSize.width/2, 140) ;
	highScore.visible = NO;
    highScore.scale = 0.6;
    highScore.string = [NSString stringWithFormat:@"High Score: %@", formattedHighScore];    
	[ self addChild:highScore ];
    
    extraTime = [CCLabelBMFont labelWithString:@"." fntFile:@"Points Font.fnt"];
	extraTime.position = ccp(layerSize.width/2, 120) ;
    if (game.mode == BLITZ) {
        extraTime.string =[@"Extra Time: " stringByAppendingFormat:@"%i secs", game.extraTime];
    } else {
        extraTime.string =[@"Turns Earned: " stringByAppendingFormat:@"%i", game.earnedTurns];
        
    }
    extraTime.visible = NO;
    extraTime.scale = 0.6;
	[ self addChild:extraTime ];
    
    machineDamage = [CCLabelBMFont labelWithString:@"." fntFile:@"Points Font.fnt"];
	machineDamage.position = ccp(layerSize.width/2, 100) ;
	machineDamage.visible = NO;
    machineDamage.scale = 0.6;
    machineDamage.string = [@"Enigma Damage: " stringByAppendingFormat:@"%i %%", (int)(game.phase*100.0/18.0)];
	[ self addChild:machineDamage ];

    earnedCoins = [CCLabelBMFont labelWithString:[@"Earned Coins: " stringByAppendingFormat:@"%@",                                               [numberFormatter stringFromNumber:[NSNumber numberWithInt:game.earnedCoins]]] fntFile:@"Points Font.fnt"];
    earnedCoins.scale = 0.6;
    earnedCoins.visible = NO;
	earnedCoins.position = ccp(layerSize.width/2, 80) ;
    [self addChild:earnedCoins ];
    
	// resume
    resume = [CCMenuItemSprite 
                              itemFromNormalSprite:[CCSprite spriteWithSpriteFrameName:@"resume-normal.png"]
                              selectedSprite:[CCSprite spriteWithSpriteFrameName:@"resume-selected.png"]
                              target:self selector:@selector(resume:)
                              ];
	// restart
    restart = [CCMenuItemSprite 
                                itemFromNormalSprite:[CCSprite spriteWithSpriteFrameName:@"restart-normal.png"]
                                selectedSprite:[CCSprite spriteWithSpriteFrameName:@"restart-selected.png"]
                                target:self selector:@selector(restart:)
                                ];

	// main menu
    mainMenu = [CCMenuItemSprite 
               itemFromNormalSprite:[CCSprite spriteWithSpriteFrameName:@"menu-normal.png"]
               selectedSprite:[CCSprite spriteWithSpriteFrameName:@"menu-selected.png"]
               target:self selector:@selector(mainMenu:)
               ];
	
    
    tweet = [CCMenuItemSprite itemFromNormalSprite:[CCSprite spriteWithSpriteFrameName:@"tweet-normal.png"]
                                 selectedSprite:[CCSprite spriteWithSpriteFrameName:@"tweet-selected.png"]
                                 target:self selector:@selector(tweet:) ];
    
    postFb = [CCMenuItemSprite itemFromNormalSprite:[CCSprite spriteWithSpriteFrameName:@"postFb-normal.png"]
                                  selectedSprite:[CCSprite spriteWithSpriteFrameName:@"postFb-selected.png"]
                                             target:self selector:@selector(fbPost:) ];    
    store = [CCMenuItemSprite
                               itemFromNormalSprite:[CCSprite spriteWithSpriteFrameName:@"store-normal.png"]
                               selectedSprite:[CCSprite spriteWithSpriteFrameName:@"store-selected.png"]
                               target:[GameFlow sharedGameFlow] selector:@selector(showStore)
                               ];    
    // music
    CCMenuItemImage *musicOn = [CCMenuItemSprite
                                itemFromNormalSprite:[CCSprite spriteWithSpriteFrameName:@"music-on.png"]
                                selectedSprite:[CCSprite spriteWithSpriteFrameName:@"music-off.png"]
                                ];
    CCMenuItemImage *musicOff = [CCMenuItemSprite 
                                 itemFromNormalSprite:[CCSprite spriteWithSpriteFrameName:@"music-off.png"]
                                 selectedSprite:[CCSprite spriteWithSpriteFrameName:@"music-on.png"]
                                 ];
    
    music = [[CCMenuItemToggle itemWithTarget:self 
                                                       selector:@selector(toggleMusic:) 
                                                          items:musicOn,musicOff,nil ] retain];
    
    // sound
    CCMenuItemImage *soundOn = [CCMenuItemSprite 
                                itemFromNormalSprite:[CCSprite spriteWithSpriteFrameName:@"effects-on.png"]
                                selectedSprite:[CCSprite spriteWithSpriteFrameName:@"effects-off.png"]
                                ];
    CCMenuItemImage *soundOff = [CCMenuItemSprite 
                                 itemFromNormalSprite:[CCSprite spriteWithSpriteFrameName:@"effects-off.png"]
                                 selectedSprite:[CCSprite spriteWithSpriteFrameName:@"effects-on.png"]
                                 ];
    sound = [[CCMenuItemToggle itemWithTarget:self 
                                                       selector:@selector(toggleSound:) 
                                                          items:soundOn,soundOff,nil ] retain];
		
    NSUserDefaults *usrDef = [NSUserDefaults standardUserDefaults];
    if( [usrDef objectForKey:@"sound"] != nil && [usrDef boolForKey:@"sound"] == NO){
        sound.selectedIndex = 1;
    }
    
    if([usrDef objectForKey:@"music"] != nil && [usrDef boolForKey:@"music"] == NO){
        music.selectedIndex = 1;
    }
		
    return;
}

-(void)toggleMusic:(CCMenuItemToggle *)sender
{
	[[GameFlow sharedGameFlow] toggleMusic];
}

-(void)toggleSound:(CCMenuItemToggle *)sender
{
	[[GameFlow sharedGameFlow] toggleSound];
}

- (void)restart:(id)sender
{		
	[[GameFlow sharedGameFlow ] restart];
	[self.parent removeChild:self cleanup:YES];
}

- (void)resume:(id)sender
{
	[[GameFlow sharedGameFlow ] resume];
	[self.parent removeChild:self cleanup:YES];
}

-(void)mainMenu:(id)sender
{
	[[GameFlow sharedGameFlow ] goMainMenu];
	[self.parent removeChild:self cleanup:YES];
}

-(void)nextLevel:(id)sender
{
	[[GameFlow sharedGameFlow ] playNextLevel];
	[self.parent removeChild:self cleanup:YES];
}

-(NSString*) message
{
    NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
    [numberFormatter setNumberStyle:NSNumberFormatterDecimalStyle];
    NSString *formattedInt = [numberFormatter stringFromNumber:[NSNumber numberWithInt:score]];
    
    GameMechanics *gm = [GameMechanics sharedGame];
    int percentComplete = [gm phase] * 100 /18;
    if ( [gm phase] == 18 ) {  //
        return [NSString stringWithFormat: @"I Beat Enigma! I earned %@ points. Try to beat my high score.",formattedInt];
    } else if ( isHighScore ) {
        return [NSString stringWithFormat: @"I got a new high score of %@ pts; I’m closer to beating Enigma (%i%%). Can you do better?",formattedInt, percentComplete];
    } else {
        return [NSString stringWithFormat: @"I got %@ points and I’m %i%% through beating Enigma. Can you do better?",formattedInt, percentComplete];
    }

}

-(void) tweet:(id)sender
{
    [[Twitter sharedTwitterClient] sendUpdate:[self  message] ];
}

-(void) fbPost:(id)sender
{
    [[FBClient sharedFBClient] postWall:[self  message] ];
}

@end

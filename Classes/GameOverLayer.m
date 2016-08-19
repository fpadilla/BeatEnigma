//
//  GameOverLayer.m
//  iNigma
//
//  Created by Francisco Padilla on 4/15/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "GameOverLayer.h"


@implementation GameOverLayer

- (id) initWithColor:(ccColor4B)color
{
    if ((self = [super initWithColor:color])) {
		
		self.isTouchEnabled=YES;
		
		CGSize screenSize = [[CCDirector sharedDirector] winSize ];
		CCSpriteFrameCache* frameCache = [CCSpriteFrameCache sharedSpriteFrameCache]; 
		
		// background 214x 139
		CCSprite *paused = [CCSprite spriteWithSpriteFrameName:@"pausedGame.png" ];
		[paused setPosition:ccp(screenSize.width/2, screenSize.height/2 )];
		[self addChild:paused];
		
		// next level
		CCMenuItemImage * nextLevel = [CCMenuItemImage itemFromNormalImage:@"resume.png"
														  selectedImage:@"resume.png"
																 target:self
															   selector:@selector(nextLevel:)];	
		// restart
		CCMenuItemImage * restart = [CCMenuItemImage itemFromNormalImage:@"restart.png"
														   selectedImage:@"restart.png"
																  target:self
																selector:@selector(restart:)];		
		// main menu
		CCMenuItemImage * mainMenu = [CCMenuItemImage itemFromNormalImage:@"mainMenu.png"
															selectedImage:@"mainMenu.png"
																   target:self
																 selector:@selector(mainMenu:)];

		
		[restart setPosition:ccp(screenSize.width/2 - 1.5*restart.contentSize.height ,
								 screenSize.height/2 - 1*restart.contentSize.height )];
		
		[mainMenu setPosition:ccp(screenSize.width/2 + 15*mainMenu.contentSize.height,
								  screenSize.height/2 - 1*mainMenu.contentSize.height )];
		
		[nextLevel setPosition:ccp(screenSize.width/2,
								  screenSize.height/2 + 1*mainMenu.contentSize.height )];
		
		
		CCMenu * menu = [CCMenu menuWithItems:restart,mainMenu,nil];
		[menu setPosition:ccp(0,0)]; //screenSize.width/2 ,screenSize.height/2 )];
		[self addChild:menu];
		
    }
    return self;
}

- (void)restart:(id)sender
{		
	[[GameFlow sharedGameFlow ] restart];
	[self.parent removeChild:self cleanup:YES];
}

-(void)mainMenu:(id)sender
{
	[[GameFlow sharedGameFlow ] goMainMenu];
}

-(void)nextLevel:(id)sender
{
	[[GameFlow sharedGameFlow ] nextLevel];
}

- (void) dealloc
{
	[super dealloc];
}

@end

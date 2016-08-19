//
//  CreditsLayer.m
//  iNigma
//
//  Created by Francisco Padilla on 11/7/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "CreditsLayer.h"

@implementation CreditsLayer

static CreditsLayer *creditsLayer;

+(id) creditsLayer
{
	if ( creditsLayer == nil) {
		creditsLayer = [[[CreditsLayer alloc] init] autorelease]; // retain is made by Director
		[[[CCDirector sharedDirector] runningScene] addChild:creditsLayer];
	}	
	return creditsLayer;
}

-(id) init
{
	ccColor4B c = {0,0,0, 200};
	if ( self = [super initWithColor:c] ) {
		CCSprite *sprite = [CCSprite spriteWithFile:@"credits.png" ];
		CGSize winSize = [[CCDirector sharedDirector] winSize];
		sprite.position = ccp(winSize.width/2, winSize.height/2);
		self.isTouchEnabled = YES;
		[self addChild:sprite];
	}
	return self;
}

-(void) registerWithTouchDispatcher 
{
    [[CCTouchDispatcher sharedDispatcher] addTargetedDelegate:self priority:INT_MIN+1 swallowsTouches:YES];
}

-(BOOL) ccTouchBegan:(UITouch*)touch withEvent:(UIEvent *)event
{

	[[[CCDirector sharedDirector] runningScene] removeChild:creditsLayer cleanup:YES];
	creditsLayer = nil;    
	return YES;
}

@end

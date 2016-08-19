//
//  Fan.m
//  iNigma
//
//  Created by Francisco Padilla on 6/30/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Fan.h"


@implementation Fan

-(id) initWithSpriteName:(NSString*) spriteName
{
	self = [super initWithSpriteName:spriteName];
	
	paddles = [[[[NSMutableArray alloc] init ] autorelease] retain];
	CCSpriteFrameCache* frameCache = [CCSpriteFrameCache sharedSpriteFrameCache]; 

	int rotation = -90;
	for (int i = 0; i < 6; i++ ) {
		CCSprite *paddle = [CCSprite spriteWithSpriteFrame:[frameCache spriteFrameByName:@"paddle.png"] ];
		paddle.anchorPoint = ccp(0,1);
		paddle.position = ccp(0,0);
		paddle.rotation = rotation;
		[paddles addObject:paddle];
		[self addChild:paddle z:-1];
		rotation += 60;
	}

	sprite.position = ccp(0,-sprite.contentSize.height/2);	
    if ( damageSprite != nil ) {
        damageSprite.position = sprite.position;
    }
	CGRect nodeRect = CGRectMake(-sprite.contentSize.width/2, -sprite.contentSize.height, sprite.contentSize.width, sprite.contentSize.height);
	self.clippingRegion = nodeRect;
	
	speed = 10;
	[self scheduleUpdate];
	
	return self;
}

+(id) fanWithSpriteName:(NSString*) spriteName
{
	return [[[Fan alloc] initWithSpriteName:spriteName] autorelease];
}

-(void) update:(ccTime) dt 
{
	int c = [paddles count];
	
	for (int i = 0; i < c; i++ ) {
		CCSprite *paddle = [paddles objectAtIndex:i];
		paddle.rotation += (speed);
	}
}

-(void) updateAsset:(float)damagePercent
{	
	// speed adjust
    [super   updateAsset:damagePercent];
	if (status <= 0.7) {
		speed = status * 100000 + 30;
	} else {
		speed =  (100000 + 30 ) - (status-0.7) * (100000 + 30 ) / 0.3;
		if (speed < 0) {
			speed = 0;
		}
	}	
}

-(void) desacelerate
{
	if (speed > 0){
		speed -= 10;
	}
	if (speed < 0 ) {
		speed = 0;
	}
}

-(void) dealloc
{
    [paddles release];
    [super dealloc];
}

@end

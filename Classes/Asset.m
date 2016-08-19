//
//  Asset.m
//  iNigma
//
//  Created by Francisco Padilla on 7/4/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Asset.h"


@implementation Asset

@synthesize begin, end, status, action, particleSystem, sndEffect, sprite, damageSprite;

-(id) initWithSpriteName:(NSString*) aSpriteName
{
	self = [super init];
	spriteName = [aSpriteName retain];
	
	CCSpriteFrameCache* frameCache = [CCSpriteFrameCache sharedSpriteFrameCache];
	NSString *spriteFrame = [ NSString stringWithFormat:@"%@-new.png", spriteName ];
    NSAssert(spriteFrame != nil, @"sprite frame %@ in %@, %@", frameCache, self, _cmd);
	sprite = [CCSprite spriteWithSpriteFrame:[frameCache spriteFrameByName:spriteFrame] ];
	[self addChild:sprite];
	
	spriteFrame = [NSString stringWithFormat:@"%@-oxidized.png", spriteName ];
	CCSpriteFrame *damagedFrame = [frameCache spriteFrameByName:spriteFrame];
	if (damagedFrame != nil) {
		damageSprite = [CCSprite spriteWithSpriteFrame:damagedFrame ];
		damageSprite.opacity = 0;
		[self addChild:damageSprite];
	}
	
	return self;
}

+(id) assetWithSpriteName:(NSString*) aSpriteName
{
	Asset *asset = [[Asset alloc] initWithSpriteName:aSpriteName];
	return asset;
}

-(void) updateAsset:(float) damagePercent
{
	//NSLog(@"status : %f   opacity: ", status damageSprite.opacity);
	if ( damageSprite != nil ) {
		damageSprite.opacity = status * 255;
        //NSLog(@"updateAsset: %@ opacity to [%i]", spriteName, damageSprite.opacity);
	} 
}

-(void) updateStatus:(float) damagePercent
{
	status = damagePercent;
	if (status <=0 || status > 1 ) {
		int stopHere;
	}
	
	[self updateAsset:damagePercent];
	
	if (status >= 1) {
		status = 1;
	}
}

-(void) fireEffects
{
	if (action != nil) {
		[self runAction:action];
        // NSLog(@"fireEffects for: %@ ", spriteName );
	}
	
	if ( particleSystem != nil ) {
		particleSystem.position = self.position;
		particleSystem.autoRemoveOnFinish = YES;
		[self.parent addChild:particleSystem];
	}
	
	if (sndEffect != nil) {
		[[SimpleAudioEngine sharedEngine] playEffect:sndEffect];
	}
}

-(void) setOpacity:(GLubyte)opacity
{
    if (sprite != nil) {
        sprite.opacity = opacity;
    }
    
    if (damageSprite != nil) {
        damageSprite.opacity = opacity;
    }
}

-(GLubyte) opacity
{
    if (sprite != nil) {
        return sprite.opacity;
    }
    
    if (damageSprite != nil) {
        return damageSprite.opacity;
    }
}


-(void) dealloc
{
	[spriteName release];
    self.action = nil;
    self.particleSystem = nil;
    self.sndEffect = nil;
	[super dealloc];
}

@end

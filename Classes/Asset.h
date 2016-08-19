//
//  Asset.h
//  iNigma
//
//  Created by Francisco Padilla on 7/4/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "ClippingNode.h"
#import "SimpleAudioEngine.h"
//#import "GameMechanics.h"

@interface Asset : ClippingNode {
	CCSprite *sprite;
	CCSprite *damageSprite;
	NSString *spriteName;
	CCParticleSystemPoint *particleSystem; 
	NSString *sndEffect;
	
	NSString *soundEffect;
	float begin;
	float end;
	float status; /// 0..1
	CCFiniteTimeAction *action;

}
@property(readwrite) CCSprite *sprite;
@property(readwrite) CCSprite *damageSprite;
@property(readonly) NSString *spriteName;
@property(assign) float begin;
@property(assign) float end;
@property(readonly) float status; /// 0..1 
@property(readwrite, retain) CCFiniteTimeAction *action;
@property(readwrite, retain) CCParticleSystemPoint *particleSystem;
@property(readwrite, retain) NSString *sndEffect;

+(id) assetWithSpriteName:(NSString*) aSpriteName;
-(id) initWithSpriteName:(NSString*) aSpriteName;
-(void) updateStatus:(float)damagePercent;
-(void) updateAsset:(float) damagePercent;
-(void) setOpacity:(GLubyte)opacity;
-(GLubyte) opacity;
-(void) fireEffects;

@end

//
//  BackLayer.h
//  iNigma
//
//  Created by Francisco Padilla on 4/15/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

#import "ProgressMeter.h"
#define numEmoticons 5

@interface BackLayer : CCLayerColor {
    ProgressMeter *progressMeter;
@private
	int currentEmoticon;
	NSMutableArray *emoticonPhases;
	CCSprite *emoticon;
    CCParticleSystemPoint *jokerParticleSys;
    CCSprite *screenBackground;
}

@property(readonly) CCSprite *screenBackground;
@property(readonly) CCSprite *openedTop;
@property(readonly) CCSprite *openedBottom;
@property(readonly) CCSprite *openedLeft;
@property(readonly) CCSprite *openedRight;
@property(readonly) CCSprite *emoticon;

-(void) showEmoticonStatus:(float) status;
-(id) initWithParameters:(NSDictionary*) arameters;
-(void) runAnimations:(float) damagePercent;
-(void) showEmoticon:(int)phase;
-(void) hideEmoticon;
-(void) updateProgressMeter:(float) newValue;
/*-(void) hideJoker;

-(void) startSlowMotionEffectFor:(float) time;
-(void) stopSlowMotionEffect;*/

@end

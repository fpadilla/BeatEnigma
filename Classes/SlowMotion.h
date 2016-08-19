//
//  SlowMotion.h
//  iNigma
//
//  Created by Francisco Padilla on 6/27/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@class GameMechanics;

@interface SlowMotion : CCActionInterval
{
    GameMechanics *game;
    BOOL actived;
    float defaultDuration;
    CCParticleSystemPoint *freezeParticleSys;
}

@property float defaultDuration;
@property(readonly) BOOL actived;

-(SlowMotion*) initWithGame:(GameMechanics*) aGame;
-(void) startEffect;
-(void) stopEffect;

@end

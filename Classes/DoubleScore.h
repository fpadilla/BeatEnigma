//
//  PowerUp.h
//  iNigma
//
//  Created by Francisco Padilla on 6/26/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#define JOKERTAG 10000

@class GameMechanics;

@interface DoubleScore : CCActionInterval
{
    GameMechanics *game;
    BOOL actived;
    float defaultDuration;
    CCParticleSystemPoint *jokerParticleSys;
}

-(DoubleScore*) initWithGame:(GameMechanics*) aGame;

@property(readonly) BOOL actived;
@property float defaultDuration;

-(void) startEffect;
-(void) stopEffect;

@end

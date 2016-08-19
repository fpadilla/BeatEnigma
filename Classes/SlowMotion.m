//
//  SlowMotion.m
//  iNigma
//
//  Created by Francisco Padilla on 6/27/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SlowMotion.h"
#import "GameMechanics.h"

#define FREEZE_PARTICULE_SYSTEM 3000

@implementation SlowMotion

@synthesize actived, defaultDuration;

-(SlowMotion*) initWithGame:(GameMechanics*) aGame
{
    if (self = [super initWithDuration:0]) {
        game = aGame;
    }
    return self;
}

-(void) startWithTarget:(id)target
{
    freezeParticleSys = [CCParticleSystemPoint particleWithFile:@"freezer.plist"];
    freezeParticleSys.duration = 1 + defaultDuration;
    freezeParticleSys.autoRemoveOnFinish = YES;
    [game.machine.backLayer addChild:freezeParticleSys z:0 tag:FREEZE_PARTICULE_SYSTEM];
}

-(void) stop
{
    freezeParticleSys = [game.machine.backLayer getChildByTag:FREEZE_PARTICULE_SYSTEM];
    if ( freezeParticleSys !=nil ) {
        [game.machine.backLayer removeChild:freezeParticleSys cleanup:YES];
    }
}


-(void) startEffect
{
    if (actived) {
        self.duration += defaultDuration;
        freezeParticleSys.duration += defaultDuration;
    } else {
        self.duration = defaultDuration;
        [game.machine.backLayer runAction:self];
        actived = TRUE;
    }
}

-(void) stopEffect
{
    if (actived) {
        [game.machine.backLayer stopAction:self];
        [self stop];
    }
}

-(void) update:(ccTime)time
{
    
}

@end

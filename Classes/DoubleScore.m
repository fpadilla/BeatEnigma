//
//  PowerUp.m
//  iNigma
//
//  Created by Francisco Padilla on 6/26/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "DoubleScore.h"
#import "GameMechanics.h"

@implementation DoubleScore

@synthesize actived, defaultDuration;

-(DoubleScore*) initWithGame:(GameMechanics*) aGame
{
    if (self = [super initWithDuration:0]) {
        game = aGame;
    }
    return self;
}

-(void) startWithTarget:(id)target
{
    [super startWithTarget:target];
    
    /* TODO: CGPoint averageSpritePos = game.
	 [game.machine.frontLayer showPointLabel:[NSString stringWithFormat:@"Code Rush!"] atLocation:averageSpritePos color:ccWHITE];*/

    jokerParticleSys = [CCParticleSystemPoint particleWithFile:@"joker-blue.plist"];
    jokerParticleSys.duration = duration_;
    jokerParticleSys.autoRemoveOnFinish = YES;
    [game.machine.backLayer addChild:jokerParticleSys z:0 tag:JOKERTAG];
    
}

-(void) stop
{
    if (actived) {
        if ( [game.machine.backLayer  getChildByTag:JOKERTAG] ) {
            [game.machine.backLayer removeChild:jokerParticleSys cleanup:YES];
        }
        
        [game.machine.frontLayer showPointLabel:@"End Code Rush!" atLocation:ccp(240,160) color:ccWHITE];
        actived = FALSE;
    }
    [super stop];
}


-(void) startEffect
{
    if (actived) {
        self.duration += defaultDuration;
        jokerParticleSys.duration += defaultDuration;
    } else {
        self.duration = defaultDuration;
        [game.machine.backLayer runAction:self];
        actived = TRUE;
    }
}

-(void) stopEffect
{
    [game.machine.backLayer stopAction:self];
    [self stop];
}

-(void) update:(ccTime)time
{
    
}


@end

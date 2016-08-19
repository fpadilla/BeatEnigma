//
//  Laser.h
//  iNigma
//
//  Created by Francisco Padilla on 7/5/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "GameMechanics.h"


@interface Laser : CCSprite
{
    float duration;
    CCActionInterval *action;
    GameMechanics *game;
    CCLabelBMFont *pointsLabel;
    int points;
    int iterations;
    int maxIterations;
    NSArray *originalSprites;
    ALuint sndId;
    NSMutableArray *sprites;
}

@property(readonly) float duration;

+(int) count;
+(void) removeAll;
-(Laser*) initWithSprites:(NSArray*)sprites;


@end

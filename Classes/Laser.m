//
//  Laser.m
//  iNigma
//
//  Created by Francisco Padilla on 7/5/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Laser.h"
#import "SimpleAudioEngine.h"

@implementation Laser

@synthesize duration;

static NSMutableArray *lasers;

-(Laser*) initWithSprites:(NSArray*)sourceSprites
{
    if (self = [super initWithSpriteFrameName:@"laser.png"]) {
        originalSprites = [sourceSprites retain];
        int length = [originalSprites count];
        duration = 2 + length*0.35;
        maxIterations = (length==6) ? 1 : 1;
        game = [GameMechanics sharedGame];
        sprites = [[NSMutableArray arrayWithCapacity:7] retain];

        //[self schedule:@selector(evaluateNeighbors:) interval:1/3.0f];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(evaluateNeighbors:) name:@"TRACK_PAUSE" object:nil];

        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(returnTakenSymbols:) name:@"TRACK_RUNNING" object:nil];


        self.scaleX = length * 1.0/3.0;

        pointsLabel = [CCLabelBMFont labelWithString:@"." fntFile:@"Points Font.fnt"];
        pointsLabel.string = @"0";
        pointsLabel.visible = YES;
        pointsLabel.color = ccWHITE;
        pointsLabel.anchorPoint = ccp(0.5,0.5);
        pointsLabel.position = self.position;
        [pointsLabel retain];
        [self.parent addChild:pointsLabel z:30];    
        
        // add itself to array collection
        if (lasers == nil) {
            lasers = [[NSMutableArray alloc] initWithCapacity:10];
        }
        
        [self runAction: [CCRepeatForever actionWithAction:
						  [CCSequence actions:
						   [CCCallFunc actionWithTarget:self selector:@selector(playSound)]
						   ,[CCDelayTime actionWithDuration:4.0f]
						   ,nil ] ] ];
        [lasers addObject:self];
    }
    return self;
}

-(void) playSound
{
    sndId = [[SimpleAudioEngine sharedEngine] playEffect:@"codeScanner.caf" pitch:1.0 pan:0 gain:4.0];
}

-(void) dealloc
{
    [action release];
    [sprites release];
    [super dealloc];
}

-(void) evaluateNeighbors:(ccTime) dt
{
    iterations++;

    // locate neighbor sprites
    TracksLayer *tracksLayer = game.tracksLayer;
    for (float i = 0; i <= contentSize_.width*scaleX_/tracksLayer.trackWidth; i++) {
        float x = self.position.x - contentSize_.width/2*scaleX_ + (i * tracksLayer.trackWidth);
        CGPoint location = CGPointMake(x, self.position.y) ;
        SymbolSprite *sprite = [tracksLayer getSymbolSprite4location:location];
        if (sprite != nil) {
            [sprites addObject:sprite];
            sprite.isOnScanner = YES;
        }
    }
    
    // validate hits and take actions
    if ([game validateSymbolSprites:sprites withSubHits:YES]) {
        //action.duration += 1.5;
        if (maxIterations < 10) {
            maxIterations ++;
        }
        [game addPoints:25];
    } else {
        for (SymbolSprite *sprite in sprites) {
            if (sprite.symbol.character != '_' && sprite.symbol.character != 'M' && sprite.symbol.enabled) {
                points +=5;
            }
        }
        pointsLabel.string = [NSString stringWithFormat:@"%i", points];
    }

    if (iterations >= maxIterations || ( iterations>4/* && [lasers count] >=4*/ ) ) {
        [self runAction:[CCSequence actions:
                         [CCFadeOut actionWithDuration:0.5],
                         [CCCallFunc actionWithTarget:self selector:@selector(stop)],
                         nil] ];
    }
    //NSLog(@"iterations: %i  maxIterations %i", iterations, maxIterations);
}

-(void) returnTakenSymbols:(ccTime) dt
{
    for (SymbolSprite *sprite in sprites) {
        sprite.isOnScanner = NO;
    }
    [sprites removeAllObjects];
}

-(void) stop
{
    [self returnTakenSymbols:0];
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    [self unscheduleAllSelectors];
    [self.parent removeChild:pointsLabel cleanup:YES];
    [self.parent removeChild:self cleanup:YES];
    [pointsLabel release];
    [self stopAllActions];
    [[SimpleAudioEngine sharedEngine] stopEffect:sndId];
    [lasers removeObject:self];

}

+(int) count
{
    return lasers == nil? 0 : [lasers count];
}

+(void) removeAll{
    NSArray *laserCopy = [NSArray arrayWithArray:lasers];
    if (lasers != nil) {
        for (Laser *laser in laserCopy) {
            [laser stop];
        }
    }
}


@end

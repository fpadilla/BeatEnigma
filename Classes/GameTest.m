//
//  GameTest.m
//  iNigma
//
//  Created by Francisco Padilla on 6/28/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "GameTest.h"

@implementation GameTest

-(id) initWithGame:(GameMechanics*) aGame
{
	self = [super init];
	accumulatedTime = 0;
	game = aGame;
	
	return self;
}

-(void) update:(ccTime) dt
{
	accumulatedTime += dt;
	
	switch ( (int)accumulatedTime) {
		case 0:
			//game.machine.damagePercent = 1;
			break;			
		default:
			if (game.phase < 18) {
				game.machine.damagePercent += 0.002f;
				[game.machine runAnimations];
			} 			
			// NSLog(@"GameTest update damagePercent %f", game.machine.damagePercent);
			break;
	}
}

-(void) testHitGenerator
{
	
}

@end

//
//  GameTest.h
//  iNigma
//
//  Created by Francisco Padilla on 6/28/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GameMechanics.h"

@interface GameTest : NSObject {
	GameMechanics* game;
	float accumulatedTime;
}

-(id) initWithGame:(GameMechanics*) aGame;
-(void) update:(ccTime) dt;

@end

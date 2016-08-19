//
//  Machine.m
//  iNigma
//
//  Created by Francisco Padilla on 4/15/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Machine.h"
#import "GameMechanics.h"

@implementation Machine

@synthesize backLayer, frontLayer, damagePercent;

-(id) initWithParameters:(NSDictionary*) parameters 
{
	backLayer  = [[ [BackLayer  alloc] initWithParameters:parameters] autorelease];
	[backLayer retain];
	
	frontLayer = [[ [FrontLayer alloc] initWithParameters:parameters] autorelease];
	[frontLayer retain];
	
	//[self loadAnimations:[parameters objectForKey:@"animations"] ];
	//[[CCScheduler sharedScheduler] scheduleSelector:@selector(runAnimations) forTarget:self interval:1.0f paused:NO ];
	
	//[self setupAnimations];
	// damagePercent = 0.1;
	//[self runAnimations]; // run animations At zero index
	
	return self;
}

-(void) loadAnimations:(NSArray *) parameters
{
	animations = [[NSMutableArray alloc] initWithCapacity: [parameters count]];
	for( NSDictionary *params in parameters ){
		[animations addObject: [Animation animationWithParameters: params]];
	}
}

-(void) runAnimations
{
	if ( ! [[GameMechanics sharedGame] isRunning ]) {
		return;
	}
	
	 while ( animationIndex < [animations count] 
		&& damagePercent >= [[animations objectAtIndex:animationIndex] damagePercent]  ) {
				[[animations objectAtIndex:animationIndex] runWithLayer: frontLayer ];
				animationIndex += 1;
	}
	
	[frontLayer runAnimations:damagePercent];
	[backLayer runAnimations:damagePercent];
}

-(void) setupAnimations
{
	animations = [[NSMutableArray alloc] initWithCapacity:20];
	[animations addObject: [Animation animAt:0 addSprite:@"Battery-new1.png" position:ccp(16,320-198-25) opacity:255] ];
	[animations addObject: [Animation animAt:0 addSprite:@"Battery-new2.png" position:ccp(16,320-149-25) opacity:255] ];
	[animations addObject: [Animation animAt:0 addSprite:@"Battery-new3.png" position:ccp(16,320-101-25) opacity:255] ];
	[animations addObject: [Animation animAt:0 changeSprite:@"Battery-new1.png" toSpriteFrame:@"Battery-oxyded.png"]];
	[animations addObject: [Animation animAt:0 accelerateBy:ccp(0,0) sprite:@"Battery-new1.png"]];
}
	 
-(void) dealloc
{
	[[CCScheduler sharedScheduler] unscheduleAllSelectorsForTarget:self];
	[frontLayer release];
	[backLayer release];
}

@end

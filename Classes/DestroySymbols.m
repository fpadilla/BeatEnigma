//
//  DestroySymbols.m
//  iNigma
//
//  Created by Francisco Padilla on 6/27/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "DestroySymbols.h"

@implementation DestroySymbols


#pragma mark Explote All Symbol efect
/*
-(void) explodeAllScreenSymbols
{
	[tracksLayer stop];
	strikeGesture.enabled = NO;
	isTimeEnabled = NO;
	
	// collect noy empty sprites
	NSMutableArray *sprites4explote = [[NSMutableArray alloc] initWithCapacity:36];
	for (Track *track in tracksLayer.tracks ) {
		for (CCSprite *sprite in track.sprites) {
			if ( sprite.userData != [Symbol emptySymbol] && ((Symbol*)sprite.userData).enabled == YES ) {
				[sprites4explote addObject: sprite];
			}
		}
	}
	
	// schedule effects for sprites for all efects 
	float maxTime = 0;
	int estimatedDelay = [sprites4explote count] * 100/3;
	for (CCSprite *sprite in sprites4explote) {
		float delay = (arc4random() % estimatedDelay )/100.0;
		if (delay > maxTime) {
			maxTime = delay;
		}
		
		[sprite runAction:[CCSequence actions:
						   [CCDelayTime actionWithDuration:delay],
						   [CCCallFuncO actionWithTarget:self selector:@selector(explodeSymbol:) object:sprite],
						   nil ]];
	}
	
	// show transition labels
    int numHits = [sprites4explote count] / 3; 
	[machine.frontLayer showBigScore:[NSString stringWithFormat:@"+ %i Hits",numHits] delay:maxTime];
    
	// start next phase
	[tracksLayer runAction: [CCSequence actions:
                             [CCDelayTime actionWithDuration: maxTime + 1],
                             [CCCallFuncO actionWithTarget:self selector:@selector(startNextPhase:) object:[NSNumber numberWithInt:numHits] ],
                             nil ]];
}

-(void) startNextPhase:(NSNumber *)addhits
{
	strikeGesture.enabled = YES;
	isTimeEnabled = YES;
	[tracksLayer run];
    hits += [addhits intValue];
    [self updateMachineStatus];    
}

-(void) explodeSymbol:(SymbolSprite *) sprite
{
	// variance = 30;
	//[sprite.userData setEnabled: NO];
     //[Track updateSpriteFrame:sprite];
    sprite.symbol.enabled = NO;
    
	[self runEffect:[sprite.userData character]  atPosition:sprite.position withVar:20 ];
	[[SimpleAudioEngine sharedEngine] playEffect:currentSndEffect];
	[self addPoints:45];
	[machine.frontLayer  updateBigScore:[NSString stringWithFormat:@"%i",totalScore] ];
	[sprite runAction: [CCSequence actions:
						[CCFadeOut actionWithDuration:3],
						nil	] ];
}
*/

@end

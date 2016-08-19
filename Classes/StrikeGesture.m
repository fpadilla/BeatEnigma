//
//  StrikeGesture.m
//  iNigma
//
//  Created by Francisco Padilla on 4/15/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "StrikeGesture.h"
#import	"Machine.h"
#import	"GameFlow.h"
#import "SymbolSprite.h"
#import "Laser.h"

@implementation StrikeGesture

@synthesize tracks, gameMechanics, enabled;

#define minDragVelocity 4 // 100
#define minSlope 0.38
#define minDistance 150
#define STREAK_WIDTH 40

-(id) init
{
    if (self = [super init]) {
        debugString = [[[NSMutableString alloc] init] retain];
    } 
    return self;
}

-(BOOL) trackTouch:(UITouch*)touch
{
    CGPoint touchLocation = [StrikeGesture locationFromTouch:touch];

    if( CGRectContainsPoint( CGRectMake(50, 50, 400, 211), touchLocation) ){
        if (!getureInProgress) {
            firstTouchLocation = CGPointZero;
            SymbolSprite *selectedSprite = [self selectSpriteAtLocation:touchLocation];
            if (selectedSprite) {
                getureInProgress = YES;
                firstTouchLocation = touchLocation;
                lastTouchLocation = touchLocation;
                blade = [CCBlade bladeWithMaximumPoint:17];
                blade.autoDim = YES;
                blade.texture = [[CCTextureCache sharedTextureCache] addImage:@"pointer.png"];
                                
                [gameMechanics.machine.frontLayer addChild:blade];
                [blade push:touchLocation];

            }
        } else {
            currTouchLocation = ccp(touchLocation.x, firstTouchLocation.y);
            float deltaX = 40.0;
            if ( abs(currTouchLocation.x - lastTouchLocation.x) >  deltaX ){
                
                int numSteps = abs(currTouchLocation.x - lastTouchLocation.x)/deltaX;
                deltaX = deltaX * sign(currTouchLocation.x - lastTouchLocation.x);
                for (int i = 1; i <= numSteps; i++ ){
                    CGPoint interpolative = CGPointMake(lastTouchLocation.x + i*deltaX, lastTouchLocation.y );
                    [self selectSpriteAtLocation:interpolative];
                    [blade push:currTouchLocation];
                }
            }
            [self selectSpriteAtLocation:currTouchLocation];
            [blade push:currTouchLocation];
            
            lastTouchLocation = currTouchLocation;
        }
        
	}
}

-(BOOL) ccTouchBegan:(UITouch*)touch withEvent:(UIEvent *)event
{
	if (!enabled || (gameMechanics.mode==TIMELESS && gameMechanics.turns <= 0) ) {
		return NO;
	}
    
    [self trackTouch:touch];
    
	return YES;
}

-(void) ccTouchMoved:(UITouch*)touch withEvent:(UIEvent *)event
{
    [self trackTouch:touch];
}

-(void) ccTouchEnded:(UITouch*)touch withEvent:(UIEvent *)event
{
	/*if ( ! getureInProgress ) {
		return;
	}*/
	
    if (!getureInProgress) {
        return;
    }
    
	if ( !enabled ) {
		[self cancelTouch];
		return;
	}
    
    if (gameMechanics.mode == TIMELESS) {
        [gameMechanics.tracksLayer run];
    }

    [self trackTouch:touch];

	if ( [self validateSelectedSymbols] ) {
       [self disableSelectedSprites];
    } else {
        [self cancelTouch];
    }
    
	getureInProgress = FALSE;
    [blade dim:YES];
    
    if (gameMechanics.mode == TIMELESS) {
        self.enabled = NO;
    }
}

-(BOOL) validateSelectedSymbols
{
    TracksLayer *tracksLayer = gameMechanics.tracksLayer;
    int columnIndex = 0;
    NSMutableArray *sprites = [NSMutableArray arrayWithCapacity:[tracksLayer.tracks count]];
    BOOL startedSegment = NO;
	for ( Track *track  in tracksLayer.tracks ) {
        if ( track.selectedSprite != nil ) {
            [sprites insertObject:track.selectedSprite atIndex:columnIndex++];
            startedSegment = YES;
        } else if(startedSegment) {
            break;
        }
    }
    
    CGPoint avgPosition = [gameMechanics avgPosition4Sprites:sprites];
    
    BOOL validHit = [gameMechanics validateSymbolSprites:sprites withSubHits:NO];
    if (validHit && [sprites count] > 5) {
        
        // Laser Setup
        TracksLayer *tracksLayer = gameMechanics.tracksLayer;
        Laser *laser = [[Laser alloc] initWithSprites:sprites ];
        
        float y = 0;
        if (gameMechanics.mode == BLITZ) {
            y = (firstTouchLocation.y+lastTouchLocation.y)/2;
        } else {
            y = avgPosition.y;
        }
        laser.position = ccp(avgPosition.x,y);
        [tracksLayer addChild:laser];
    } 
    
    if (!validHit) {
        [[SimpleAudioEngine sharedEngine] playEffect:@"disenchant.caf" pitch:1.0 pan:0.0 gain:0.6];
    }
    gameMechanics.turns--;
    return validHit;
    
}

-(CCSprite*) selectSpriteAtLocation:(CGPoint) location
{
    CGSize spriteSize = CGSizeMake(57, 51);
    int trackIndex = 0;
    float margin = 5;
	for( Track *track  in self.tracks ){
        trackIndex ++;
		for (SymbolSprite *sprite in track.sprites) {
			if ( CGRectContainsPoint( CGRectMake(sprite.position.x - spriteSize.width /2 + margin,
												 sprite.position.y - spriteSize.height/2 + margin,
												 track.trackWidth - margin,
												 spriteSize.height - margin)
									 , location) ){
				if ( sprite != nil ){
                    Symbol * symbol = sprite.symbol;
                    //if(sprite.isOnScanner) NSLog(@"isOnScanner");
                    if ( symbol.character == 'M' ) {
                        [track burn];
                        [[SimpleAudioEngine sharedEngine] playEffect:@"machineLaught.caf" pitch:1.0 pan:0 gain:0.45];
                        [gameMechanics.machine.frontLayer showParticules:@"mineExplosion.plist" atLocation:ccp(sprite.position.x, 160) variance:ccp(20,100)];

                        [self burnSelectedSymbols];

                    } else if(symbol.enabled && symbol != [Symbol emptySymbol] && !sprite.isOnScanner) {
                        track.selectedSprite = sprite;
                    }
                    return sprite;                    
				} else {
					return nil;
				}
			} //if contain point
		}// for
	}
	return nil;
}


+(CGPoint) locationFromTouch:(UITouch*)touch
{
	CGPoint touchLocation = [touch locationInView: [touch view]];
	return [[CCDirector sharedDirector] convertToGL:touchLocation];
}

#pragma mark effects

-(void) disableSelectedSprites
{
	for ( Track *track  in self.tracks ) {
		[ track disableSelectedSprite ];
	}
}

-(void) burnSelectedSymbols
{
    for (Track* track in tracks) {
        if (track.selectedSprite != nil) {
            SymbolSprite *sprite = track.selectedSprite;
            sprite.isSelected = NO;
            if (sprite.symbol == [Symbol emptySymbol]) {
                sprite.symbol = [Symbol simbolWithCharacter:'M'];
            }
            sprite.symbol.character = 'M';
            [sprite updateSpriteFrame];
            //Symbol *symbol = sprite.userData;
            track.selectedSprite = nil;
            //symbol.character = 'M';
            [sprite updateSpriteFrame];
        }
    } 
}
    
-(void) check4TouchTimeOver
{
	NSTimeInterval now =  [[NSProcessInfo processInfo] systemUptime];
	
}

-(void) cancelTouch
{
	getureInProgress = FALSE;
	for( Track *track  in self.tracks ){
		track.selectedSprite = nil;
	}
}

-(void) dealloc
{
    [debugString release];
    [super dealloc];
}



@end

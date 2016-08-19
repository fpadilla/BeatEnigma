//
//  Track.m
//  iNigma
//
//  Created by Francisco Padilla on 3/17/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Track.h"
#import "HitGenerator.h";
#import "SymbolSprite.h"

@implementation Track

@synthesize status;
@synthesize speed;
@synthesize pausedTime;
@synthesize sprites;
@synthesize position;
@synthesize rows;
@synthesize accelerometerSensibility;
@synthesize disacceleration;
@synthesize maxSpeed;
@synthesize symbols;
@synthesize trackWidth;
@synthesize index;
@synthesize isPerfectLevel;

CGSize symbolSize;

static float random2spaceRatio = 0;
+(float) random2spaceRatio
{
	return random2spaceRatio;
}

+(void) setRandom2spaceRatio: (float)newRatio
{
	random2spaceRatio = newRatio;
}

-(id) initWithLayer:(TracksLayer*) trackLayer position: (CGPoint)trackPosition
{
	layer = trackLayer;
	self.position = trackPosition;
	
	status = PAUSED;
	speed = 15;
	pausedTime = 0.5;
	accelerometerSensibility = 0;
	disacceleration = 0;
	maxSpeed = 100;
	
	return self;
}

-(void) setupSprites
{
	CGSize screenSize = [[CCDirector sharedDirector] winSize];
	sprites = [[NSMutableArray alloc] initWithCapacity:rows+1];
	
	// set symbol size
	CCSpriteFrameCache* frameCache = [CCSpriteFrameCache sharedSpriteFrameCache]; 
	CCSpriteFrame *spriteFrameModel = [frameCache spriteFrameByName:@"model"];
	symbolSize = CGSizeMake(57, 51);
	
	for (int j = 0; j < rows + 1; j++) {
		Symbol *symbol = [self nextSymbol];
		int i  = speed < 0 ? j : rows - 1 - j ;
        
		// sprite creation
		/*NSString *frameName = [symbol frameName];
		CCSpriteFrame *spriteFrame = [frameCache spriteFrameByName:frameName];
		CCSprite *sprite = [CCSprite spriteWithSpriteFrame: spriteFrame];	*/
        
        CCSprite *sprite = [SymbolSprite spriteWithSymbol:symbol];
		sprite.userData = symbol;
		[symbol retain];
		
		//CGRect spriteRect = sprite.textureRect;		
		sprite.position = CGPointMake(position.x + (symbolSize.width/2),
									  position.y + symbolSize.height * i + (symbolSize.height/2) );
		[layer addChild:sprite];
		[sprites addObject: sprite];
	}
}
/*
+(void) updateSpriteFrame:(CCSprite *)sprite
{
    // validate userData
	Symbol *symbol = sprite.userData;
	if ( ![symbol isKindOfClass:[ Symbol class ] ] ) {
		NSAssert(NO, @"userData is not Symbol class");
	}
	
    // update spriteframe
	NSString *frameName = [symbol frameName];	
	CCSpriteFrameCache* frameCache = [CCSpriteFrameCache sharedSpriteFrameCache]; 
	CCSpriteFrame *spriteFrame = [frameCache spriteFrameByName:frameName];
	[sprite setDisplayFrame:spriteFrame];
	sprite.opacity = 255; // reset opacity
}

-(void) updateSpriteFrame:(CCSprite *)sprite
{
	Symbol *symbol = sprite.userData;
	if ( ![symbol isKindOfClass:[ Symbol class ] ] ) {
		NSAssert(NO, @"userData is not Symbol class");
	}
	
	NSString *frameName = [symbol frameName];
	if (sprite == selectedSprite) {
		frameName = [NSString stringWithFormat:@"%C-selected.png", symbol.character];
	}
	
	CCSpriteFrameCache* frameCache = [CCSpriteFrameCache sharedSpriteFrameCache]; 
	CCSpriteFrame *spriteFrame = [frameCache spriteFrameByName:frameName];
    NSAssert(spriteFrame != nil, @"Track updateSpriteFrame spriteframe name, %@", frameName);
	[sprite setDisplayFrame:spriteFrame];
	sprite.opacity = 255; // reset opacity
}
*/
-(void) update:(ccTime) dt
{
	if ( maxSpeed < 0 ){
		acumSpeed += disacceleration * dt;
	} else {
		acumSpeed -= disacceleration * dt;
	}
	
	if ( status == RUNING ) {
		float deltaPosition = speed * dt;
		if ( abs(runDistance + deltaPosition) > symbolSize.height ) {
			deltaPosition = ( symbolSize.height - fabs(runDistance) ) * (speed>0?1:-1);
			//pausedTimeInterval = dt - fabs(deltaPosition/speed);
		} 
		
		for (SymbolSprite *sprite in self.sprites) {
			CGPoint curPosition = sprite.position;
			sprite.position = CGPointMake(curPosition.x, curPosition.y + deltaPosition);
		}
		
		runDistance += deltaPosition;		
		if (abs(runDistance) >= symbolSize.height) {
			status = PAUSED;
			runDistance = 0;
			
			SymbolSprite *firstSprite = [self.sprites objectAtIndex:0];
			SymbolSprite *lastSprite  = [self.sprites lastObject];
            CGSize spriteSize = CGSizeMake(57, 51);
			
			[self.sprites removeObjectAtIndex:0];
			[self.sprites addObject:firstSprite];
			
			if (maxSpeed > 0.0f ) {
				firstSprite.position = CGPointMake(self.position.x + (spriteSize.width/2),
												  self.position.y + (spriteSize.height/2) - spriteSize.height);
			} else {

				firstSprite.position = CGPointMake(self.position.x + (spriteSize.width/2),
												   self.position.y + spriteSize.height * rows + (spriteSize.height/2) );
			}
			
            if ( firstSprite.symbol != [Symbol emptySymbol] && firstSprite.symbol.enabled ){
                isPerfectLevel = NO;
            }
                        
			// assign next symbol, skip if current is special
            unichar currChar = firstSprite.symbol.character;
			if ( !firstSprite.symbol.enabled || ( currChar != 'O' && currChar != 'P' && currChar != 'Q' && currChar != 'R') ) {
				firstSprite.symbol = [self nextSymbol];
                [firstSprite updateSpriteFrame];
			}
		}
	} 
}

-(Symbol*) nextSymbol
{
	Symbol *symb;
	int length = [symbols count] ;
	
	if ( length == 0 ){
		symb = [HitGenerator randomSymbol];
	} else {
		// update current index
		if ( index < [symbols count] ) {
			NSObject *obj = [symbols objectAtIndex: index];
			if ( [obj class] != [Symbol class] || obj == [Symbol emptySymbol] ) {
				if ( (unsigned)(arc4random() % 100 + 1) > random2spaceRatio*100 ) {
					obj = [Symbol emptySymbol];
				} else {
					obj = [HitGenerator randomSymbol];
				}
			}
			symb = obj;
            
            if ( symb != [Symbol emptySymbol] ){ // whatever unless the empty symbol
                [symb retain];
            }
			//[symbols replaceObjectAtIndex:index withObject:[Symbol emptySymbol]]; // clear space
			index ++;
		}
        if (index >= [symbols count]) {
            index = 0;
        }
	}
	return symb;
}

-(void)setSelectedSprite:(SymbolSprite*) newSelectedSprite;
{
	if (selectedSprite == newSelectedSprite) {
		return;
	}
	
	SymbolSprite *oldSelectedSprite = selectedSprite;
	selectedSprite = nil;
	if (oldSelectedSprite != nil) {
        oldSelectedSprite.isSelected = NO;
		//[ self updateSpriteFrame:oldSelectedSprite];
	}
	
	selectedSprite = newSelectedSprite;
	if (newSelectedSprite != nil) {
        newSelectedSprite.isSelected = YES;
		//[ self updateSpriteFrame:newSelectedSprite];
	}	
}

-(void)disableSelectedSprite;
{
	// disable current selected sprite -
	if ( selectedSprite != nil) {
		//Symbol * symbol = [selectedSprite userData];
		//symbol.enabled = NO;
        //selectedSprite.symbol.enabled = NO;
        selectedSprite.isSelected = NO;
		// [symbols removeObject:selectedSprite];
		self.selectedSprite = nil; //  change sprite frame 
	}
}

-(SymbolSprite*)selectedSprite;
{
	return selectedSprite;
}

-(BOOL) isEmpty
{
	BOOL result = YES;
	for (SymbolSprite *sprite in self.sprites) {
		result = result && sprite.userData == [Symbol emptySymbol];
	}
	return result;
}


-(void) burn
{
    self.selectedSprite = nil;
	for (SymbolSprite *sprite in self.sprites) {
        if (sprite.symbol == [Symbol emptySymbol]) {
            sprite.symbol = [Symbol simbolWithCharacter:'M'];
        }
        sprite.symbol.character = 'M';
        sprite.symbol.enabled = YES;
        [sprite updateSpriteFrame];
	}
}

@end


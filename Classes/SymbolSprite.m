//
//  SymbolSprite.m
//  iNigma
//
//  Created by Francisco Padilla on 6/26/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SymbolSprite.h"
#import "GameMechanics.h"
#import "Laser.h"

#define LASER_TAG 1300

@implementation SymbolSprite

@synthesize speed, isOnScanner;

+(SymbolSprite*) spriteWithSymbol:(Symbol*) symbol
{
    SymbolSprite *sprite = [[[SymbolSprite alloc] initWithSymbol: symbol] autorelease];
    return sprite;
}

-(SymbolSprite*) initWithSymbol:(Symbol*) symb
{
    if (self=[super init]){
        isSelected = NO;
        self.symbol = symb;
        [self updateSpriteFrame];
    }
    return self;
}

-(void) updateSpriteFrame
{        
    NSString *frameName = [NSString stringWithFormat:@"%C.png", symbol.character];
    
    if (!symbol.enabled  && symbol.character != '_') {
        frameName = [NSString stringWithFormat:@"%C.png", symbol.character];
    } else if (isSelected && symbol.character != '_') {
         frameName = [NSString stringWithFormat:@"%C-selected.png", symbol.character];
    }
        
    CCSpriteFrameCache* frameCache = [CCSpriteFrameCache sharedSpriteFrameCache]; 
    CCSpriteFrame *spriteFrame = [frameCache spriteFrameByName:frameName];
    NSAssert(spriteFrame != nil, @"Track updateSpriteFrame spriteframe name, %@", frameName);
    [self setDisplayFrame:spriteFrame];
    
    if (symbol.enabled) {
        //[self runAction:[CCFadeTo actionWithDuration:0.4 opacity:255 - 5*symbol.index]];
        self.opacity = 255 - 5*symbol.index;
    } else {
        self.opacity = 80;
    }
    
}

-(void) reward
{
    switch (symbol.character) {
        case 'Q': 
            break;
            
        default:
            break;
    }
}

-(void) setIsSelected:(BOOL) selected
{
    isSelected = selected;
    if (!isSelected) {
        [self runAction:[CCSequence actions:[CCDelayTime actionWithDuration:0.7]
                         ,[CCCallFunc actionWithTarget:self selector:@selector(updateSpriteFrame)]
                         , nil]	];
    } else {
        [self updateSpriteFrame];
    }
}

-(BOOL) isSelected
{
    return isSelected;
}

-(void) disableByTime:(float) time
{
    symbol.enabled = NO;
    [self updateSpriteFrame];
    
    [self runAction:[CCSequence actions:
                      [CCDelayTime actionWithDuration:time],
                      [CCCallFunc actionWithTarget:self selector:@selector(enable)],
                      nil ] ];
}

-(void) enable
{
    symbol.enabled = YES;
    [self updateSpriteFrame];   
}
     
-(void) setSymbol:(Symbol *)symb
{    
    if (symbol != nil) {
        [symbol release];
    }
    
    symbol = symb;
    if (symb) {
        [symb retain];
    }
    
    [self updateSpriteFrame];
}


-(Symbol*) symbol
{
    return symbol;
}

@end

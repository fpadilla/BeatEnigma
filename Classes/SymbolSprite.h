//
//  SymbolSprite.h
//  iNigma
//
//  Created by Francisco Padilla on 6/26/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "Symbol.h"

@interface SymbolSprite : CCSprite
{
    float speed;
    BOOL isSelected;
    Symbol *symbol;
    float isOnScanner;
}

@property BOOL isSelected;
@property(retain) Symbol *symbol;
@property(assign) float speed;
@property(assign) float isOnScanner;

+(SymbolSprite*) spriteWithSymbol:(Symbol*) symbol;
-(SymbolSprite*) initWithSymbol:(Symbol*) symbol;
-(void) disableByTime:(float) time;
-(void) updateSpriteFrame;
-(void) reward;

@end

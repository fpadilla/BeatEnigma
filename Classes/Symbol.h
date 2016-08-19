//
//  Symbol.h
//  iNigma
//
//  Created by Francisco Padilla on 3/17/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#define myRandom() (arc4random() % 101)/100

@interface Symbol : NSObject {
	unichar character;
	int index;
	BOOL enabled;
}

@property(assign) int index;
@property(assign) BOOL enabled;
@property(assign) unichar character;

-(id) initWithCharacter:(unichar) character ;
-(NSString*) frameName;
-(NSString*) selectedFrameName;
-(void) sendAchievementsAndScore:(int)score;

+(Symbol*) simbolWithCharacter:(unichar) aCharacter;
+(Symbol*)randomSymbol;
+(Symbol*)emptySymbol;
@end

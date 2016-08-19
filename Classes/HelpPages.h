//
//  HelpPages.h
//  iNigma
//
//  Created by Francisco Padilla on 8/22/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface HelpPages : CCColorLayer {
	int currentPage;
	CCSprite *sprite;
	id target;
	SEL method;
}

+(void) showHelp:(id)object selector:(SEL)method;

-(BOOL) ccTouchBegan:(UITouch*)touch withEvent:(UIEvent *)event;
//-(BOOL) ccTouchBegan:(UITouch*)touch withEvent:(UIEvent *)event;

@end

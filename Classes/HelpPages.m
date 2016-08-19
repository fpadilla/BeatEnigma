//
//  HelpPages.m
//  iNigma
//
//  Created by Francisco Padilla on 8/22/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "HelpPages.h"


@implementation HelpPages

static HelpPages *helpPages;

+(void) showHelp:(id)object selector:(SEL)returnMethod
{
	if ( helpPages == nil) {
		helpPages = [[[HelpPages alloc] init:object selector:returnMethod ] autorelease]; // retain is made by Director
		[[[CCDirector sharedDirector] runningScene] addChild:helpPages];
	}	
	//return helpPages;
}

-(id) init:(id)object selector:(SEL)returnMethod
{
	ccColor4B c = {0,0,0, 200};
	if ( self = [super initWithColor:c] ) {
		currentPage = 1;
		sprite = [CCSprite spriteWithFile:[NSString stringWithFormat:@"HelpPage%i.png", currentPage] ];
		CGSize winSize = [[CCDirector sharedDirector] winSize];
		sprite.position = ccp(winSize.width/2, winSize.height/2);
		self.isTouchEnabled = YES;
		target = object;
		method = returnMethod;
		[self addChild:sprite];
	}
	return self;
}

-(void) registerWithTouchDispatcher 
{
    [[CCTouchDispatcher sharedDispatcher] addTargetedDelegate:self priority:INT_MIN+1 swallowsTouches:YES];
}

-(BOOL) ccTouchBegan:(UITouch*)touch withEvent:(UIEvent *)event
{
	currentPage++;
	if ( currentPage < 7 ) {
		[self removeChild:sprite cleanup:YES];
		sprite = [CCSprite spriteWithFile:[NSString stringWithFormat:@"HelpPage%i.png", currentPage] ];
		CGSize winSize = [[CCDirector sharedDirector] winSize];
		sprite.position = ccp(winSize.width/2, winSize.height/2);
		[self addChild:sprite ];
	}else {
		[[[CCDirector sharedDirector] runningScene] removeChild:helpPages cleanup:YES];
		[target performSelector:method];
		helpPages = nil;
	}

	return YES;
}


@end

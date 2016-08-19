//
//  BackLayer.m
//  iNigma
//
//  Created by Francisco Padilla on 4/15/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "BackLayer.h"


@implementation BackLayer

@synthesize openedTop, openedBottom, openedLeft, openedRight, emoticon, screenBackground;

-(id) initWithParameters:(NSDictionary *)parameters
{
	self = [self initWithColor:ccc4(0, 0, 0x30, 255)];
	
	NSString *devOrientation = @"landscape";
	BOOL isPortraitOrientation = NO;
	if ([[parameters objectForKey:@"portraitOrientation"] intValue] == 1 ) { // Default orientation is landscape
		isPortraitOrientation = YES;
		devOrientation = @"portrait";
	}

    // progress meter
    progressMeter = [[[ProgressMeter alloc] init] autorelease];
    progressMeter.position = ccp(45, 50);
    progressMeter.contentSize = CGSizeMake(400, 210);
	[self addChild:progressMeter];

    CGSize screenSize = [[CCDirector sharedDirector] winSize ];
	CCSpriteFrameCache* frameCache = [CCSpriteFrameCache sharedSpriteFrameCache]; 
		
	// Emoticons initialization
	currentEmoticon = 0;
	emoticonPhases = [[NSMutableArray alloc] initWithCapacity:numEmoticons];
	[emoticonPhases addObject:[NSNumber numberWithInt: arc4random()%3 +2 ]];
	[emoticonPhases addObject:[NSNumber numberWithInt: arc4random()%3 +5 ]];
	[emoticonPhases addObject:[NSNumber numberWithInt: arc4random()%2 +8 ]];
	[emoticonPhases addObject:[NSNumber numberWithInt: arc4random()%5 +10 ]];
	[emoticonPhases addObject:[NSNumber numberWithInt: arc4random()%3 +15 ]];
	
	CCSpriteFrame *spriteFrame = [frameCache spriteFrameByName:[NSString stringWithFormat:@"eyes-%i.png", currentEmoticon] ];
    NSAssert(spriteFrame != nil, @"sprite frame %@ in %@, %@", 
             [NSString stringWithFormat:@"eyes-%i.png", currentEmoticon], self, _cmd);

	emoticon = [CCSprite spriteWithSpriteFrame:spriteFrame ] ;
	emoticon.visible = NO;
	emoticon.position = ccp( screenSize.width/2, screenSize.height/2 );
	[self addChild:emoticon];
    
    screenBackground = [CCSprite spriteWithSpriteFrame:[frameCache spriteFrameByName:@"screen-background.png" ]];
    screenBackground.position = ccp( screenSize.width/2, screenSize.height/2);
    //screenBackground.opacity = 240;
    [self addChild:screenBackground];
    
	return self;
}

-(void) showEmoticon:(int)phase
{
	if ( currentEmoticon >= numEmoticons ) {
		return;
	}
	
	int currPhase = [[emoticonPhases objectAtIndex:currentEmoticon] intValue];
	// NSLog(@"emoticon phase: %i", currPhase);
	if ( phase != currPhase) {
		return;
	}
	
	CCSpriteFrameCache* frameCache = [CCSpriteFrameCache sharedSpriteFrameCache];
	CGSize screenSize = [[CCDirector sharedDirector] winSize ];
    
	[emoticon setDisplayFrame:[frameCache spriteFrameByName:[NSString stringWithFormat:@"eyes-%i.png", currentEmoticon] ] ];
	emoticon.visible = YES;
	emoticon.opacity = 1;
	[emoticon runAction:[CCFadeIn actionWithDuration:1.6]];
	currentEmoticon++;	
}

-(void) hideEmoticon
{
	if (emoticon.opacity != 0) {
		[emoticon runAction:[CCFadeOut actionWithDuration:3]];
	}
}

-(void) showEmoticonStatus:(float) status
{
    int emoticonIndex = (int)(status * 3 +1);

	CCSpriteFrameCache* frameCache = [CCSpriteFrameCache sharedSpriteFrameCache];
	CGSize screenSize = [[CCDirector sharedDirector] winSize ];
    
	[emoticon setDisplayFrame:[frameCache spriteFrameByName:[NSString stringWithFormat:@"eyes-%i.png", emoticonIndex] ] ];
	emoticon.visible = YES;
	emoticon.opacity = 50;
	[emoticon runAction:[CCFadeIn actionWithDuration:1.6]];
}

-(void) runAnimations:(float) damagePercent
{
	
}

-(void) updateProgressMeter:(float) newValue
{
    progressMeter.value = newValue;
}

#pragma mark Slow Motion
@end

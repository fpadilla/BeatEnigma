//
//  ButtonLayer.m
//  iNigma
//
//  Created by Francisco Padilla on 12/3/12.
//
//

#import "ButtonLayer.h"
#import "GameFlow.h"

@implementation ButtonLayer

-(id) initButtonLayer
{
    
    addTimeButton = [[AddTimeButton alloc] initAddTimeButton];
    addTimeButton.position = ccp(25, 25);
    
    destroyMineButton = [[DestroyMineButton alloc] initDestroyMineButton];
    destroyMineButton.position = ccp(475,305);
    
    pauseButton = [CCMenuItemSprite
                                     itemFromNormalSprite:[CCSprite spriteWithSpriteFrameName:@"pause-normal.png"]
                                     selectedSprite:[CCSprite spriteWithSpriteFrameName:@"pause-selected.png"]
                                     target:[GameFlow sharedGameFlow]
                                     selector:@selector(pause)
                                     ];
    pauseButton.position = ccp(25,287);
    
    if (self  = [self initWithItems:addTimeButton, destroyMineButton, pauseButton, nil] ){
        self.anchorPoint = ccp(0,0);
        self.position = ccp(0,0);
    }
    return self;
}

-(id) initWithItems:(CCMenuItem *)item, ...
{
    va_list args;
    va_start(args, item);
    self  = [self initWithItems:addTimeButton vaList:args];
    va_end(args);
    return self;    
}

@end

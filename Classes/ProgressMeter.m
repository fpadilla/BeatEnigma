//
//  ProgressMeter.m
//  iNigma
//
//  Created by Francisco Padilla on 11/7/12.
//
//

#import "ProgressMeter.h"

@implementation ProgressMeter

-(id) init
{
    if (self=[super init]) {
        bar = [[CCLayerColor alloc] initWithColor:ccc4(0, 0, 0x60, 255)];
        bar.anchorPoint = ccp(0, 0);
        bar.position = ccp(0, 0);
        self.value = 0;
        [self addChild:bar];
    }
    return self;
}

-(void) dealloc
{
    [super dealloc];
    [bar release];
}

-(float) value
{
    return value;
}

-(void) setValue:(float)newValue
{
    value = newValue;
    float height = self.contentSize.height * (value>1.0 ? 1 : value);
    bar.contentSize = CGSizeMake(self.contentSize.width, height);
    if (value < 0.1)
        bar.color = ccc3(0x99, 0, 0);
    else if( value < 0.2 )
        bar.color = ccc3(0x66, 0, 0);
    else if( value < 0.3 ) {
        if (!blinkAction) {
            blinkAction = [CCBlink actionWithDuration:60.0f blinks:120];
            [bar runAction:blinkAction];
        }
        bar.color = ccc3(0x33, 0, 0x60);
    } else {
        bar.color = ccc3(0, 0, 0x60);
        if (blinkAction) {
            [bar stopAllActions];
            blinkAction = nil;
        }
        bar.opacity = 255;
        bar.visible = YES;
        
    }
        
}

@end

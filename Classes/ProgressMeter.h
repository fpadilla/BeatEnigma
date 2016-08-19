//
//  ProgressMeter.h
//  iNigma
//
//  Created by Francisco Padilla on 11/7/12.
//
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
 
@interface ProgressMeter : CCLayer
{
    float value;
    CCLayerColor *bar;
    CCAction *blinkAction;
}

@property(assign) float value;
 
-(id) init;
 
@end
